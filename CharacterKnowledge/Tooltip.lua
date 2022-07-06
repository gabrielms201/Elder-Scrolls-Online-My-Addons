local LCK = LibCharacterKnowledge
local LEJ = LibExtendedJournal
local CharacterKnowledge = CharacterKnowledge


--------------------------------------------------------------------------------
-- CharacterKnowledge.AddTooltipExtension
--------------------------------------------------------------------------------

function CharacterKnowledge.AddTooltipExtension( tooltip, itemLink, server, charIdMotif )
	-- Abort if the item is not something we can handle
	local category = LCK.GetItemCategory(itemLink)
	if (category == LCK.ITEM_CATEGORY_NONE) then return end

	-- Initialize
	local pinnedChars = CharacterKnowledge.serverVars.tooltips.pinnedCharsForChapters
	local itemColors = CharacterKnowledge.vars.tooltips.itemColors
	local charColors = CharacterKnowledge.vars.tooltips.charColors
	LEJ.TooltipExtensionInitialize(true)

	-- Motif knowledge sections
	if (category == LCK.ITEM_CATEGORY_MOTIF) then
		local items = LCK.GetMotifItemsFromStyle(LCK.GetStyleAndChapterFromMotif(itemLink))

		if (items and #items.chapters > 0) then
			local includedCharIds = { [CharacterKnowledge.charId] = true }
			if (charIdMotif) then
				includedCharIds[charIdMotif] = true
			end

			for i, character in ipairs(LCK.GetItemKnowledgeList(itemLink, server, includedCharIds)) do
				if (i <= pinnedChars or includedCharIds[character.id]) then
					local chapters = { }
					local known = 0

					for _, chapter in ipairs(LCK.GetMotifChapterNames()) do
						local knowledge = LCK.GetItemKnowledgeForCharacter(items.chapters[chapter.id], server, character.id)
						if (LCK.IsKnowledgeUsable(knowledge)) then
							table.insert(chapters, string.format("|c%06X%s|r", itemColors[knowledge], chapter.name))
							if (knowledge == LCK.KNOWLEDGE_KNOWN) then
								known = known + 1
							end
						end
					end

					if (#chapters > 0) then
						LEJ.TooltipExtensionAddSection(
							string.format("%s (%d/%d)", character.name, known, #chapters),
							(known < #chapters) and table.concat(chapters, ", ") or string.format("|c%06X%s|r", itemColors[LCK.KNOWLEDGE_KNOWN], GetString(SI_ACHIEVEMENTS_TOOLTIP_COMPLETE))
						)
					end
				end
			end
		end
	end

	-- Characters section
	local characters = LCK.GetItemKnowledgeList(itemLink, server)
	if (#characters > 0) then
		local results = { }
		local found = 0

		for _, character in ipairs(characters) do
			if (character.id == CharacterKnowledge.charId) then
				table.insert(results, string.format("|c%06X|l0:1:1:1:1:%06X|l%s|l|r", charColors[character.knowledge], charColors[character.knowledge], character.name))
			else
				table.insert(results, string.format("|c%06X%s|r", charColors[character.knowledge], character.name))
			end
			if (character.knowledge == LCK.KNOWLEDGE_KNOWN) then
				found = found + 1
			end
		end

		LEJ.TooltipExtensionAddSection(
			string.format("%s (%d/%d)", GetString(SI_CK_TT_HEADER), found, #characters),
			table.concat(results, ", ")
		)
	end

	LEJ.TooltipExtensionFinalize(tooltip)
end


--------------------------------------------------------------------------------
-- CharacterKnowledge.HookExternalTooltips
--------------------------------------------------------------------------------

local AreExternalTooltipsHooked = false

function CharacterKnowledge.HookExternalTooltips( )
	if (AreExternalTooltipsHooked or not CharacterKnowledge.vars.tooltips.enabled) then return end
	AreExternalTooltipsHooked = true

	local TooltipHook = function( control, functionName, linkFunction )
		ZO_PostHook(control, functionName, function( self, ... )
			if (CharacterKnowledge.vars.tooltips.enabled) then
				CharacterKnowledge.AddTooltipExtension(control, linkFunction(...))
			end
		end)
	end

	local ItemLinkPassthrough = function( itemLink )
		return itemLink
	end

	TooltipHook(PopupTooltip, "SetLink", ItemLinkPassthrough)
	TooltipHook(ItemTooltip, "SetLink", ItemLinkPassthrough)
	TooltipHook(ItemTooltip, "SetBagItem", GetItemLink)
	TooltipHook(ItemTooltip, "SetTradeItem", GetTradeItemLink)
	TooltipHook(ItemTooltip, "SetBuybackItem", GetBuybackItemLink)
	TooltipHook(ItemTooltip, "SetStoreItem", GetStoreItemLink)
	TooltipHook(ItemTooltip, "SetAttachedMailItem", GetAttachedItemLink)
	TooltipHook(ItemTooltip, "SetLootItem", GetLootItemLink)
	TooltipHook(ItemTooltip, "SetReward", GetItemRewardItemLink)
	TooltipHook(ItemTooltip, "SetQuestReward", GetQuestRewardItemLink)
	TooltipHook(ItemTooltip, "SetTradingHouseItem", GetTradingHouseSearchResultItemLink)
	TooltipHook(ItemTooltip, "SetTradingHouseListing", GetTradingHouseListingItemLink)
end

LCK.RegisterForCallback("CharacterKnowledgeTooltip", LCK.EVENT_INITIALIZED, CharacterKnowledge.HookExternalTooltips)
