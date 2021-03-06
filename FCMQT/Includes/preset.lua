FCMQT = FCMQT or {}
-- defaults Vars
-- Version : 1.5.5.25
FCMQT.defaults = {
					["AutoAcceptSharedQuests"] = false,
					["AutoRefuseSharedQuests"] = false,
					["AutoShare"] = false,
					["BgAlpha"] = 75,
					["BgColor"] = {    ["r"] = 0.0627450000,    ["g"] = 0.1137250000,    ["a"] = 0.1557380000,    ["b"] = 0.1529410000 },
					["BgOption"] = true,
					["BgWidth"] = 300,
					["BufferRefreshTime"] = "10",
					["Button1"] = "Change Assisted Quest",
					["Button2"] = "Quest Options Menu",
					["Button3"] = "Filter by Current Zone",
					["Button4"] = "Show on Map",
					["Button5"] = "Remove a Quest",
					["Chat_AddonMessage_HeaderColor"] = {    ["r"] = 0.8901960000,    ["g"] = 0.8235290000,    ["a"] = 1,    ["b"] = 0.3019610000 },
					["Chat_AddonMessage_MsgColor"] = {    ["r"] = 0.8509800000,    ["g"] = 0.8509800000,    ["a"] = 1,    ["b"] = 0.8509800000 },
					["Chat_AddonMessages"] = false,
					["Chat_QuestInfo"] = false,
					["Chat_QuestInfo_HeaderColor"] = {    ["r"] = 0.8901960000,    ["g"] = 0.8235290000,    ["a"] = 1,    ["b"] = 0.3019610000 },
					["Chat_QuestInfo_MsgColor"] = {    ["r"] = 0.8509800000,    ["g"] = 0.8509800000,    ["a"] = 1,    ["b"] = 0.8509800000 },
					["DirectionBox"] = "BOTTOM",
					["FocusedQuestAreaNoTrans"] = false,
					["HideCompleteObjHints"] = false,
					["HideHiddenOptions"] = true,
					["HideHintsOption"] = true,
					["HideInCombatOption"] = false,
					["HideInfoHintsOption"] = false,
					["HideObjOption"] = "Disabled",
					["HideOptionalInfo"] = false,
					["HideOptObjective"] = false,
					["HintColor"] = {    ["r"] = 0.9450980000,    ["g"] = 1,    ["a"] = 0.9508200000,    ["b"] = 0.7960780000 },
					["HintCompleteColor"] = {    ["r"] = 0.6039220000,    ["g"] = 0.6039220000,    ["a"] = 0.9508200000,    ["b"] = 0.6039220000 },
					["Language"] = "English",
					["NbQuests"] = 12,
					["position"] = {    ["point"] = 3,    ["offsetX"] = 1191,    ["relativePoint"] = 3,    ["offsetY"] = 442 },
					["PositionLockOption"] = false,
					["Preset"] = "Custom",
					["QuestIcon"] = "Arrow ESO (Default)",
					["QuestIconColor"] = {    ["r"] = 1,    ["g"] = 1,    ["a"] = 1,    ["b"] = 1 },
					["QuestIconOption"] = true,
					["QuestIconSize"] = 22,
					["QuestObjIcon"] = false,
					["QuestsAreaColor"] = {    ["r"] = 0.8000000000,    ["g"] = 0.6705880000,    ["a"] = 1,    ["b"] = 0.2196080000 },
					["QuestsAreaFont"] = "Trajan Pro",
					["QuestsAreaOption"] = true,
					["QuestsAreaPadding"] = 5,
					["QuestsAreaSize"] = 15,
					["QuestsAreaStyle"] = "shadow",
					["QuestsCategoryClassOption"] = true,
					["QuestsCategoryCraftOption"] = true,
					["QuestsCategoryDungeonOption"] = true,
					["QuestsCategoryGroupOption"] = true,
					["QuestsCategoryRaidOption"] = true,
					["QuestsFilter"] =  {},
					["QuestsHideZoneOption"] = false,
					["QuestsHybridOption"] = true,
					["QuestsNoFocusOption"] = false,
					["QuestsNoFocusTransparency"] = 55,
					["QuestsShowTimerOption"] = false,
					["QuestsUntrackHiddenOption"] = false,
					["QuestsZoneAVAOption"] = true,
					["QuestsZoneBGOption"] = true,
					["QuestsZoneClassOption"] = true,
					["QuestsZoneCraftingOption"] = true,
					["QuestsZoneCyrodiilOption"] = true,
					["QuestsZoneDungeonOption"] = true,
					["QuestsZoneEventOption"] = true,
					["QuestsZoneGroupOption"] = true,
					["QuestsZoneGuildOption"] = true,
					["QuestsZoneMainOption"] = true,
					["QuestsZoneOption"] = false,
					["QuestsZoneRaidOption"] = true,
					["ShowJournalInfosColor"] = {    ["r"] = 0.8000000000,    ["g"] = 0.6705880000,    ["a"] = 1,    ["b"] = 0.2196080000 },
					["ShowJournalInfosFont"] = "Trajan Pro",
					["ShowJournalInfosOption"] = true,
					["ShowJournalInfosSize"] = 14,
					["ShowJournalInfosStyle"] = "soft-shadow-thin",
					["SortOrder"] = "Zone+Name",
					["TextColor"] = {    ["r"] = 1,    ["g"] = 1,    ["a"] = 0.9508200000,    ["b"] = 1 },
					["TextCompleteColor"] = {    ["r"] = 0.6039220000,    ["g"] = 0.6039220000,    ["a"] = 0.9508200000,    ["b"] = 0.6039220000 },
					["TextFont"] = "Univers 57",
					["TextOptionalColor"] = {    ["r"] = 0.9450980000,    ["g"] = 1,    ["a"] = 0.9508200000,    ["b"] = 0.7960780000 },
					["TextOptionalCompleteColor"] = {    ["r"] = 0.6039220000,    ["g"] = 0.6039220000,    ["a"] = 0.9508200000,    ["b"] = 0.6039220000 },
					["TextPadding"] = 24,
					["TextSize"] = 14,
					["TextStyle"] = "soft-shadow-thin",
					["TimerTitleColor"] = {    ["r"] = 0.8000000000,    ["g"] = 0.5137260000,    ["a"] = 1,    ["b"] = 0.1960780000 },
					["TimerTitleFont"] = "Univers 67",
					["TimerTitleSize"] = 17,
					["TimerTitleStyle"] = "shadow",
					["TitleColor"] = {    ["r"] = 0.8000000000,    ["g"] = 0.5137260000,    ["a"] = 1,    ["b"] = 0.1960780000 },
					["TitleFont"] = "Univers 67",
					["TitlePadding"] = 5,
					["TitleSize"] = 17,
					["TitleStyle"] = "shadow",
					["version"] = 5,
}
FCMQT.Preset1 = {
					["AutoAcceptSharedQuests"] = false,
					["AutoRefuseSharedQuests"] = false,
					["AutoShare"] = false,
					["BgAlpha"] = 100,
					["BgColor"] = {    ["a"] = 0.2950819731,    ["g"] = 0,    ["r"] = 0,    ["b"] = 0 },
					["BgOption"] = true,
					["BgWidth"] = 346,
					["BufferRefreshTime"] = "10",
					["Button1"] = "Change Assisted Quest",
					["Button2"] = "Quest Options Menu",
					["Button3"] = "Filter by Current Zone",
					["Button4"] = "Show on Map",
					["Button5"] = "Remove a Quest",
					["Chat_AddonMessage_HeaderColor"] = {    ["a"] = 1,    ["g"] = 0.4627451003,    ["r"] = 0.8431372643,    ["b"] = 0.1607843190 },
					["Chat_AddonMessage_MsgColor"] = {    ["a"] = 1,    ["g"] = 0.8980392218,    ["r"] = 0.8980392218,    ["b"] = 0.8980392218 },
					["Chat_AddonMessages"] = true,
					["Chat_QuestInfo"] = true,
					["Chat_QuestInfo_HeaderColor"] = {    ["a"] = 1,    ["g"] = 0.9450980425,    ["r"] = 1,    ["b"] = 0.4313725531 },
					["Chat_QuestInfo_MsgColor"] = {    ["a"] = 1,    ["g"] = 0.8980392218,    ["r"] = 0.8627451062,    ["b"] = 0.8235294223 },
					["ChatSetup"] = "All Chat Messages",
					["ClueColor"] = {    ["a"] = 0.9508200000,    ["g"] = 0.6039220000,    ["r"] = 0.6039220000,    ["b"] = 0.6039220000 },
					["DirectionBox"] = "BOTTOM",
					["FocusedQuestAreaNoTrans"] = true,
					["GetFocusedQuestAreaNoTrans"] = false,
					["HideCompleteObjHints"] = false,
					["HideHiddenOptions"] = false,
					["HideHintsOption"] = false,["QuestsAreaColor"] = {    ["a"] = 1,    ["g"] = 0.8235294223,    ["r"] = 0.8901960850,    ["b"] = 0.3019607961 },
					["HideInCombatOption"] = true,
					["HideInfoHintsOption"] = false,
					["HideObjHintsNotFocused"] = false,
					["HideObjOption"] = "Disabled",
					["HideOptionalInfo"] = false,
					["HideOptObjective"] = false,
					["HintColor"] = {    ["a"] = 0.9508200288,    ["g"] = 1,    ["r"] = 0.9921568632,    ["b"] = 0.6588235497 },
					["HintCompleteColor"] = {    ["a"] = 0.9508200288,    ["g"] = 0.5058823824,    ["r"] = 0.5137255192,    ["b"] = 0.2745098174 },
					["Language"] = "English",
					["NbQuests"] = 25,
					["position"] = {    ["offsetX"] = 32,    ["relativePoint"] = 3,    ["point"] = 3,    ["offsetY"] = 95 },
					["PositionLockOption"] = false,
					["Preset"] = "Custom",
					["QuestIcon"] = "Arrow ESO (Default)",
					["QuestIconColor"] = {    ["a"] = 1,    ["g"] = 1,    ["r"] = 0.1686274558,    ["b"] = 0.5333333611 },
					["QuestIconOption"] = true,
					["QuestIconSize"] = 21,
					["QuestObjIcon"] = true,
					["QuestsAreaColor"] = {    ["a"] = 1,    ["g"] = 0.8235294223,    ["r"] = 0.8901960850,    ["b"] = 0.3019607961 },
					["QuestsAreaFont"] = "ESO Standard Font",
					["QuestsAreaOption"] = true,
					["QuestsAreaPadding"] = 4,
					["QuestsAreaSize"] = 15,
					["QuestsAreaStyle"] = "soft-shadow-thick",
					["QuestsCategoryClassOption"] = true,
					["QuestsCategoryCraftOption"] = false,
					["QuestsCategoryDungeonOption"] = true,
					["QuestsCategoryGroupOption"] = true,
					["QuestsCategoryRaidOption"] = true,
					["QuestsFilter"] =  {},
					["QuestsHideZoneOption"] = true,
					["QuestsHybridOption"] = false,
					["QuestsLevelOption"] = true,
					["QuestsNoFocusOption"] = true,
					["QuestsNoFocusTransparency"] = 55,
					["QuestsShowTimerOption"] = true,
					["QuestsUntrackHiddenOption"] = false,
					["QuestsZoneAVAOption"] = true,
					["QuestsZoneBGOption"] = true,
					["QuestsZoneClassOption"] = true,
					["QuestsZoneCraftingOption"] = true,
					["QuestsZoneCyrodiilOption"] = true,
					["QuestsZoneDungeonOption"] = true,
					["QuestsZoneEventOption"] = true,
					["QuestsZoneGroupOption"] = true,
					["QuestsZoneGuildOption"] = true,
					["QuestsZoneMainOption"] = true,
					["QuestsZoneOption"] = false,
					["QuestsZoneRaidOption"] = true,
					["ShowJournalInfosColor"] = {    ["a"] = 1,    ["g"] = 0.6705880000,    ["r"] = 0.8000000000,    ["b"] = 0.2196080000 },
					["ShowJournalInfosFont"] = "Trajan Pro",
					["ShowJournalInfosOption"] = true,
					["ShowJournalInfosSize"] = 14,
					["ShowJournalInfosStyle"] = "soft-shadow-thin",
					["SortOrder"] = "Focused+Zone+Name",
					["TextColor"] = {    ["a"] = 0.9508200000,    ["g"] = 1,    ["r"] = 1,    ["b"] = 1 },
					["TextCompleteColor"] = {    ["a"] = 0.9508200000,    ["g"] = 0.6039220000,    ["r"] = 0.6039220000,    ["b"] = 0.6039220000 },
					["TextFont"] = "ESO Standard Font",
					["TextOptionalColor"] = {    ["a"] = 0.9508200288,    ["g"] = 0.8549019694,    ["r"] = 0.4666666687,    ["b"] = 1 },
					["TextOptionalCompleteColor"] = {    ["a"] = 0.9508200288,    ["g"] = 0.2823529541,    ["r"] = 0.1490196139,    ["b"] = 0.3333333433 },
					["TextPadding"] = 39,
					["TextSize"] = 14,
					["TextStyle"] = "soft-shadow-thick",
					["TimerTitleColor"] = {    ["a"] = 1,    ["g"] = 0,    ["r"] = 0.9803921580,    ["b"] = 0.1529411823 },
					["TimerTitleFont"] = "Univers 67",
					["TimerTitleSize"] = 17,
					["TimerTitleStyle"] = "shadow",
					["TitleColor"] = {    ["a"] = 1,    ["g"] = 0.8000000119,    ["r"] = 0.2313725501,    ["b"] = 0.4000000060 },
					["TitleFont"] = "ESO Standard Font",
					["TitlePadding"] = 28,
					["TitleSize"] = 15,
					["TitleStyle"] = "soft-shadow-thick",
					["version"] = 5,
}
FCMQT.Preset2 = {
					["AutoAcceptSharedQuests"] = false,
					["AutoRefuseSharedQuests"] = false,
					["AutoShare"] = false,
					["BgAlpha"] = 100,
					["BgColor"] = {    ["a"] = 0.2950819731,    ["g"] = 0,    ["r"] = 0,    ["b"] = 0 },
					["BgOption"] = true,
					["BgWidth"] = 346,
					["BufferRefreshTime"] = "10",
					["Button1"] = "Change Assisted Quest",
					["Button2"] = "Quest Options Menu",
					["Button3"] = "Filter by Current Zone",
					["Button4"] = "Show on Map",
					["Button5"] = "Remove a Quest",
					["Chat_AddonMessage_HeaderColor"] = {    ["a"] = 1,    ["g"] = 0.4627451003,    ["r"] = 0.8431372643,    ["b"] = 0.1607843190 },
					["Chat_AddonMessage_MsgColor"] = {    ["a"] = 1,    ["g"] = 0.8980392218,    ["r"] = 0.8980392218,    ["b"] = 0.8980392218 },
					["Chat_AddonMessages"] = true,
					["Chat_QuestInfo"] = true,
					["Chat_QuestInfo_HeaderColor"] = {    ["a"] = 1,    ["g"] = 0.9450980425,    ["r"] = 1,    ["b"] = 0.4313725531 },
					["Chat_QuestInfo_MsgColor"] = {    ["a"] = 1,    ["g"] = 0.8980392218,    ["r"] = 0.8627451062,    ["b"] = 0.8235294223 },
					["ChatSetup"] = "All Chat Messages",
					["ClueColor"] = {    ["a"] = 0.9508200000,    ["g"] = 0.6039220000,    ["r"] = 0.6039220000,    ["b"] = 0.6039220000 },
					["DirectionBox"] = "BOTTOM",
					["FocusedQuestAreaNoTrans"] = true,
					["GetFocusedQuestAreaNoTrans"] = false,
					["HideCompleteObjHints"] = false,
					["HideHiddenOptions"] = false,
					["HideHintsOption"] = false,["QuestsAreaColor"] = {    ["a"] = 1,    ["g"] = 0.8235294223,    ["r"] = 0.8901960850,    ["b"] = 0.3019607961 },
					["HideInCombatOption"] = true,
					["HideInfoHintsOption"] = false,
					["HideObjHintsNotFocused"] = false,
					["HideObjOption"] = "Disabled",
					["HideOptionalInfo"] = false,
					["HideOptObjective"] = false,
					["HintColor"] = {    ["a"] = 0.9508200288,    ["g"] = 1,    ["r"] = 0.9921568632,    ["b"] = 0.6588235497 },
					["HintCompleteColor"] = {    ["a"] = 0.9508200288,    ["g"] = 0.5058823824,    ["r"] = 0.5137255192,    ["b"] = 0.2745098174 },
					["Language"] = "English",
					["NbQuests"] = 25,
					["position"] = {    ["offsetX"] = 32,    ["relativePoint"] = 3,    ["point"] = 3,    ["offsetY"] = 95 },
					["PositionLockOption"] = false,
					["Preset"] = "Custom",
					["QuestIcon"] = "Arrow ESO (Default)",
					["QuestIconColor"] = {    ["a"] = 1,    ["g"] = 1,    ["r"] = 0.1686274558,    ["b"] = 0.5333333611 },
					["QuestIconOption"] = true,
					["QuestIconSize"] = 21,
					["QuestObjIcon"] = true,
					["QuestsAreaColor"] = {    ["a"] = 1,    ["g"] = 0.8235294223,    ["r"] = 0.8901960850,    ["b"] = 0.3019607961 },
					["QuestsAreaFont"] = "ESO Standard Font",
					["QuestsAreaOption"] = true,
					["QuestsAreaPadding"] = 4,
					["QuestsAreaSize"] = 15,
					["QuestsAreaStyle"] = "soft-shadow-thick",
					["QuestsCategoryClassOption"] = true,
					["QuestsCategoryCraftOption"] = false,
					["QuestsCategoryDungeonOption"] = true,
					["QuestsCategoryGroupOption"] = true,
					["QuestsCategoryRaidOption"] = true,
					["QuestsFilter"] =  {},
					["QuestsHideZoneOption"] = false,
					["QuestsHybridOption"] = false,
					["QuestsLevelOption"] = true,
					["QuestsNoFocusOption"] = true,
					["QuestsNoFocusTransparency"] = 55,
					["QuestsShowTimerOption"] = true,
					["QuestsUntrackHiddenOption"] = false,
					["QuestsZoneAVAOption"] = true,
					["QuestsZoneBGOption"] = true,
					["QuestsZoneClassOption"] = true,
					["QuestsZoneCraftingOption"] = true,
					["QuestsZoneCyrodiilOption"] = true,
					["QuestsZoneDungeonOption"] = true,
					["QuestsZoneEventOption"] = true,
					["QuestsZoneGroupOption"] = true,
					["QuestsZoneGuildOption"] = true,
					["QuestsZoneMainOption"] = true,
					["QuestsZoneOption"] = false,
					["QuestsZoneRaidOption"] = true,
					["ShowJournalInfosColor"] = {    ["a"] = 1,    ["g"] = 0.6705880000,    ["r"] = 0.8000000000,    ["b"] = 0.2196080000 },
					["ShowJournalInfosFont"] = "Trajan Pro",
					["ShowJournalInfosOption"] = true,
					["ShowJournalInfosSize"] = 14,
					["ShowJournalInfosStyle"] = "soft-shadow-thin",
					["SortOrder"] = "Focused+Zone+Name",
					["TextColor"] = {    ["a"] = 0.9508200000,    ["g"] = 1,    ["r"] = 1,    ["b"] = 1 },
					["TextCompleteColor"] = {    ["a"] = 0.9508200000,    ["g"] = 0.6039220000,    ["r"] = 0.6039220000,    ["b"] = 0.6039220000 },
					["TextFont"] = "ESO Standard Font",
					["TextOptionalColor"] = {    ["a"] = 0.9508200288,    ["g"] = 0.8549019694,    ["r"] = 0.4666666687,    ["b"] = 1 },
					["TextOptionalCompleteColor"] = {    ["a"] = 0.9508200288,    ["g"] = 0.2823529541,    ["r"] = 0.1490196139,    ["b"] = 0.3333333433 },
					["TextPadding"] = 39,
					["TextSize"] = 14,
					["TextStyle"] = "soft-shadow-thick",
					["TimerTitleColor"] = {    ["a"] = 1,    ["g"] = 0,    ["r"] = 0.9803921580,    ["b"] = 0.1529411823 },
					["TimerTitleFont"] = "Univers 67",
					["TimerTitleSize"] = 17,
					["TimerTitleStyle"] = "shadow",
					["TitleColor"] = {    ["a"] = 1,    ["g"] = 0.8000000119,    ["r"] = 0.2313725501,    ["b"] = 0.4000000060 },
					["TitleFont"] = "ESO Standard Font",
					["TitlePadding"] = 28,
					["TitleSize"] = 15,
					["TitleStyle"] = "soft-shadow-thick",
					["version"] = 5,
}
FCMQT.Preset3 = {
					["AutoAcceptSharedQuests"] = false,
					["AutoRefuseSharedQuests"] = false,
					["AutoShare"] = false,
					["BgAlpha"] = 100,
					["BgColor"] = {    ["a"] = 0.2950819731,    ["g"] = 0,    ["r"] = 0,    ["b"] = 0 },
					["BgOption"] = true,
					["BgWidth"] = 346,
					["BufferRefreshTime"] = "10",
					["Button1"] = "Change Assisted Quest",
					["Button2"] = "Quest Options Menu",
					["Button3"] = "Filter by Current Zone",
					["Button4"] = "Show on Map",
					["Button5"] = "Remove a Quest",
					["Chat_AddonMessage_HeaderColor"] = {    ["a"] = 1,    ["g"] = 0.4627451003,    ["r"] = 0.8431372643,    ["b"] = 0.1607843190 },
					["Chat_AddonMessage_MsgColor"] = {    ["a"] = 1,    ["g"] = 0.8980392218,    ["r"] = 0.8980392218,    ["b"] = 0.8980392218 },
					["Chat_AddonMessages"] = true,
					["Chat_QuestInfo"] = true,
					["Chat_QuestInfo_HeaderColor"] = {    ["a"] = 1,    ["g"] = 0.9450980425,    ["r"] = 1,    ["b"] = 0.4313725531 },
					["Chat_QuestInfo_MsgColor"] = {    ["a"] = 1,    ["g"] = 0.8980392218,    ["r"] = 0.8627451062,    ["b"] = 0.8235294223 },
					["ChatSetup"] = "All Chat Messages",
					["ClueColor"] = {    ["a"] = 0.9508200000,    ["g"] = 0.6039220000,    ["r"] = 0.6039220000,    ["b"] = 0.6039220000 },
					["DirectionBox"] = "BOTTOM",
					["FocusedQuestAreaNoTrans"] = true,
					["GetFocusedQuestAreaNoTrans"] = false,
					["HideCompleteObjHints"] = false,
					["HideHiddenOptions"] = false,
					["HideHintsOption"] = false,["QuestsAreaColor"] = {    ["a"] = 1,    ["g"] = 0.8235294223,    ["r"] = 0.8901960850,    ["b"] = 0.3019607961 },
					["HideInCombatOption"] = true,
					["HideInfoHintsOption"] = false,
					["HideObjHintsNotFocused"] = true,
					["HideObjOption"] = "Disabled",
					["HideOptionalInfo"] = false,
					["HideOptObjective"] = false,
					["HintColor"] = {    ["a"] = 0.9508200288,    ["g"] = 1,    ["r"] = 0.9921568632,    ["b"] = 0.6588235497 },
					["HintCompleteColor"] = {    ["a"] = 0.9508200288,    ["g"] = 0.5058823824,    ["r"] = 0.5137255192,    ["b"] = 0.2745098174 },
					["Language"] = "English",
					["NbQuests"] = 25,
					["position"] = {    ["offsetX"] = 32,    ["relativePoint"] = 3,    ["point"] = 3,    ["offsetY"] = 95 },
					["PositionLockOption"] = false,
					["Preset"] = "Custom",
					["QuestIcon"] = "Arrow ESO (Default)",
					["QuestIconColor"] = {    ["a"] = 1,    ["g"] = 1,    ["r"] = 0.1686274558,    ["b"] = 0.5333333611 },
					["QuestIconOption"] = true,
					["QuestIconSize"] = 21,
					["QuestObjIcon"] = true,
					["QuestsAreaColor"] = {    ["a"] = 1,    ["g"] = 0.8235294223,    ["r"] = 0.8901960850,    ["b"] = 0.3019607961 },
					["QuestsAreaFont"] = "ESO Standard Font",
					["QuestsAreaOption"] = true,
					["QuestsAreaPadding"] = 4,
					["QuestsAreaSize"] = 15,
					["QuestsAreaStyle"] = "soft-shadow-thick",
					["QuestsCategoryClassOption"] = true,
					["QuestsCategoryCraftOption"] = false,
					["QuestsCategoryDungeonOption"] = true,
					["QuestsCategoryGroupOption"] = true,
					["QuestsCategoryRaidOption"] = true,
					["QuestsFilter"] =  {},
					["QuestsHideZoneOption"] = false,
					["QuestsHybridOption"] = false,
					["QuestsLevelOption"] = true,
					["QuestsNoFocusOption"] = true,
					["QuestsNoFocusTransparency"] = 55,
					["QuestsShowTimerOption"] = true,
					["QuestsUntrackHiddenOption"] = false,
					["QuestsZoneAVAOption"] = true,
					["QuestsZoneBGOption"] = true,
					["QuestsZoneClassOption"] = true,
					["QuestsZoneCraftingOption"] = true,
					["QuestsZoneCyrodiilOption"] = true,
					["QuestsZoneDungeonOption"] = true,
					["QuestsZoneEventOption"] = true,
					["QuestsZoneGroupOption"] = true,
					["QuestsZoneGuildOption"] = true,
					["QuestsZoneMainOption"] = true,
					["QuestsZoneOption"] = false,
					["QuestsZoneRaidOption"] = true,
					["ShowJournalInfosColor"] = {    ["a"] = 1,    ["g"] = 0.6705880000,    ["r"] = 0.8000000000,    ["b"] = 0.2196080000 },
					["ShowJournalInfosFont"] = "Trajan Pro",
					["ShowJournalInfosOption"] = true,
					["ShowJournalInfosSize"] = 14,
					["ShowJournalInfosStyle"] = "soft-shadow-thin",
					["SortOrder"] = "Focused+Zone+Name",
					["TextColor"] = {    ["a"] = 0.9508200000,    ["g"] = 1,    ["r"] = 1,    ["b"] = 1 },
					["TextCompleteColor"] = {    ["a"] = 0.9508200000,    ["g"] = 0.6039220000,    ["r"] = 0.6039220000,    ["b"] = 0.6039220000 },
					["TextFont"] = "ESO Standard Font",
					["TextOptionalColor"] = {    ["a"] = 0.9508200288,    ["g"] = 0.8549019694,    ["r"] = 0.4666666687,    ["b"] = 1 },
					["TextOptionalCompleteColor"] = {    ["a"] = 0.9508200288,    ["g"] = 0.2823529541,    ["r"] = 0.1490196139,    ["b"] = 0.3333333433 },
					["TextPadding"] = 39,
					["TextSize"] = 14,
					["TextStyle"] = "soft-shadow-thick",
					["TimerTitleColor"] = {    ["a"] = 1,    ["g"] = 0,    ["r"] = 0.9803921580,    ["b"] = 0.1529411823 },
					["TimerTitleFont"] = "Univers 67",
					["TimerTitleSize"] = 17,
					["TimerTitleStyle"] = "shadow",
					["TitleColor"] = {    ["a"] = 1,    ["g"] = 0.8000000119,    ["r"] = 0.2313725501,    ["b"] = 0.4000000060 },
					["TitleFont"] = "ESO Standard Font",
					["TitlePadding"] = 28,
					["TitleSize"] = 15,
					["TitleStyle"] = "soft-shadow-thick",
					["version"] = 5,
}