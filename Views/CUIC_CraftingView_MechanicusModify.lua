-- CUIC_crafting_mechanicus_modify_view.lua
local mod = get_mod("CustomUIColors")

local menu_name = "crafting_mechanicus_modify"
local VIEW_NAME = "CraftingMechanicusModifyView"

-- Порядок виджетов
local WIDGET_ORDER = {
	"tabs_background",
	-- "display_name",
	-- "display_name_divider",
	-- "display_name_divider_glow",
	-- "sub_display_name",
}


local WIDGETS = {
	-- Widget: tabs_background
	tabs_background = {
		style_ids = { "style_id_1.color", },
		default_color = "online_green",
		supports_alpha = true,
		default_alpha = 255,
	},
	-- Widget: display_name
	-- display_name = {
		-- style_ids = {
			-- "style_id_1.text_color",
			-- "style_id_1.default_text_color",
			-- "style_id_1.default_color",
			-- "style_id_1.disabled_color",
			-- "style_id_1.disabled_text_color",
			-- "style_id_1.hover_color",
		-- },
		-- default_color = "blue",
		-- supports_alpha = true,
		-- default_alpha = 255,
	-- },
	-- Widget: display_name_divider
	-- display_name_divider = {
		-- style_ids = { "style_id_1.color", },
		-- default_color = "online_green",
		-- supports_alpha = true,
		-- default_alpha = 255,
	-- },
	-- Widget: display_name_divider_glow
	-- display_name_divider_glow = {
		-- style_ids = { "texture.color", },
		-- default_color = "blue",
		-- supports_alpha = true,
		-- default_alpha = 255,
	-- },
	-- Widget: sub_display_name
	-- sub_display_name = {
		-- style_ids = {
			-- "style_id_1.text_color",
			-- "style_id_1.default_text_color",
			-- "style_id_1.default_color",
			-- "style_id_1.disabled_text_color",
		-- },
		-- default_color = "blue",
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
