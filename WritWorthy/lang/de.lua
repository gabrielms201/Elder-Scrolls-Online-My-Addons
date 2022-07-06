local WritWorthy = _G['WritWorthy'] or {} -- defined in WritWorthy_Define.lua

-- Static UI strings that should be translated to other languages.

WritWorthy.I18N = WritWorthy.I18N or {}

-- General-purpose string shortener: put long strings
-- on the left and there shorter versions on the right.
WritWorthy.I18N['shorten'] = WritWorthy.I18N['shorten'] or {}
WritWorthy.I18N['shorten']['de'] = {
    ["Schlammkrabbenchitin"                  ] = "Krabben Chitin"
,   ["kriegerische Ordinatoren"              ] = "Krieg. Ordinatoren"
,   ["Ahnenseidenschulterposter"             ] = "Ahnenseiden Schulter"
,   ["Rubedolederschulterkappen"             ] = "Rubedoleder Schulter"
,   ["Dunkle Bruderschaft"                   ] = "Dunkle Brudersch."
,   ["Kriegswappenträger"                    ] = "Kriegsw. Träger"
,   ["erhöhten magischen schadens"           ] = "+ mag. Schaden"
,   ["erhöhten physischen schadens"          ] = "+ phys. Schaden"
,   ["verringerten magischen schadens"       ] = "- mag. Schaden"
,   ["verringerten physischen schadens"      ] = "- phys. Schaden"
}

































WritWorthy.I18N['static'] = WritWorthy.I18N['static'] or {}
WritWorthy.I18N['static']['de'] = {
    ["ags_label"                             ] = "WritWorthy Kosten pro Schriebschein"
,   ["button_dequeue_all"                    ] = "Alles entfernen"
,   ["button_enqueue_all"                    ] = "Alles einreihen"
,   ["button_sort_by_station"                ] = "Sortieren nach Station"
,   ["count_writs_vouchers"                  ] = "%d Schrieb, %s Schriebscheine"
,   ["currency_suffix_gold"                  ] = "G"
,   ["currency_suffix_gold_per_voucher"      ] = "G/S"
,   ["currency_suffix_voucher"               ] = "S"
,   ["empty"                                 ] = ""
,   ["enchanting_cp150"                      ] = "Prächtige"
,   ["enchanting_cp160"                      ] = "Wahrlich prächtige"
,   ["err_could_not_parse"                   ] = "Konnte nicht gelesen werden."
,   ["glyph_absorb_health"                   ] = "Lebensabsorption"
,   ["glyph_absorb_magicka"                  ] = "Magickaabsorption"
,   ["glyph_absorb_stamina"                  ] = "Ausdauerabsorption"
,   ["glyph_bashing"                         ] = "Einschlagens"
,   ["glyph_crushing"                        ] = "Zerschmetterns"
,   ["glyph_decrease_health"                 ] = "Lebensminderung"
,   ["glyph_decrease_physical_harm"          ] = "verringerten physischen schadens"
,   ["glyph_decrease_spell_harm"             ] = "verringerten magischen schadens"
,   ["glyph_disease_resist"                  ] = "Seuchenresistenz"
,   ["glyph_flame"                           ] = "Flamme"
,   ["glyph_flame_resist"                    ] = "Flammenresistenz"
,   ["glyph_foulness"                        ] = "Fäulnis"
,   ["glyph_frost"                           ] = "Frosts"
,   ["glyph_frost_resist"                    ] = "Frostresistenz"
,   ["glyph_hardening"                       ] = "Abhärtung"
,   ["glyph_health"                          ] = "Lebens"
,   ["glyph_health_recovery"                 ] = "Lebensregeneration"
,   ["glyph_increase_magical_harm"           ] = "erhöhten magischen schadens"
,   ["glyph_increase_physical_harm"          ] = "erhöhten physischen schadens"
,   ["glyph_magicka"                         ] = "Magicka"
,   ["glyph_magicka_recovery"                ] = "Magickaregeneration"
,   ["glyph_poison"                          ] = "Gifts"
,   ["glyph_poison_resist"                   ] = "Giftresistenz"
,   ["glyph_potion_boost"                    ] = "Trankverbesserung"
,   ["glyph_potion_speed"                    ] = "Tranktempos"
,   ["glyph_prismatic_defense"               ] = "Prismatischen Verteidigung"
,   ["glyph_prismatic_onslaught"             ] = "Prismatischen Ansturms"
,   ["glyph_reduce_feat_cost"                ] = "Fähigkeitenkostenminderung"
,   ["glyph_reduce_spell_cost"               ] = "Zauberkostenminderung"
,   ["glyph_shielding"                       ] = "Abschirmens"
,   ["glyph_shock"                           ] = "Schocks"
,   ["glyph_shock_resist"                    ] = "Schockresistenz"
,   ["glyph_stamina"                         ] = "Ausdauer"
,   ["glyph_stamina_recovery"                ] = "Ausdauerregeneration"
,   ["glyph_weakening"                       ] = "Schwächung"
,   ["glyph_weapon_damage"                   ] = "Waffenkraft"
,   ["header_Detail 1"                       ] = "Detail 1"
,   ["header_Detail 2"                       ] = "Detail 2"
,   ["header_Detail 3"                       ] = "Detail 3"
,   ["header_Detail 4"                       ] = "Detail 4"
,   ["header_Q"                              ] = "Q"
,   ["header_M"                              ] = "M"
,   ["header_Quality"                        ] = "Qualität"
,   ["header_Type"                           ] = "Art"
,   ["header_V"                              ] = "V"
,   ["header_Name"                           ] = "Name"
,   ["header_RequiredCt"                     ] = "Req'd"
,   ["header_HaveCt"                         ] = "Have"
,   ["header_BuyCt"                          ] = "Buy"
,   ["header_PriceEa"                        ] = "Price"
,   ["header_BuySubtotal"                    ] = "Total"
,   ["header_tooltip_RequiredCt"             ] = "How many required for writs?"
,   ["header_tooltip_HaveCt"                 ] = "How many in inventory+bank+craft bag?"
,   ["header_tooltip_BuyCt"                  ] = "Don't have enough? How many more do you need? (=Req'd - Have)"
,   ["header_tooltip_PriceEa"                ] = "Price per material"
,   ["header_tooltip_BuySubtotal"            ] = "Total price (=Buy × Price)"
,   ["header_tooltip_Q"                      ] = "Zum Herstellen der Warteschlange hinzugefügt"
,   ["header_tooltip_M"                      ] = "Use mimic stone?"
,   ["header_tooltip_V"                      ] = "Anzahl Schriebscheine"
,   ["keybind_writworthy"                    ] = "Fenster umschalten"
,   ["know_err_motif"                        ] = "Stil %s nicht bekannt"
,   ["know_err_recipe"                       ] = "Rezept nicht bekannt"
,   ["know_err_skill_missing"                ] = "Fehlende Fähigkeit: %s"
,   ["know_err_skill_not_maxed"              ] = "Unzureichende Fähigkeit '%s': %d/%d"
,   ["know_err_trait"                        ] = "Eigenschaft %s %s nicht bekannt"
,   ["know_err_trait_ct_too_low"             ] = "%d/%d Eigenschaften erforderlich für Set %s"
,   ["know_err_llc_too_old"                  ] = "LibLazyCrafting %s requires update for set %d %s"
,   ["lam_banked_vouchers_desc"              ] = "Bank scannen und die Schriebe der Liste der automatisch herstellbaren Schriebe hinzufügen.\n|cFF3333ACHTUNG Wenn du Schriebe mit mehreren Charakteren herstellst! WritWorthy warnt nicht, wenn derselbe Schrieb mit unterschiedlichen Charakteren hergestellt wird.|r"
,   ["lam_banked_vouchers_title"             ] = "Schriebe aus der Bank im Auto-Herstellen WritWorthy-Fenster berücksichtigen"
,   ["lam_force_en_desc"                     ] = "Ignorieren die Client-Spracheinstellung und verwende EN English für den gesamten WritWorthy-Text."
,   ["lam_force_en_title"                    ] = "Erzwinge EN English"
,   ["lam_mat_list_alchemy_only"             ] = "Nur Alchemie"
,   ["lam_mat_list_all"                      ] = "Alles"
,   ["lam_mat_list_desc"                     ] = "Zeige jedes Mal mehrere Zeilen für Materialien im Chat, wenn ein Tool-Tipp für Meisterschriebe angezeigt wird."
,   ["lam_mat_list_off"                      ] = "Aus"
,   ["lam_mat_list_title"                    ] = "Materialliste im Chat anzeigen"
,   ["lam_mat_price_tt_desc"                 ] = "Füge Text in die Tooltips von Schrieben ein, welche die gesamten Materialkosten für das Herstellen dieses Schriebes anzeigen."
,   ["lam_mat_price_tt_title"                ] = "Materialpreis in Tooltip anzeigen"
,   ["lam_mm_fallback_desc"                  ] = "Wenn MM keine Durchschnittspreise für Materialien hat:\n* Nutze 15g für Basis Stil Materialien wie z.B. Molybdän\n* nutze 5g für gemeine Eingenschafts Materialien wie z.B. Quartz."
,   ["lam_mm_fallback_title"                 ] = "MM Fallback: Feste Preise nutzen"
,   ["lam_lib_price_desc"                    ] = "Check with MM/ATT/TTC for material prices. Requires LibPrice."
,   ["lam_lib_price_title"                   ] = "Use LibPrice for mat prices"
,   ["lam_station_colors_desc"               ] = "Verwende verschiedene Farben für Schmiedekunst, Kleidung und Holzbearbeitung im WritWorthy-Fenster."
,   ["lam_station_colors_title"              ] = "Stationsfarben im Fenster"
,   ["lam_cmw_desc"                          ] = "If you prefer Marify's Confirm Master Writ tooltips turn this option off to hide WritWorthy's redundant warning tooltips."
,   ["lam_cmw_title"                         ] = "Show duplicate tooltips"
,   ["lam_mat_tooltip_title"                 ] = "Show materials in tooltip"
,   ["lam_mat_tooltip_desc"                  ] = "Show material list in tooltip"
,   ["lam_mat_tooltip_off"                   ] = "Off"
,   ["lam_mat_tooltip_all"                   ] = "All"
,   ["lam_mat_tooltip_missing_only"          ] = "Missing Only"
,   ["mat_ui_filter_all_mats"                ] = "Show all materials for all queued master writs"
,   ["mat_ui_filter_missing_mats"            ] = "Show missing materials for all queued master writs"
,   ["mat_ui_filter_missing_motifs"          ] = "Show missing motifs for unqueued master writs"
,   ["max_gold_per_voucher"                  ] = "Max gold per voucher:"
,   ["msg_port_house"                        ] = "Porting to owner:%s  house:%s"
,   ["slash_auto"                            ] = "Auto"
,   ["slash_auto_desc"                       ] = "Automatisch Quests aus dem Inventar annehmen"
,   ["slash_count"                           ] = "Anzahl"
,   ["slash_count_desc"                      ] = "Anzahl Meisterschriebe im Inventar / in der Bank dieses Charakters?"
,   ["slash_discover"                        ] = "Entdecken"
,   ["slash_discover_desc"                   ] = "item_link Schriebfelder in den Log schreiben"
,   ["slash_forget"                          ] = "Forget"
,   ["slash_forget_desc"                     ] = "Vergesse die handwerklichen Meisterschriebe dieses Charakters"
,   ["slash_port"                            ] = "port"
,   ["slash_port_desc"                       ] = "Teleport to a crafting house"
,   ["slash_mat"                             ] = "mat"
,   ["slash_mat_desc"                        ] = "Show/hide material list window."
,   ["slash_writworthy_desc"                 ] = "WritWorthy-Fenster ein- / ausblenden"
,   ["status_discover"                       ] = "scanne Schriebfelder..."
,   ["status_forget"                         ] = "Vergesse alles, was dieser Charakter schon hergestellt hat ..."
,   ["status_list_empty_no_writs"            ] = "Dieser Charakter hat keine versiegelten Meisterschriebe in seinem Inventar."
,   ["summary_completed_average_voucher_cost"] = "Durchschnittliche abgeschlossene Schrieb Voucher-Kosten"
,   ["summary_completed_mat_cost"            ] = "Gesamte abgeschlossene Materialien"
,   ["summary_completed_voucher_ct"          ] = "Gesamte abgeschlossen Schriebscheine"
,   ["summary_completed_writ_ct"             ] = "Gesamte abgeschlossen Meisterschriebe"
,   ["summary_queued_average_voucher_cost"   ] = "Durchschnittliche eingereihte Schrieb Voucher-Kosten"
,   ["summary_queued_mat_cost"               ] = "Gesamte eingereihte Materialien"
,   ["summary_queued_voucher_ct"             ] = "Gesamte eingereihte Schrieb Voucher"
,   ["summary_queued_writ_ct"                ] = "Gesamte eingereihte Meisterschriebe"
,   ["title_writ_inventory_player"           ] = "Schriebe Inventar: %s"
,   ["title_writ_inventory_player_bank"      ] = "Schriebe Inventar: %s + Bank"
,   ["tooltip_crafted"                       ] = "Herstellung abgeschlossen"
,   ["tooltip_mat_total"                     ] = "Mat. insg."
,   ["tooltip_per_voucher"                   ] = "Per Schriebsch."
,   ["tooltip_purchase"                      ] = "Kaufen"
,   ["tooltip_queued"                        ] = "Zum Herstellen eingereiht"
,   ["tooltip_sell_for"                      ] = "Verkaufen für %s G"
,   ["tooltip_sell_for_cannot"               ] = "Kann nicht für %s G verkauft werden"
}
