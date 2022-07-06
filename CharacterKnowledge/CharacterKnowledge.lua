local LCCC = LibCodesCommonCode
local LCK = LibCharacterKnowledge

CharacterKnowledge = {
	name = "CharacterKnowledge",

	title = GetString(SI_CK_TITLE),
	version = "1.3.7",
	url = "https://www.esoui.com/downloads/info2938.html",

	-- Default settings
	defaults = {
		filterId = 1,
		tooltips = {
			itemColors = {
				[LCK.KNOWLEDGE_KNOWN] = 0x00FF00,
				[LCK.KNOWLEDGE_UNKNOWN] = 0xFF0000,
			},
			charColors = {
				[LCK.KNOWLEDGE_NODATA] = 0x333333,
				[LCK.KNOWLEDGE_KNOWN] = 0x3399FF,
				[LCK.KNOWLEDGE_UNKNOWN] = 0x777766,
			},
			enabled = true,
		},
		featureRev = 0,
	},

	-- Default settings, server-specific
	serverDefaults = {
		tooltips = {
			pinnedCharsForChapters = 1,
		},
	},

	linkHandlers = { },

	charId = GetCurrentCharacterId(),
	libReady = false,
}
local CharacterKnowledge = CharacterKnowledge

local function OnAddOnLoaded( eventCode, addonName )
	if (addonName ~= CharacterKnowledge.name) then return end

	EVENT_MANAGER:UnregisterForEvent(CharacterKnowledge.name, EVENT_ADD_ON_LOADED)

	CharacterKnowledge.vars = ZO_SavedVars:NewAccountWide("CharacterKnowledgeSavedVariables", 1, nil, CharacterKnowledge.defaults, nil, "$InstallationWide")
	CharacterKnowledge.serverVars = ZO_SavedVars:NewAccountWide("CharacterKnowledgeSavedVariables", 1, nil, CharacterKnowledge.serverDefaults, nil, LCCC.GetServerName())
	CharacterKnowledge.RegisterSettingsPanel()

	LINK_HANDLER:RegisterCallback(LINK_HANDLER.LINK_MOUSE_UP_EVENT, CharacterKnowledge.OnLinkClick)
	CharacterKnowledge.linkHandlers["cklck"] = LCK.OpenSettingsPanel
	CharacterKnowledge.linkHandlers["ckweb"] = function() RequestOpenUnsafeURL(CharacterKnowledge.url) end

	LCK.RegisterForCallback(CharacterKnowledge.name, LCK.EVENT_INITIALIZED, function( )
		CharacterKnowledge.libReady = true
		CharacterKnowledge.RunOnce()
	end)

	CharacterKnowledge.InitializeBrowser()
end

function CharacterKnowledge.OnLinkClick( rawLink, mouseButton, linkText, linkStyle, linkType, ... )
	if (type(linkType) == "string" and CharacterKnowledge.linkHandlers[linkType]) then
		CharacterKnowledge.linkHandlers[linkType](...)
		return true
	end
end

function CharacterKnowledge.RunOnce( )
	-- Special one-time actions for fresh installs or upgrades
	local CURRENT_FEATURE_REV = 1

	if (CharacterKnowledge.vars.featureRev < 1) then
		CHAT_ROUTER:AddSystemMessage(GetString(SI_CK_WELCOME))
	end

	CharacterKnowledge.vars.featureRev = CURRENT_FEATURE_REV
end

function CharacterKnowledge.RegisterSettingsPanel( )
	local LAM = LibAddonMenu2

	if (LAM) then
		local panelId = "CharacterKnowledgeSettings"

		CharacterKnowledge.settingsPanel = LAM:RegisterAddonPanel(panelId, {
			type = "panel",
			name = CharacterKnowledge.title,
			version = CharacterKnowledge.version,
			author = "@code65536",
			website = CharacterKnowledge.url,
			donation = CharacterKnowledge.url .. "#donate",
			registerForRefresh = true,
		})

		local itemColors = CharacterKnowledge.vars.tooltips.itemColors
		local charColors = CharacterKnowledge.vars.tooltips.charColors
		local UnpackRGB = LCCC.Int24ToRGB
		local PackRGB = LCCC.RGBToInt24

		LAM:RegisterOptionControls(panelId, {
			--------------------------------------------------------------------
			{
				type = "description",
				text = SI_CK_SETTINGS_DESCRIPTION,
				enableLinks = LCK.OpenSettingsPanel,
			},

			--------------------------------------------------------------------
			{
				type = "header",
				name = SI_CK_SETTINGS_SECTION_TTCHAP,
			},
			--------------------
			{
				type = "slider",
				name = SI_CK_SETTINGS_SETTING_PINNED,
				min = 0,
				max = 6,
				getFunc = function() return CharacterKnowledge.serverVars.tooltips.pinnedCharsForChapters end,
				setFunc = function(number) CharacterKnowledge.serverVars.tooltips.pinnedCharsForChapters = number end,
				tooltip = SI_CK_SETTINGS_TOOLTIP_PINNED,
			},
			--------------------
			{
				type = "colorpicker",
				name = SI_CK_SETTINGS_SETTING_KNOWN,
				getFunc = function() return UnpackRGB(itemColors[LCK.KNOWLEDGE_KNOWN]) end,
				setFunc = function(...) itemColors[LCK.KNOWLEDGE_KNOWN] = PackRGB(...) end,
			},
			--------------------
			{
				type = "colorpicker",
				name = SI_CK_SETTINGS_SETTING_UNKNOWN,
				getFunc = function() return UnpackRGB(itemColors[LCK.KNOWLEDGE_UNKNOWN]) end,
				setFunc = function(...) itemColors[LCK.KNOWLEDGE_UNKNOWN] = PackRGB(...) end,
			},

			--------------------------------------------------------------------
			{
				type = "header",
				name = SI_CK_SETTINGS_SECTION_TTCHAR,
			},
			--------------------
			{
				type = "colorpicker",
				name = SI_CK_SETTINGS_SETTING_KNOWN,
				getFunc = function() return UnpackRGB(charColors[LCK.KNOWLEDGE_KNOWN]) end,
				setFunc = function(...) charColors[LCK.KNOWLEDGE_KNOWN] = PackRGB(...) end,
			},
			--------------------
			{
				type = "colorpicker",
				name = SI_CK_SETTINGS_SETTING_UNKNOWN,
				getFunc = function() return UnpackRGB(charColors[LCK.KNOWLEDGE_UNKNOWN]) end,
				setFunc = function(...) charColors[LCK.KNOWLEDGE_UNKNOWN] = PackRGB(...) end,
			},
			--------------------
			{
				type = "colorpicker",
				name = SI_CK_SETTINGS_SETTING_NODATA,
				getFunc = function() return UnpackRGB(charColors[LCK.KNOWLEDGE_NODATA]) end,
				setFunc = function(...) charColors[LCK.KNOWLEDGE_NODATA] = PackRGB(...) end,
			},

			--------------------------------------------------------------------
			{
				type = "header",
				name = SI_CK_SETTINGS_SECTION_TTEXT,
			},
			--------------------
			{
				type = "checkbox",
				name = SI_CK_SETTINGS_SETTING_TT,
				getFunc = function() return CharacterKnowledge.vars.tooltips.enabled end,
				setFunc = function( enabled )
					CharacterKnowledge.vars.tooltips.enabled = enabled
					if (enabled) then
						CharacterKnowledge.HookExternalTooltips()
					end
				end,
			},
		})
	end
end

EVENT_MANAGER:RegisterForEvent(CharacterKnowledge.name, EVENT_ADD_ON_LOADED, OnAddOnLoaded)
