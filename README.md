# wrapit

## IN PROGRESS

Creates a tag(a, img) by selecting string url.

![screenshot](screenshot.jpg)

1. select a url
2. run command(or keymap)

```lua
vim.keymap.set("v", "<leader>l", ":lua require('wrapit').link()<CR><CR>")
vim.keymap.set("v", "<leader>k", ":lua require('wrapit').image()<CR><CR>")
```

