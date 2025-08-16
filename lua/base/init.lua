return {
  setup = function(opts)
    require 'base.config.general'
    require 'base.config.keymaps'
    require 'base.config.autocmds'
    require 'base.config.diagnostic'
    if opts.autocompletion then
      require 'base.config.autocompletion'
    end
  end,
}
