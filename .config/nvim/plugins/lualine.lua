require("lualine").setup({
  sections = {
    lualine_x = {
      -- Add one or more components
      require("triforce.lualine").session_time,
      "encoding",
      "fileformat",
      "filetype",
    },
  },
})
