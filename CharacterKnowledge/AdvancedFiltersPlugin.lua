if (not AdvancedFilters) then return end

local LCK = LibCharacterKnowledge

local userId = GetDisplayName()
local charId = GetCurrentCharacterId()
local charName = GetUnitName("player")
local maxLevel = GetMaxLevel()

local function CreateKnowledgeFilter( filterName, stringId, getCallback )
	local filterInformation = {
		submenuName = filterName,

		callbackTable = {
			{ name = charId, filterCallback = getCallback(charId) },
			{ name = "AnyCharacter", filterCallback = getCallback() },
		},

		enStrings = {
			[filterName] = GetString(stringId),
			["AnyCharacter"] = GetString(SI_CK_AF_PLUGIN_ANY),
			[charId] = charName,
		},

		filterType = ITEMFILTERTYPE_ALL,
		subfilters = { "Motif", "Recipe" },
		onlyGroups = { "Consumables", "Junk" },
	}

	local accountPosition = #filterInformation.callbackTable

	local addAccount = function( account )
		local key = "CK_" .. account
		if (not filterInformation.enStrings[key]) then
			accountPosition = accountPosition + 1
			table.insert(filterInformation.callbackTable, accountPosition, {
				name = key,
				filterCallback = getCallback(nil, account),
			})
			filterInformation.enStrings[key] = string.format("(%s)", account)
		end
	end

	addAccount(userId)

	for _, character in ipairs(LCK.GetCharacterList()) do
		if (character.id ~= charId) then
			addAccount(character.account)
			table.insert(filterInformation.callbackTable, {
				name = character.id,
				filterCallback = getCallback(character.id),
			})
			filterInformation.enStrings[character.id] = character.name
		end
	end

	AdvancedFilters_RegisterFilter(filterInformation)
end

local function CreateLevelFilter( filterName, stringId, getCallback )
	local filterInformation = {
		submenuName = filterName,

		callbackTable = { },

		enStrings = {
			[filterName] = GetString(stringId),
		},

		filterType = ITEMFILTERTYPE_CONSUMABLE,
		subfilters = { "Recipe" },
	}

	for _, level in ipairs({ 1, 5, 10, 15, 20, 25, 30, 35, 40, 45, 60, 100, 150, 200 }) do
		local levelStr = tostring(level)

		table.insert(filterInformation.callbackTable, {
			name = levelStr,
			filterCallback = getCallback(level),
		})

		if (level <= maxLevel) then
			filterInformation.enStrings[levelStr] = levelStr
		else
			filterInformation.enStrings[levelStr] = zo_iconTextFormatNoSpace("/esoui/art/champion/champion_icon_32.dds", 16, 16, tostring(level - maxLevel))
		end
	end

	AdvancedFilters_RegisterFilter(filterInformation)
end

LCK.RegisterForCallback("CharacterKnowledgeFilters", LCK.EVENT_INITIALIZED, function( )
	local util = AdvancedFilters.util

	local matchSelectedAccount = function( character, selectedAccount )
		return character.account == selectedAccount or not selectedAccount
	end
	local matchSelectedCharacter = function( character, selectedCharId, selectedAccount )
		return character.id == selectedCharId or (not selectedCharId and matchSelectedAccount(character, selectedAccount))
	end

	CreateKnowledgeFilter("LearnableItems", SI_CK_AF_PLUGIN_LEARNABLE, function( selectedCharId, selectedAccount )
		return function( slot, slotIndex )
			if (util.prepareSlot ~= nil) then
				if (slotIndex ~= nil and type(slot) ~= "table") then
					slot = util.prepareSlot(slot, slotIndex)
				end
			end

			local itemLink = GetItemLink(slot.bagId, slot.slotIndex)
			local bindType = GetItemBindType(slot.bagId, slot.slotIndex)
			local stack = GetSlotStackSize(slot.bagId, slot.slotIndex)

			for _, character in ipairs(LCK.GetItemKnowledgeList(itemLink)) do
				if (character.knowledge == LCK.KNOWLEDGE_UNKNOWN) then
					if (bindType == BIND_TYPE_ON_PICKUP_BACKPACK) then
						if (character.id == charId and matchSelectedCharacter(character, selectedCharId, selectedAccount)) then
							return true
						end
					elseif (bindType ~= BIND_TYPE_ON_PICKUP or character.account == userId) then
						if (matchSelectedCharacter(character, selectedCharId, selectedAccount)) then
							return stack > 0
						else
							stack = stack - 1
						end
					end
				end
			end

			return false
		end
	end)

	CreateKnowledgeFilter("UnknownItems", SI_CK_AF_PLUGIN_UNKNOWN, function( selectedCharId, selectedAccount )
		return function( slot, slotIndex )
			if (util.prepareSlot ~= nil) then
				if (slotIndex ~= nil and type(slot) ~= "table") then
					slot = util.prepareSlot(slot, slotIndex)
				end
			end

			local itemLink = GetItemLink(slot.bagId, slot.slotIndex)

			if (selectedCharId) then
				return LCK.GetItemKnowledgeForCharacter(itemLink, nil, selectedCharId) == LCK.KNOWLEDGE_UNKNOWN
			else
				for _, character in ipairs(LCK.GetCharacterList()) do
					if (matchSelectedAccount(character, selectedAccount) and LCK.GetItemKnowledgeForCharacter(itemLink, nil, character.id) == LCK.KNOWLEDGE_UNKNOWN) then
						return true
					end
				end
				return false
			end
		end
	end)

	CreateLevelFilter("RecipeLevels", SI_CK_AF_PLUGIN_RECIPE_LEVEL, function( selectedLevel )
		return function( slot, slotIndex )
			if (util.prepareSlot ~= nil) then
				if (slotIndex ~= nil and type(slot) ~= "table") then
					slot = util.prepareSlot(slot, slotIndex)
				end
			end

			local itemType, specializedItemType = GetItemType(slot.bagId, slot.slotIndex)

			if (itemType == ITEMTYPE_RECIPE and (specializedItemType == SPECIALIZED_ITEMTYPE_RECIPE_PROVISIONING_STANDARD_FOOD or specializedItemType == SPECIALIZED_ITEMTYPE_RECIPE_PROVISIONING_STANDARD_DRINK)) then
				local resultLink = GetItemLinkRecipeResultItemLink(GetItemLink(slot.bagId, slot.slotIndex))
				local level = GetItemLinkRequiredLevel(resultLink)
				if (level == maxLevel) then
					level = level + GetItemLinkRequiredChampionPoints(resultLink)
				end
				return level == selectedLevel
			else
				return false
			end
		end
	end)
end)
