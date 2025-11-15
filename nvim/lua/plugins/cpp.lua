-- lua/plugins/cpp.lua
return {
  -- Gutentags: tự động tạo/update tags
  {
    "ludovicchabant/vim-gutentags",
    config = function()
      vim.g.gutentags_ctags_executable = "ctags"
      vim.g.gutentags_project_root = {'.git', '.svn', 'Makefile', 'build.gradle'}
      vim.g.gutentags_generate_on_write = 1
      vim.g.gutentags_generate_on_missing = 1
      vim.g.gutentags_add_default_project_roots = 1
      vim.g.gutentags_ctags_extra_args = {
        "--languages=C,C++",
        "--c++-kinds=+p",
        "--fields=+iaS",
        "--extra=+q"
      }
    end
  },

  -- LSP clangd
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.clangd.setup({
        cmd = { "clangd" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        capabilities = capabilities,
        root_dir = function(fname)
          return lspconfig.util.find_git_ancestor(fname) or vim.loop.cwd()
        end,
      })
    end
  },

  -- Autocomplete nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip"
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        },
      })
    end,
  },

  -- Treesitter: syntax & folding
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "cpp", "lua", "bash", "vim" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- Cscope auto-load (nếu có cscope.out)
  {
    "junegunn/vim-plug", -- dummy để chạy config Lua
    config = function()
      if vim.fn.exists(":cs") == 2 and vim.fn.filereadable("cscope.out") == 1 then
        vim.cmd("cs add cscope.out")
        vim.cmd("cs reset")
      end
    end
  },
}
