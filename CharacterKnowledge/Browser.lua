local LCK = LibCharacterKnowledge
local LEJ = LibExtendedJournal
local CharacterKnowledge = CharacterKnowledge


--------------------------------------------------------------------------------
-- Extended Journal
--------------------------------------------------------------------------------

local TAB_NAME = "CharacterKnowledge"
local FRAME = CharacterKnowledgeFrame
local DATA_TYPE = 1
local SORT_TYPE = 1

local Initialized = false
local Dirtiness = 0
local ContextMenuItems = { }

function CharacterKnowledge.InitializeBrowser( )
	LEJ.RegisterTab(TAB_NAME, {
		name = SI_CK_TITLE,
		order = 300,
		iconPrefix = "/esoui/art/journal/journal_tabicon_lorelibrary_",
		control = FRAME,
		settingsPanel = CharacterKnowledge.settingsPanel,
		binding = "CHARACTERKNOWLEDGE",
		slashCommands = { "/characterknowledge", "/ck" },
		callbackShow = function( )
			CharacterKnowledge.LazyInitializeBrowser()
			CharacterKnowledge.RefreshBrowser(true)
		end,
	})

	CharacterKnowledge.linkHandlers["ckbrowser"] = function() LEJ.Show(TAB_NAME) end
end

function CharacterKnowledge.LazyInitializeBrowser( )
	if (not Initialized and CharacterKnowledge.libReady) then
		Initialized = true
		CharacterKnowledge.list = CharacterKnowledgeList:New(FRAME, ContextMenuItems)
		LCK.RegisterForCallback(CharacterKnowledge.name, LCK.EVENT_UPDATE_REFRESH, function( eventCode, refreshCharacters )
			if (refreshCharacters) then
				Dirtiness = 2
			elseif (Dirtiness == 0) then
				Dirtiness = 1
			end
			CharacterKnowledge.RefreshBrowser()
		end)
	end
end

function CharacterKnowledge.RefreshBrowser( noActiveCheck )
	if (Initialized and Dirtiness > 0 and (noActiveCheck or LEJ.IsTabActive(TAB_NAME))) then
		if (Dirtiness == 1) then
			CharacterKnowledge.list:RefreshKnowledge(false, true)
		else
			CharacterKnowledge.list:RefreshCharacterList()
		end
		Dirtiness = 0
	end
end


--------------------------------------------------------------------------------
-- Register Context Menu
--------------------------------------------------------------------------------

function CharacterKnowledge.RegisterContextMenuItem( func )
	table.insert(ContextMenuItems, func)
end

CharacterKnowledge.RegisterContextMenuItem(function( data )
	if (data.itemId) then
		return SI_ITEM_ACTION_LINK_TO_CHAT, function( )
			ZO_LinkHandler_InsertLink(LCK.GetItemLinkFromItemId(data.itemId, LINK_STYLE_BRACKETS))
		end
	end
end)

CharacterKnowledge.RegisterContextMenuItem(function( data )
	if (data.resultId) then
		return SI_CK_LINK_RESULT, function( )
			ZO_LinkHandler_InsertLink(LCK.GetItemLinkFromItemId(data.resultId, LINK_STYLE_BRACKETS))
		end
	end
end)


--------------------------------------------------------------------------------
-- Local Utilities
--------------------------------------------------------------------------------

local function FormatZoneName( zoneId )
	return zo_strformat("<<C:1>>", GetZoneNameById(zoneId))
end

local function GetAchievementCategoryName( achievementId )
	local name = GetAchievementSubCategoryInfo(GetCategoryInfoFromAchievementId(achievementId))
	return name
end

local SPECIAL_RECIPES = {
	{	-- Experience
		GetString(SI_LOOT_HISTORY_EXPERIENCE_GAIN),
		64223, 115029, 120077, 171324, 171331, 171435,
	},
	{	-- Wrothgar
		FormatZoneName(684),
		71060, 71061, 71062, 71063,
	},
	{	-- Witches Festival
		GetAchievementCategoryName(1546),
		87682, 87683, 87684, 87688, 87689, 87692, 87693, 87694, 87698, 153624, 153626, 153628,
	},
	{	-- New Life Festival
		GetAchievementCategoryName(1677),
		96960, 96961, 96962, 96963, 96964, 96965, 96966, 96967, 96968,
	},
	{	-- Jester's Festival
		GetAchievementCategoryName(1723),
		120767, 120768, 120769, 120770,
	},
	{	-- Clockwork City
		FormatZoneName(980),
		133551, 133552, 133553,
	},
	{	-- Artaeum
		FormatZoneName(1027),
		139012, 139017,
	},
}

local MAX_LEVEL = GetMaxLevel()

local function SetRatioColor( control, ratio )
	control.nonRecolorable = true
	if (ratio == 1) then
		control:SetColor(0, 1, 0, 1)
	elseif (ratio == 0) then
		control:SetColor(1, 0, 0, 1)
	else
		control:SetColor(1, 1, 0, 1)
	end
end


--------------------------------------------------------------------------------
-- CharacterKnowledgeList
--------------------------------------------------------------------------------

CharacterKnowledgeList = ExtendedJournalSortFilterList:Subclass()
local CharacterKnowledgeList = CharacterKnowledgeList

function CharacterKnowledgeList:Setup( )
	ZO_ScrollList_AddDataType(self.list, DATA_TYPE, "CharacterKnowledgeListRow", 30, function(...) self:SetupItemRow(...) end)
	ZO_ScrollList_EnableHighlight(self.list, "ZO_ThinListHighlight")
	self:SetAlternateRowBackgrounds(true)

	self.masterList = { }

	local sortKeys = {
		["name"]       = { caseInsensitive = true },
		["quality"]    = { isNumeric = true, tiebreaker = "extended", tieBreakerSortOrder = ZO_SORT_ORDER_UP },
		["extended"]   = { caseInsensitive = true, tiebreaker = "name", tieBreakerSortOrder = ZO_SORT_ORDER_UP },
		["ratioKnown"] = { isNumeric = true, tiebreaker = "extended", tieBreakerSortOrder = ZO_SORT_ORDER_UP },
		["totalChars"] = { isNumeric = true, tiebreaker = "extended", tieBreakerSortOrder = ZO_SORT_ORDER_UP },
		["ratioChars"] = { isNumeric = true, tiebreaker = "totalChars" },
	}

	self.currentSortKey = "extended"
	self.currentSortOrder = ZO_SORT_ORDER_UP
	self.sortHeaderGroup:SelectAndResetSortForKey(self.currentSortKey)
	self.sortFunction = function( listEntry1, listEntry2 )
		return ZO_TableOrderingFunction(listEntry1.data, listEntry2.data, self.currentSortKey, sortKeys, self.currentSortOrder)
	end

	self.filterDrop = ZO_ComboBox_ObjectFromContainer(self.frame:GetNamedChild("FilterDrop"))
	self:InitializeComboBox(self.filterDrop, { list = LCK.ITEM_CATEGORIES }, CharacterKnowledge.vars.filterId)

	self.searchBox = self.frame:GetNamedChild("SearchFieldBox")
	self.searchBox:SetHandler("OnTextChanged", function() self:RefreshFilters() end)
	self.search = self:InitializeSearch(SORT_TYPE)

	local control = self.frame:GetNamedChild("ServerDrop")
	control:GetNamedChild("Caption"):SetText(GetString(SI_LEJ_SERVER))
	self.serverDrop = ZO_ComboBox_ObjectFromContainer(control)
	self:InitializeComboBox(self.serverDrop, { list = LCK.GetServerList() }, nil, nil, function() self:RefreshCharacterList() end)

	local control = self.frame:GetNamedChild("CharacterDrop")
	control:GetNamedChild("Caption"):SetText(GetString(SI_CK_CHARACTER_CAPTION))
	self.characterDrop = ZO_ComboBox_ObjectFromContainer(control)
	self:RefreshCharacterList(true)

	self:RefreshData()
end

function CharacterKnowledgeList:BuildMasterList( )
	self.masterList = { }

	--------
	-- Motifs
	--------

	for _, styleId in ipairs(LCK.GetMotifStyles()) do
		if (GetItemStyleMaterialLink(styleId) ~= "") then
			local items = LCK.GetMotifItemsFromStyle(styleId)

			table.insert(self.masterList, {
				type = SORT_TYPE,
				category = LCK.ITEM_CATEGORY_MOTIF,
				styleId = styleId,
				itemId = items.books[1],
				name = zo_strformat("<<t:1>>", GetItemStyleName(styleId)),
				motifNumber = items.number,
				motifCrown = items.crown,
				extended = tostring(items.number),
				quality = LCK.GetMotifStyleQuality(styleId),
				chapters = (#items.chapters > 0) and items.chapters or nil,
			})
		end
	end

	--------
	-- Recipes and plans
	--------

	-- Sourcing information for special recipes
	local special = { }
	for _, group in ipairs(SPECIAL_RECIPES) do
		local label
		for i, id in ipairs(group) do
			if (i == 1) then
				label = id
			else
				special[id] = label
			end
		end
	end

	-- Blueprints, Praxis, etc.
	local planTypes = { }
	for i = 1, CRAFTING_TYPE_MAX_VALUE do
		planTypes[i] = zo_strformat("<<z:1>>", GetString("SI_RECIPECRAFTINGSYSTEM", GetTradeskillRecipeCraftingSystem(i)))
	end

	local unique = { }
	for _, category in ipairs({ LCK.ITEM_CATEGORY_RECIPE, LCK.ITEM_CATEGORY_PLAN }) do
		for _, itemId in ipairs(LCK.GetItemIdsForCategory(category)) do
			local itemLink = LCK.GetItemLinkFromItemId(itemId)
			local resultLink = GetItemLinkRecipeResultItemLink(itemLink)
			local resultId = GetItemLinkItemId(resultLink)

			if (not unique[resultId]) then
				unique[resultId] = true

				local extended, level, planType
				if (category == LCK.ITEM_CATEGORY_RECIPE) then
					extended = special[itemId]
					if (not extended) then
						level = GetItemLinkRequiredLevel(resultLink)
						if (level == MAX_LEVEL) then
							level = level + GetItemLinkRequiredChampionPoints(resultLink)
						end
						extended = tostring(level)
					end
				else
					extended = GetFurnitureCategoryName(select(2, GetFurnitureDataCategoryInfo(GetItemLinkFurnitureDataId(resultLink))))
					planType = planTypes[GetItemLinkRecipeCraftingSkillType(itemLink)]
				end

				table.insert(self.masterList, {
					type = SORT_TYPE,
					category = category,
					itemId = itemId,
					resultId = resultId,
					name = LCK.GetItemName(resultLink),
					extended = extended,
					planType = planType,
					level = level,
					quality = GetItemLinkFunctionalQuality(itemLink),
				})
			end
		end
	end

	self:RefreshKnowledge(true)
end

function CharacterKnowledgeList:RefreshKnowledge( initial, invalidateCharColumn )
	if (invalidateCharColumn) then
		self.charColumnValid = false
	end

	for _, data in ipairs(self.masterList) do
		if (data.chapters) then
			data.known = 0
			for _, itemId in ipairs(data.chapters) do
				if (LCK.GetItemKnowledgeForCharacter(itemId, self.server, self.charId) == LCK.KNOWLEDGE_KNOWN) then
					data.known = data.known + 1
				end
			end
			data.ratioKnown = data.known / #data.chapters
		else
			data.ratioKnown = (LCK.GetItemKnowledgeForCharacter(data.itemId, self.server, self.charId) == LCK.KNOWLEDGE_KNOWN) and 1 or 0
		end
	end

	self:RefreshCharactersColumn()

	if (not initial) then
		self:RefreshFilters()
	end
end

function CharacterKnowledgeList:RefreshCharactersColumn( )
	if (self.charColumnValid or self.charColumnScanning) then return end
	self.charColumnScanning = true

	-- The characters column update is expensive and needs to happen asynchronously
	local identifier = CharacterKnowledge.name .. "Async"
	local blockSize = 100
	local throttleRate = 50
	local startIndex = 1

	EVENT_MANAGER:RegisterForUpdate(identifier, throttleRate, function( )
		local stopIndex = startIndex + blockSize
		for i = startIndex, stopIndex - 1 do
			local data = self.masterList[i]
			data.totalChars = 0
			data.knownChars = 0
			for _, character in ipairs(LCK.GetItemKnowledgeList(data.itemId or { styleId = data.styleId }, self.server)) do
				data.totalChars = data.totalChars + 1
				if (character.knowledge == LCK.KNOWLEDGE_KNOWN) then
					data.knownChars = data.knownChars + 1
				end
			end
			data.ratioChars = (data.totalChars > 0) and data.knownChars / data.totalChars or 1

			if (i >= #self.masterList) then
				EVENT_MANAGER:UnregisterForUpdate(identifier)
				self.charColumnValid = true
				self.charColumnScanning = false
				return self:RefreshFilters()
			end
		end
		startIndex = stopIndex
	end)
end

function CharacterKnowledgeList:RefreshCharacterList( initial )
	-- Always invalidate the character column when the character list is changed
	self.charColumnValid = false

	self.server = self.serverDrop:GetSelectedItemData().name

	local characters = { }
	local initialIndex = 1

	for i, character in ipairs(LCK.GetCharacterList(self.server)) do
		table.insert(characters, { character.name, character.id })
		if (character.id == CharacterKnowledge.charId) then
			initialIndex = i
		end
	end

	-- Default to the current character and server if there are no tracked characters
	if (#characters == 0) then
		table.insert(characters, { GetUnitName("player"), CharacterKnowledge.charId })
		if (self.serverDrop:GetSelectedItemData().id ~= 1) then
			self.serverDrop:SelectItemByIndex(1, true)
		end
	end

	if (initial) then
		self.charId = characters[initialIndex][2]
	end

	self:InitializeComboBox(self.characterDrop, { list = characters, key = 1, dataKey = 2 }, initialIndex, not initial, function( comboBox, entryText, entry, selectionChanged )
		self.charId = entry.data
		self:RefreshKnowledge()
	end)
end

function CharacterKnowledgeList:FilterScrollList( )
	local scrollData = ZO_ScrollList_GetDataList(self.list)
	ZO_ClearNumericallyIndexedTable(scrollData)

	local filterId = self.filterDrop:GetSelectedItemData().id
	CharacterKnowledge.vars.filterId = filterId

	local searchInput = self.searchBox:GetText()

	local collected = 0

	for _, data in ipairs(self.masterList) do
		if ( (filterId == data.category) and
		     (searchInput == "" or self.search:IsMatch(searchInput, data)) ) then
			table.insert(scrollData, ZO_ScrollList_CreateDataEntry(DATA_TYPE, data))
			if (data.ratioKnown == 1) then
				collected = collected + 1
			end
		end
	end

	self.frame:GetNamedChild("CollectedCount"):SetText((#scrollData > 0) and string.format(GetString(SI_CK_KNOWN_COUNT), collected, #scrollData, 100 * collected / #scrollData) or "")
end

function CharacterKnowledgeList:SetupItemRow( control, data )
	local cell, cell2, cell3

	cell = control:GetNamedChild("Name")
	cell2 = control:GetNamedChild("Icon")
	cell.normalColor = ZO_DEFAULT_TEXT
	if (data.resultId) then
		local itemLink = LCK.GetItemLinkFromItemId(data.resultId)
		cell:SetText(itemLink)
		cell2:SetTexture(GetItemLinkIcon(itemLink))
	elseif (data.styleId) then
		local r, g, b = GetInterfaceColor(INTERFACE_COLOR_TYPE_ITEM_QUALITY_COLORS, data.quality)
		cell:SetText(string.format("|c%02X%02X%02X%s|r", r * 255, g * 255, b * 255, data.name))
		cell2:SetTexture(GetItemLinkIcon(GetItemStyleMaterialLink(data.styleId)))
	end

	cell = control:GetNamedChild("Extended")
	cell2 = control:GetNamedChild("ExtNumber")
	cell3 = control:GetNamedChild("ExtIcon")
	cell.normalColor = ZO_DEFAULT_TEXT
	cell2.normalColor = ZO_DEFAULT_TEXT
	if (data.level) then
		cell:SetText("")
		cell2:SetHidden(false)
		if (data.level > MAX_LEVEL) then
			cell2:SetText(data.level - MAX_LEVEL)
			cell3:SetTexture("/esoui/art/champion/champion_icon_32.dds")
			cell3:SetHidden(false)
		else
			cell2:SetText(data.level)
			cell3:SetHidden(true)
		end
	elseif (data.motifNumber) then
		cell:SetText("")
		cell2:SetText(data.motifNumber)
		cell2:SetHidden(false)
		if (data.motifCrown) then
			cell3:SetTexture("/esoui/art/currency/crowns_mipmap.dds")
			cell3:SetHidden(false)
		else
			cell3:SetHidden(true)
		end
	else
		cell:SetText(data.extended)
		cell2:SetHidden(true)
		cell3:SetHidden(true)
	end

	cell = control:GetNamedChild("Known")
	SetRatioColor(cell, data.ratioKnown)
	if (data.ratioKnown == 1) then
		cell:SetText(GetString(SI_YES))
	elseif (data.ratioKnown == 0) then
		cell:SetText(GetString(SI_NO))
	else
		cell:SetText(string.format("%d / %d", data.known, #data.chapters))
	end

	cell = control:GetNamedChild("Characters")
	if (self.charColumnValid) then
		SetRatioColor(cell, data.ratioChars)
		cell:SetText(string.format("%d / %d", data.knownChars, data.totalChars))
	else
		cell:SetText("")
	end

	self:SetupRow(control, data)
end

function CharacterKnowledgeList:ProcessItemEntry( stringSearch, data, searchTerm, cache )
	if (searchTerm == "+") then
		return data.ratioKnown == 1
	elseif (searchTerm == "-") then
		return data.ratioKnown < 1
	end

	if ( zo_plainstrfind(data.name:lower(), searchTerm) or
	     (not data.level and zo_plainstrfind(data.extended:lower(), searchTerm)) or
	     (data.planType and zo_plainstrfind(data.planType, searchTerm)) ) then
		return true
	end

	return false
end


--------------------------------------------------------------------------------
-- XML Handlers
--------------------------------------------------------------------------------

local PrimaryTooltip = ItemTooltip
local SecondaryTooltip = ItemTooltip

function CharacterKnowledgeListRow_OnMouseEnter( control )
	local data = ZO_ScrollList_GetData(control)
	local list = CharacterKnowledge.list
	list:Row_OnMouseEnter(control)

	if (LCK.GetItemCategory(data.itemId) ~= LCK.ITEM_CATEGORY_NONE) then
		local itemLink = LCK.GetItemLinkFromItemId(data.itemId)
		PrimaryTooltip = LEJ.ItemTooltip(itemLink)
		CharacterKnowledge.AddTooltipExtension(PrimaryTooltip, itemLink, list.server, list.charId)
		if (data.resultId) then
			InitializeTooltip(SecondaryTooltip, PrimaryTooltip, TOPRIGHT, 0, 0, TOPLEFT)
			SecondaryTooltip:SetLink(LCK.GetItemLinkFromItemId(data.resultId))
		elseif (data.styleId) then
			InitializeTooltip(SecondaryTooltip, PrimaryTooltip, TOPRIGHT, 0, 0, TOPLEFT)
			SecondaryTooltip:SetLink(GetItemStyleMaterialLink(data.styleId))
		end
	elseif (data.styleId) then
		local itemLink = GetItemStyleMaterialLink(data.styleId)
		PrimaryTooltip = LEJ.ItemTooltip(itemLink)
		CharacterKnowledge.AddTooltipExtension(PrimaryTooltip, { styleId = data.styleId }, list.server, list.charId)
	end
end

function CharacterKnowledgeListRow_OnMouseExit( control )
	CharacterKnowledge.list:Row_OnMouseExit(control)

	ClearTooltip(PrimaryTooltip)
	ClearTooltip(SecondaryTooltip)
end

function CharacterKnowledgeListRow_OnMouseUp( ... )
	CharacterKnowledge.list:Row_OnMouseUp(...)
end
