local ok, tailwindcss_colors = pcall(require, "tailwindcss-colors")

if not ok then
	return
end

tailwindcss_colors.setup()
