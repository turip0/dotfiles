return {
  { "seandewar/actually-doom.nvim" }, -- (:Doom)

  { "ingur/floatty.nvim" }, -- terminal (C-t)

  {
    "gisketch/triforce.nvim", --rpg stats (:triforce profile)
    dependencies = { "nvzone/volt" },
    opts = {},
  },

  {
    "sontungexpt/stcursorword", -- highlight word under cursor
    event = "VeryLazy",
    config = true,
  },
  {
    "ccc-nvim/ccc", -- color picker (CccPick)
    dir = "~/.config/nvim/lua/plugins/ccc.nvim",
    dev = true,
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("ccc").setup({
        -- Your preferred settings
        -- Example: enable highlighter
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
      })
    end,
  },
}
