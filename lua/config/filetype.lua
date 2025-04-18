-- gitconfig and gitignore filetypes
vim.filetype.add {
  pattern = {
    -- */git/ignore or */.git/ignore
    ['.*/%.?git/ignore'] = 'gitignore',
    -- */git/* or */.git/*
    ['.*/%.?git/.*'] = 'gitconfig',
  },
}
