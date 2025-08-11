vim.pack.add {
  'gh:owen-dechow/videre.nvim',
  'gh:Owen-Dechow/nvim_json_graph_view',
  'gh:Owen-Dechow/graph_view_yaml_parser', -- Optional: add YAML support
  'gh:Owen-Dechow/graph_view_toml_parser', -- Optional: add TOML support
  -- 'gh:a-usr/xml2lua.nvim', -- Optional | Experimental: add XML support
}

require('videre').setup {
  round_units = false,
  keymap_desc_deliminator = '->',
  link_backward = 'H',
}
