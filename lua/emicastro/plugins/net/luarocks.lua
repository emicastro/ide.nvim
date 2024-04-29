return {
  "vhyrro/luarocks.nvim",
  optional = true,
  priority = 1000,
  branch = "go-away-python",
  config = true,
  opts = {
    rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
  },
}
