require("notify").setup({
	background_colour = "#000000",
  timeout = 3000,
  stages = "fade_in_slide_out"
})

local notify = require("notify")

notify("Neovim Başlatildi", "info",
    {
  title = "Test",
  timeout = 1500
  })


