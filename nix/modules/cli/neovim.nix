{ pkgs,... }:

{
  programs.neovim = {
    enable = true;         # 启用 neovim
    viAlias = true;        # vi 别名
    vimAlias = true;       # vim 别名
    defaultEditor = true;  # 设置默认编辑器

    plugins = with pkgs.vimPlugins; [
      molokai
    ];

    initLua = ''
      vim.opt.number = true            -- 显示行号
      vim.opt.relativenumber = true    -- 相对行号
      vim.opt.cursorline = true        -- 高亮当前行
      vim.opt.termguicolors = true     -- 启用终端颜色

      vim.opt.tabstop = 2              -- 设置制表符宽度为 2
      vim.opt.shiftwidth = 2           -- 设置缩进宽度为 2
      vim.opt.expandtab = true         -- 将制表符扩展为空格

      vim.cmd('colorscheme molokai')   -- 设置主题
    '';
  };
}