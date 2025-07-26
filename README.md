# .base.nvim

My base configuration for neovim, like a personal simple distro.

I import it into my neovim main configs with lazy using the following spec:

```lua
require('lazy').setup({
  spec = {
    {
      dir = vim.fn.expand('~/.base.nvim'),
      opts = {},
      import = 'base.plugins',
    },
    -- ...
  },
})
```
