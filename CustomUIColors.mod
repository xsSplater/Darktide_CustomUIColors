return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`CustomUIColors` encountered an error loading the Darktide Mod Framework.")

		new_mod("CustomUIColors", {
			mod_script       = "CustomUIColors/CustomUIColors",
			mod_data         = "CustomUIColors/CustomUIColors_data",
			mod_localization = "CustomUIColors/CustomUIColors_localization",
		})
	end,
	packages = {},
}
