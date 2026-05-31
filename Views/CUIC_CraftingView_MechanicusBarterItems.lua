-- CUIC_crafting_mechanicus_modify_view.lua
local mod = get_mod("CustomUIColors")

local menu_name = "crafting_mechanicus_barter_items"
local VIEW_NAME = "CraftingMechanicusBarterItemsView"

-- Порядок виджетов
local WIDGET_ORDER = {
	"confirm_button",
	"mastery_info",
	"patterns_grid_panels",
	"sacrifice_intro",
}


local WIDGETS = {
	-- Widget: confirm_button										-- Кнопка
	-- Other style keys:
		-- "background.color",
		-- "background_gradient.color",
		-- "background_gradient.selected_color",
		-- "corner.color",
		-- "corner.default_color",
		-- "corner.hover_color",
		-- "frame.color",
		-- "frame.default_color",
		-- "frame.hover_color",
		-- "style_id_6.color",
		-- "text.text_color",
		-- "text.default_color",
		-- "text.default_text_color",
		-- "text.disabled_color",
		-- "text.disabled_text_color",
		-- "text.hover_color",
	confirm_button = {
		style_ids = {
			"background_gradient.default_color",
			-- "style_id_8.color",
		},
		supports_alpha = true,
		mapping = {
			["background_gradient.default_color"] = {
				color_id = "confirm_button_background_gradient_default_color",
				alpha_id = "confirm_button_background_gradient_default_alpha",
				default_color = "online_green",
				default_alpha = 155
			},
			-- ["style_id_8.color"] = {
				-- color_id = "confirm_button_style_id_8_color",
				-- alpha_id = "confirm_button_style_id_8_alpha",
				-- default_color = "blue",
				-- default_alpha = 255
			-- },
		},
	},
	-- Widget: mastery_info										-- Верхняя рамка мастерства
	-- Other style keys:
		-- "added_exp.default_color",
		-- "added_exp.default_text_color",
		-- "added_exp.disabled_text_color",
		-- "added_exp.hover_color",
		-- "added_exp.text_color",				-- добавленный опыт - текст
		-- "display_name.default_color",
		-- "display_name.default_text_color",
		-- "display_name.disabled_color",
		-- "display_name.disabled_text_color",
		-- "display_name.hover_color",
		-- "display_name.text_color",
		-- "experience_bar_new.color",			-- добавленный опыт - полоска
		-- "icon.default_color",
		-- "icon.selected_color",
		-- "mastery_experience.default_color",
		-- "mastery_experience.default_text_color",
		-- "mastery_experience.disabled_text_color",
		-- "mastery_experience.hover_color",
		-- "mastery_experience.text_color",
		-- "mastery_level.default_color",
		-- "mastery_level.default_text_color",
		-- "mastery_level.disabled_text_color",
		-- "mastery_level.hover_color",
		-- "mastery_level.text_color",			-- text Mastery
	mastery_info = {
		style_ids = {
			"experience_bar.color",				-- полоска опыта - полоска
			"experience_bar_background.color",	-- полоска опыта - фон
			"experience_bar_line.color",		-- полоска опыта - рамка
			"icon.color",						-- иконка оружия
			"style_id_10.color",				-- фон верхней рамки
		},
		supports_alpha = true,
		mapping = {
			["experience_bar.color"] = {
				color_id = "mastery_info_experience_bar_color",
				alpha_id = "mastery_info_experience_bar_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["experience_bar_background.color"] = {
				color_id = "mastery_info_experience_bar_background_color",
				alpha_id = "mastery_info_experience_bar_background_alpha",
				default_color = "black",
				default_alpha = 255
			},
			["experience_bar_line.color"] = {
				color_id = "mastery_info_experience_bar_line_color",
				alpha_id = "mastery_info_experience_bar_line_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["icon.color"] = {
				color_id = "mastery_info_icon_color",
				alpha_id = "mastery_info_icon_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_10.color"] = {
				color_id = "mastery_info_style_id_10_color",
				alpha_id = "mastery_info_style_id_10_alpha",
				default_color = "online_green",
				default_alpha = 155
			},
		},
	},
	-- Widget: patterns_grid_panels										-- Рамка слева
	-- Other style keys:
		-- "display_name.default_text_color",
		-- "display_name.default_color",
		-- "display_name.disabled_color",
		-- "display_name.disabled_text_color",
		-- "display_name.hover_color",
	patterns_grid_panels = {
		style_ids = {
		-- "bottom.color",
			"candles_1.color",
			"candles_2.color",
		-- "display_name.text_color",
			"divider_bottom.color",
		-- "top.color",
		},
		supports_alpha = true,
		mapping = {
			-- ["bottom.color"] = {
				-- color_id = "patterns_grid_panels_bottom_color",
				-- alpha_id = "patterns_grid_panels_bottom_alpha",
				-- default_color = "online_green",
				-- default_alpha = 255
			-- },
			["candles_1.color"] = {
				color_id = "patterns_grid_panels_candles_1_color",
				alpha_id = "patterns_grid_panels_candles_1_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["candles_2.color"] = {
				color_id = "patterns_grid_panels_candles_2_color",
				alpha_id = "patterns_grid_panels_candles_2_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			-- ["display_name.text_color"] = {
				-- color_id = "patterns_grid_panels_display_name_text_color",
				-- alpha_id = "patterns_grid_panels_display_name_text_alpha",
				-- default_color = "online_green",
				-- default_alpha = 255
			-- },
			["divider_bottom.color"] = {
				color_id = "patterns_grid_panels_divider_bottom_color",
				alpha_id = "patterns_grid_panels_divider_bottom_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			-- ["top.color"] = {
				-- color_id = "patterns_grid_panels_top_color",
				-- alpha_id = "patterns_grid_panels_top_alpha",
				-- default_color = "online_green",
				-- default_alpha = 255
			-- },
		},
	},
	-- Widget: sacrifice_intro										-- Рамка с инструкцией
	-- Other style keys:
			-- "display_name.text_color",
			-- "description.text_color",
			-- "display_name.default_text_color",
			-- "display_name.default_color",
			-- "display_name.disabled_color",
			-- "display_name.disabled_text_color",
			-- "display_name.hover_color",
			-- "description.default_text_color",
			-- "description.default_color",
			-- "description.disabled_text_color",
			-- "description.hover_color",
	sacrifice_intro = {
		style_ids = {
			"style_id_1.color",						-- фон
		},
		supports_alpha = true,
		mapping = {
			["style_id_1.color"] = {
				color_id = "sacrifice_intro_style_id_1_color",
				alpha_id = "sacrifice_intro_style_id_1_alpha",
				default_color = "online_green",
				default_alpha = 155
			},
		},
	},

}

return {
	menu_name = menu_name,
	VIEW_NAME = VIEW_NAME,
	WIDGETS = WIDGETS,
	WIDGET_ORDER = WIDGET_ORDER,
}
