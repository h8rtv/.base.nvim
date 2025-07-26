# .base.nvim

My base configuration for neovim, like a personal simple distro.

I usually have the repo cloned, and import it into my main configs with lazy.nvim using the following spec:

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
