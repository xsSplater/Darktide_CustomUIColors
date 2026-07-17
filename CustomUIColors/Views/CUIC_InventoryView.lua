-- Views/CUIC_InventoryView.lua
local mod = get_mod("CustomUIColors")

local menu_name = "inventory_menu"
local VIEW_NAME = "InventoryView"

-- Порядок виджетов
local WIDGET_ORDER = {
	"wallet_entry_1",
	"wallet_entry_2",
	"wallet_entry_3",
	"wallet_entry_4",

	"widget_entry_3",
	"widget_entry_7",
	"widget_entry_8",
	"widget_entry_10",
	"widget_entry_11",

}


local WIDGETS = {
-- КОШЕЛЬ
	-- Widget: wallet_entry_1						-- Кошель - валюта 1 снизу
	-- Other style keys:
		-- "style_id_1.default_text_color",
		-- "style_id_1.default_color",
		-- "style_id_1.disabled_text_color",
	wallet_entry_1 = {
		style_ids = {
			-- "style_id_2.color",					-- Иконка
			"style_id_1.text_color",
		},
		default_color = "gold",
		supports_alpha = true,
		default_alpha = 255,
	},
	-- Widget: wallet_entry_2						-- Кошель - валюта 2 снизу
	-- Other style keys:
		-- "style_id_1.default_text_color",
		-- "style_id_1.default_color",
		-- "style_id_1.disabled_text_color",
	wallet_entry_2 = {
		style_ids = {
			-- "style_id_2.color",					-- Иконка
			"style_id_1.text_color",
		},
		default_color = "gold",
		supports_alpha = true,
		default_alpha = 255,
	},
	-- Widget: wallet_entry_3						-- Кошель - валюта 3 снизу
	-- Other style keys:
		-- "style_id_1.default_text_color",
		-- "style_id_1.default_color",
		-- "style_id_1.disabled_text_color",
	wallet_entry_3 = {
		style_ids = {
			-- "style_id_2.color",					-- Иконка
			"style_id_1.text_color",
		},
		default_color = "gold",
		supports_alpha = true,
		default_alpha = 255,
	},
	-- Widget: wallet_entry_4						-- Кошель - валюта 4 снизу
	-- Other style keys:
		-- "style_id_1.default_text_color",
		-- "style_id_1.default_color",
		-- "style_id_1.disabled_text_color",
	wallet_entry_4 = {
		style_ids = {
			-- "style_id_2.color",					-- Иконка
			"style_id_1.text_color",
		},
		default_color = "gold",
		supports_alpha = true,
		default_alpha = 255,
	},


	-- Widget: widget_entry_10						-- Фон под рамками оружия
	widget_entry_10 = {
		style_ids = {
			"texture.color",
		},
		default_color = "online_green",
		supports_alpha = true,
		default_alpha = 155,
	},
	-- Widget: widget_entry_11						-- Фон под рамками курий
	widget_entry_11 = {
		style_ids = {
			"texture.color",
		},
		default_color = "online_green",
		supports_alpha = true,
		default_alpha = 155,
	},


	-- Widget: widget_entry_7						-- Надпись Основное оружие
	-- Other style keys:
		-- "style_id_2.default_color",
		-- "style_id_2.default_text_color",
		-- "style_id_2.disabled_text_color",
	widget_entry_7 = {
		style_ids = {
			"new_indicator.color",			-- метка "новый предмет"
		-- "style_id_2.text_color",			-- надпись
		},
		supports_alpha = true,
		mapping = {
			["new_indicator.color"] = {
				color_id = "widget_entry_7_new_indicator_color",
				alpha_id = "widget_entry_7_new_indicator_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			-- ["style_id_2.text_color"] = {
				-- color_id = "widget_entry_7_style_id_2_text_color",
				-- alpha_id = "widget_entry_7_style_id_2_text_alpha",
				-- default_color = "online_green",
				-- default_alpha = 255
			-- },
		},
	},
	-- Widget: widget_entry_8						-- Надпись Дополнительное оружие
	-- Other style keys:
		-- "style_id_2.default_color",
		-- "style_id_2.default_text_color",
		-- "style_id_2.disabled_text_color",
	widget_entry_8 = {
		style_ids = {
			"new_indicator.color",			-- метка "новый предмет"
		-- "style_id_2.text_color",			-- надпись
		},
		supports_alpha = true,
		mapping = {
			["new_indicator.color"] = {
				color_id = "widget_entry_8_new_indicator_color",
				alpha_id = "widget_entry_8_new_indicator_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			-- ["style_id_2.text_color"] = {
				-- color_id = "widget_entry_8_style_id_2_text_color",
				-- alpha_id = "widget_entry_8_style_id_2_text_alpha",
				-- default_color = "online_green",
				-- default_alpha = 255
			-- },
		},
	},
	-- Widget: widget_entry_3						-- Надпись Курии
	-- Other style keys:
		-- "style_id_2.default_color",
		-- "style_id_2.default_text_color",
		-- "style_id_2.disabled_text_color",
	widget_entry_3 = {
		style_ids = {
			"new_indicator.color",			-- метка "новый предмет"
		-- "style_id_2.text_color",			-- надпись
		},
		supports_alpha = true,
		mapping = {
			["new_indicator.color"] = {
				color_id = "widget_entry_3_new_indicator_color",
				alpha_id = "widget_entry_3_new_indicator_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			-- ["style_id_2.text_color"] = {
				-- color_id = "widget_entry_3_style_id_2_text_color",
				-- alpha_id = "widget_entry_3_style_id_2_text_alpha",
				-- default_color = "online_green",
				-- default_alpha = 255
			-- },
		},
	},


	-- Widget: widget_entry_1						-- Рамка основного оружия + Голова в косметике
	-- widget_entry_1 = {
		-- style_ids = {
			-- "inner_highlight.color",
			-- "frame.color",
			-- "rarity_tag.color",
			-- "corner.color",
			-- "background_gradient.color",
			-- "background.color",
			-- "loading.color",
			-- "button_gradient.color",
			-- "outer_shadow.color",
			-- "icon.color",
			-- "rarity_name.text_color",
			-- "display_name.text_color",
			-- "item_level.text_color",
			-- "sub_display_name.text_color",
			-- "rarity_name.default_text_color",
			-- "rarity_name.default_color",
			-- "rarity_name.disabled_text_color",
			-- "rarity_name.hover_color",
			-- "frame.default_color",
			-- "frame.hover_color",
			-- "frame.selected_color",
			-- "display_name.default_text_color",
			-- "display_name.default_color",
			-- "display_name.disabled_color",
			-- "display_name.disabled_text_color",
			-- "display_name.hover_color",
			-- "item_level.default_text_color",
			-- "item_level.default_color",
			-- "item_level.disabled_text_color",
			-- "item_level.hover_color",
			-- "sub_display_name.default_text_color",
			-- "sub_display_name.default_color",
			-- "sub_display_name.disabled_text_color",
			-- "sub_display_name.hover_color",
			-- "corner.default_color",
			-- "corner.hover_color",
			-- "corner.selected_color",
			-- "background_gradient.default_color",
			-- "background.selected_color",
			-- "button_gradient.default_color",
			-- "button_gradient.selected_color",
		-- },
		-- default_color = "blue",
		-- supports_alpha = true,
		-- default_alpha = 255,
	-- },
	-- Widget: widget_entry_2						-- Рамка дополнительного оружия + Тело в косметике
	-- widget_entry_2 = {
		-- style_ids = {
			-- "inner_highlight.color",
			-- "frame.color",
			-- "rarity_tag.color",
			-- "corner.color",
			-- "background_gradient.color",
			-- "background.color",
			-- "loading.color",
			-- "button_gradient.color",
			-- "outer_shadow.color",
			-- "icon.color",
			-- "rarity_name.text_color",
			-- "display_name.text_color",
			-- "item_level.text_color",
			-- "sub_display_name.text_color",
			-- "rarity_name.default_text_color",
			-- "rarity_name.default_color",
			-- "rarity_name.disabled_text_color",
			-- "rarity_name.hover_color",
			-- "frame.default_color",
			-- "frame.hover_color",
			-- "frame.selected_color",
			-- "display_name.default_text_color",
			-- "display_name.default_color",
			-- "display_name.disabled_color",
			-- "display_name.disabled_text_color",
			-- "display_name.hover_color",
			-- "item_level.default_text_color",
			-- "item_level.default_color",
			-- "item_level.disabled_text_color",
			-- "item_level.hover_color",
			-- "sub_display_name.default_text_color",
			-- "sub_display_name.default_color",
			-- "sub_display_name.disabled_text_color",
			-- "sub_display_name.hover_color",
			-- "corner.default_color",
			-- "corner.hover_color",
			-- "corner.selected_color",
			-- "background_gradient.default_color",
			-- "background.selected_color",
			-- "button_gradient.default_color",
			-- "button_gradient.selected_color",
		-- },
		-- default_color = "blue",
		-- supports_alpha = true,
		-- default_alpha = 255,
	-- },
	-- Widget: widget_entry_4						-- Рамка 1 курии + Аксессуар в косметике
	-- widget_entry_4 = {
		-- style_ids = {
			-- "style_id_13.color",
			-- "inner_highlight.color",
			-- "inner_frame.color",
			-- "frame.color",
			-- "corner.color",
			-- "background.color",
			-- "button_gradient.color",
			-- "icon.color",
			-- "loading.color",
			-- "outer_shadow.color",
			-- "background_gradient.color",
			-- "item_level.text_color",
			-- "style_id_16.text_color",
			-- "style_id_17.text_color",
			-- "display_name.text_color",
			-- "style_id_15.text_color",
			-- "item_level.default_text_color",
			-- "item_level.default_color",
			-- "item_level.disabled_text_color",
			-- "item_level.hover_color",
			-- "style_id_16.default_text_color",
			-- "style_id_16.default_color",
			-- "style_id_16.disabled_color",
			-- "style_id_16.disabled_text_color",
			-- "style_id_16.hover_color",
			-- "style_id_17.default_text_color",
			-- "style_id_17.default_color",
			-- "style_id_17.disabled_color",
			-- "style_id_17.disabled_text_color",
			-- "style_id_17.hover_color",
			-- "display_name.default_text_color",
			-- "display_name.default_color",
			-- "display_name.disabled_color",
			-- "display_name.disabled_text_color",
			-- "display_name.hover_color",
			-- "inner_frame.default_color",
			-- "inner_frame.hover_color",
			-- "inner_frame.selected_color",
			-- "frame.default_color",
			-- "frame.hover_color",
			-- "frame.selected_color",
			-- "corner.default_color",
			-- "corner.hover_color",
			-- "corner.selected_color",
			-- "background.selected_color",
			-- "button_gradient.default_color",
			-- "button_gradient.selected_color",
			-- "background_gradient.default_color",
			-- "style_id_15.default_text_color",
			-- "style_id_15.default_color",
			-- "style_id_15.disabled_color",
			-- "style_id_15.disabled_text_color",
			-- "style_id_15.hover_color",
		-- },
		-- default_color = "blue",
		-- supports_alpha = true,
		-- default_alpha = 255,
	-- },
	-- Widget: widget_entry_5						-- Рамка 2 курии + Рама в косметике
	-- widget_entry_5 = {
		-- style_ids = {
			-- "style_id_13.color",
			-- "inner_highlight.color",
			-- "inner_frame.color",
			-- "frame.color",
			-- "corner.color",
			-- "background.color",
			-- "button_gradient.color",
			-- "icon.color",
			-- "loading.color",
			-- "outer_shadow.color",
			-- "background_gradient.color",
			-- "item_level.text_color",
			-- "style_id_16.text_color",
			-- "style_id_17.text_color",
			-- "display_name.text_color",
			-- "style_id_15.text_color",
			-- "item_level.default_text_color",
			-- "item_level.default_color",
			-- "item_level.disabled_text_color",
			-- "item_level.hover_color",
			-- "style_id_16.default_text_color",
			-- "style_id_16.default_color",
			-- "style_id_16.disabled_color",
			-- "style_id_16.disabled_text_color",
			-- "style_id_16.hover_color",
			-- "style_id_17.default_text_color",
			-- "style_id_17.default_color",
			-- "style_id_17.disabled_color",
			-- "style_id_17.disabled_text_color",
			-- "style_id_17.hover_color",
			-- "display_name.default_text_color",
			-- "display_name.default_color",
			-- "display_name.disabled_color",
			-- "display_name.disabled_text_color",
			-- "display_name.hover_color",
			-- "inner_frame.default_color",
			-- "inner_frame.hover_color",
			-- "inner_frame.selected_color",
			-- "frame.default_color",
			-- "frame.hover_color",
			-- "frame.selected_color",
			-- "corner.default_color",
			-- "corner.hover_color",
			-- "corner.selected_color",
			-- "background.selected_color",
			-- "button_gradient.default_color",
			-- "button_gradient.selected_color",
			-- "background_gradient.default_color",
			-- "style_id_15.default_text_color",
			-- "style_id_15.default_color",
			-- "style_id_15.disabled_color",
			-- "style_id_15.disabled_text_color",
			-- "style_id_15.hover_color",
		-- },
		-- default_color = "blue",
		-- supports_alpha = true,
		-- default_alpha = 255,
	-- },
	-- Widget: widget_entry_6						-- Рамка 3 курии + Медаль в косметике
	-- widget_entry_6 = {
		-- style_ids = {
			-- "style_id_13.color",
			-- "inner_highlight.color",
			-- "inner_frame.color",
			-- "frame.color",
			-- "corner.color",
			-- "background.color",
			-- "button_gradient.color",
			-- "icon.color",
			-- "loading.color",
			-- "outer_shadow.color",
			-- "background_gradient.color",
			-- "item_level.text_color",
			-- "style_id_16.text_color",
			-- "style_id_17.text_color",
			-- "display_name.text_color",
			-- "style_id_15.text_color",
			-- "item_level.default_text_color",
			-- "item_level.default_color",
			-- "item_level.disabled_text_color",
			-- "item_level.hover_color",
			-- "style_id_16.default_text_color",
			-- "style_id_16.default_color",
			-- "style_id_16.disabled_color",
			-- "style_id_16.disabled_text_color",
			-- "style_id_16.hover_color",
			-- "style_id_17.default_text_color",
			-- "style_id_17.default_color",
			-- "style_id_17.disabled_color",
			-- "style_id_17.disabled_text_color",
			-- "style_id_17.hover_color",
			-- "display_name.default_text_color",
			-- "display_name.default_color",
			-- "display_name.disabled_color",
			-- "display_name.disabled_text_color",
			-- "display_name.hover_color",
			-- "inner_frame.default_color",
			-- "inner_frame.hover_color",
			-- "inner_frame.selected_color",
			-- "frame.default_color",
			-- "frame.hover_color",
			-- "frame.selected_color",
			-- "corner.default_color",
			-- "corner.hover_color",
			-- "corner.selected_color",
			-- "background.selected_color",
			-- "button_gradient.default_color",
			-- "button_gradient.selected_color",
			-- "background_gradient.default_color",
			-- "style_id_15.default_text_color",
			-- "style_id_15.default_color",
			-- "style_id_15.disabled_color",
			-- "style_id_15.disabled_text_color",
			-- "style_id_15.hover_color",
		-- },
		-- default_color = "blue",
		-- supports_alpha = true,
		-- default_alpha = 255,
	-- },


	-- Widget: widget_entry_9						-- Рамка основная оружия и курий
	-- widget_entry_9 = {
		-- description = "Widget entry 9",
		-- style_ids = { "texture.color", },
		-- default_color = "online_green",
		-- supports_alpha = true,
		-- default_alpha = 255,
	-- },


	-- Widget: tab_menu_back_button					-- ???
	-- tab_menu_back_button = {
		-- style_ids = {
			-- "style_id_4.color",
			-- "style_id_2.color",
			-- "style_id_3.color",
		-- },
		-- default_color = "blue",
		-- supports_alpha = true,
		-- default_alpha = 255,
	-- },
	-- Widget: tab_menu_title_text					-- ???
	-- tab_menu_title_text = {
		-- style_ids = {
			-- "style_id_1.text_color",
			-- "style_id_1.default_text_color",
			-- "style_id_1.default_color",
			-- "style_id_1.hover_text_color",
			-- "style_id_1.disabled_text_color",
		-- },
		-- default_color = "terminal_text_body",
		-- supports_alpha = true,
		-- default_alpha = 255,
	-- },


	-- Widget: widget_exclamation_mark_entry_1		-- ???
	-- widget_exclamation_mark_entry_1 = {
		-- style_ids = {
			-- "exclamation_mark.color",
			-- "exclamation_mark.warning_color",
			-- "exclamation_mark.modified_color",
		-- },
		-- default_color = "blue",
		-- supports_alpha = true,
		-- default_alpha = 255,
	-- },
	-- Widget: widget_exclamation_mark_entry_2		-- ???
	-- widget_exclamation_mark_entry_2 = {
		-- style_ids = {
			-- "exclamation_mark.color",
			-- "exclamation_mark.warning_color",
			-- "exclamation_mark.modified_color",
		-- },
		-- default_color = "blue",
		-- supports_alpha = true,
		-- default_alpha = 255,
	-- },
	-- Widget: widget_exclamation_mark_entry_4		-- ???
	-- widget_exclamation_mark_entry_4 = {
		-- style_ids = {
			-- "exclamation_mark.color",
			-- "exclamation_mark.warning_color",
			-- "exclamation_mark.modified_color",
		-- },
		-- default_color = "blue",
		-- supports_alpha = true,
		-- default_alpha = 255,
	-- },
	-- Widget: widget_exclamation_mark_entry_5		-- ???
	-- widget_exclamation_mark_entry_5 = {
		-- style_ids = {
			-- "exclamation_mark.color",
			-- "exclamation_mark.warning_color",
			-- "exclamation_mark.modified_color",
		-- },
		-- default_color = "blue",
		-- supports_alpha = true,
		-- default_alpha = 255,
	-- },
	-- Widget: widget_exclamation_mark_entry_6		-- ???
	-- widget_exclamation_mark_entry_6 = {
		-- style_ids = {
			-- "exclamation_mark.color",
			-- "exclamation_mark.warning_color",
			-- "exclamation_mark.modified_color",
		-- },
		-- default_color = "blue",
		-- supports_alpha = true,
		-- default_alpha = 255,
	-- },


	-- Widget: grid_background						-- ???
	-- grid_background = {
		-- style_ids = {
			-- "style_id_1.color",
			-- "style_id_2.color",
			-- "style_id_3.color",
		-- },
		-- default_color = "chocolate",
		-- supports_alpha = true,
		-- default_alpha = 255,
	-- },
	-- Widget: grid_mask							-- ???
	-- grid_mask = {
		-- style_ids = { "style_id_1.color", },
		-- default_color = "violet",
		-- supports_alpha = true,
		-- default_alpha = 255,
	-- },
	-- Widget: grid_scrollbar						-- ???
	-- grid_scrollbar = {
		-- style_ids = {
			-- "track_background.color",
			-- "thumb.color",
			-- "track_frame.color",
			-- "thumb.highlight_color",
			-- "thumb.idle_color",
		-- },
		-- default_color = "chocolate",
		-- supports_alpha = true,
		-- default_alpha = 255,
	-- },
}

return {
	menu_name = menu_name,
	VIEW_NAME = VIEW_NAME,
	WIDGETS = WIDGETS,
	WIDGET_ORDER = WIDGET_ORDER,
}
