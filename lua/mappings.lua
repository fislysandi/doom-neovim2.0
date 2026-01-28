--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: mappings.lua
-- Description: Doom Emacs-like Key mappings
-- Author: Kien Nguyen-Tuan <kiennt2609@gmail.com>

local map = vim.keymap.set

-- Git Jump: Find all git repositories in HOME and jump to them
local function git_jump()
    local ok, pickers = pcall(require, "telescope.pickers")
    if not ok then return end
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    local home = vim.fn.expand("$HOME")

    pickers.new({}, {
        prompt_title = "Git Jump",
        finder = finders.new_oneshot_job({
            "fd",
            "--hidden",
            "--type", "d",
            "--glob", ".git",
            home,
            "--exclude", "Library",
            "--exclude", "AppData",
            "--exclude", "node_modules",
            "--exclude", "scoop",
            "--exclude", ".cache",
            "--exclude", ".local",
        }, {
            entry_maker = function(entry)
                local dir = vim.fn.fnamemodify(entry, ":p:h:h")
                return {
                    value = dir,
                    display = dir:gsub(home, "~"),
                    ordinal = dir,
                }
            end
        }),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if selection then
                    vim.cmd("cd " .. selection.value)
                    vim.notify("Jumped to " .. selection.value)
                    require("telescope.builtin").find_files({ cwd = selection.value })
                end
            end)
            return true
        end,
    }):find()
end

-- =============================================================================
-- Core / Top-level
-- =============================================================================

-- Quick actions
map("n", "<leader>SPC", function() require("telescope.builtin").find_files() end, { desc = "Find file in project" })
map("n", "<leader>.", function() require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") }) end, { desc = "Browse files" })
map("n", "<leader>,", function() require("telescope.builtin").buffers() end, { desc = "Switch buffer" })
map("n", "<leader>/", function() require("telescope.builtin").live_grep() end, { desc = "Search project" })
map("n", "<leader>:", function() require("telescope.builtin").command_history() end, { desc = "Command history" })
map("n", "<leader>`", function() require("telescope.builtin").resume() end, { desc = "Resume last search" })

-- =============================================================================
-- [b] Buffer
-- =============================================================================
map("n", "<leader>bb", function() require("telescope.builtin").buffers() end, { desc = "Switch buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Kill buffer" })
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bR", "<cmd>edit!<CR>", { desc = "Revert buffer" })
map("n", "<leader>bs", "<cmd>write<CR>", { desc = "Save buffer" })

-- =============================================================================
-- [c] Code (LSP)
-- =============================================================================
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>cf", function() require("conform").format({ lsp_fallback = true }) end, { desc = "Format buffer" })
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>cx", function() require("telescope.builtin").diagnostics() end, { desc = "List diagnostics" })
map("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Jump to definition" })
map("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "Jump to declaration" })
map("n", "<leader>ci", vim.lsp.buf.implementation, { desc = "Jump to implementation" })
map("n", "<leader>ct", vim.lsp.buf.type_definition, { desc = "Jump to type definition" })
map("n", "<leader>ck", vim.lsp.buf.hover, { desc = "Hover documentation" })
map("n", "<leader>cc", "gcc", { desc = "Toggle comment line", remap = true })
map("v", "<leader>cc", "gc", { desc = "Toggle comment selection", remap = true })

-- Global LSP (Vim-style)
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gr", function() require("telescope.builtin").lsp_references() end, { desc = "Go to references" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })

-- =============================================================================
-- [f] File
-- =============================================================================
map("n", "<leader>ff", function() require("telescope.builtin").find_files() end, { desc = "Find file" })
map("n", "<leader>fg", git_jump, { desc = "Git jump (find git repos)" })
map("n", "<leader>fs", "<cmd>write<CR>", { desc = "Save file" })
map("n", "<leader>fr", function() require("telescope.builtin").oldfiles() end, { desc = "Recent files" })
map("n", "<leader>fp", function() require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Open private config" })
map("n", "<leader>fD", function() vim.fn.delete(vim.api.nvim_buf_get_name(0)) end, { desc = "Delete this file" })

-- =============================================================================
-- [g] Git
-- =============================================================================
map("n", "<leader>gs", function() require("telescope.builtin").git_status() end, { desc = "Git status" })
map("n", "<leader>gb", function() require("gitsigns").blame_line() end, { desc = "Git blame" })
map("n", "<leader>gc", function() require("telescope.builtin").git_commits() end, { desc = "Git commits" })
map("n", "<leader>gd", function() require("gitsigns").diffthis() end, { desc = "Git diff" })

-- =============================================================================
-- [o] Open
-- =============================================================================
map("n", "<leader>ot", function() 
    local height = math.floor(vim.o.lines / 2)
    vim.cmd("belowright split | resize " .. height .. " | terminal")
end, { desc = "Open terminal" })
map("n", "<leader>of", function() require("mini.files").open(vim.api.nvim_buf_get_name(0), true) end, { desc = "File manager (mini.files)" })
map("n", "<leader>oo", "<cmd>OpenCode<CR>", { desc = "OpenCode" })
map("n", "<leader>oc", "<cmd>OpenCodeChat<CR>", { desc = "OpenCode Chat" })

-- =============================================================================
-- [p] Project
-- =============================================================================
map("n", "<leader>pf", function() require("telescope.builtin").find_files() end, { desc = "Find file in project" })
map("n", "<leader>pp", function() require("telescope.builtin").planets() end, { desc = "Project (dummy)" }) -- Doom uses projectile

-- =============================================================================
-- [s] Search
-- =============================================================================
map("n", "<leader>ss", function() require("telescope.builtin").current_buffer_fuzzy_find() end, { desc = "Search buffer" })
map("n", "<leader>sp", function() require("telescope.builtin").live_grep() end, { desc = "Search project" })
map("n", "<leader>sd", function() require("telescope.builtin").diagnostics() end, { desc = "Search diagnostics" })
map("n", "<leader>sh", function() require("telescope.builtin").help_tags() end, { desc = "Search help" })
map("n", "<leader>sk", function() require("telescope.builtin").keymaps() end, { desc = "Search keymaps" })

-- =============================================================================
-- [w] Window
-- =============================================================================
map("n", "<leader>wh", "<C-w>h", { desc = "Window left" })
map("n", "<leader>wj", "<C-w>j", { desc = "Window down" })
map("n", "<leader>wk", "<C-w>k", { desc = "Window up" })
map("n", "<leader>wl", "<C-w>l", { desc = "Window right" })
map("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Vertical split" })
map("n", "<leader>ws", "<cmd>split<CR>", { desc = "Horizontal split" })
map("n", "<leader>wd", "<C-w>c", { desc = "Close window" })
map("n", "<leader>wq", "<C-w>c", { desc = "Close window" })
map("n", "<leader>ww", "<C-w>w", { desc = "Next window" })

-- =============================================================================
-- Miscs
-- =============================================================================

-- Commenting (Doom uses SPC ; or g c)
map("n", "<leader>;", "gcc", { desc = "Toggle comment", remap = true })
map("v", "<leader>;", "gc", { desc = "Toggle comment", remap = true })
map("n", "mm", "gcc", { desc = "Toggle comment", remap = true })

-- Reload
function _G.reload_config()
    local reload = require("plenary.reload").reload_module
    reload("me", false)
    dofile(vim.env.MYVIMRC)
    vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end
map("n", "<leader>hr", _G.reload_config, { desc = "Reload configuration" })
map("n", "<leader>hk", function() require("telescope.builtin").keymaps() end, { desc = "View keybindings" })

-- Esc to clear hlsearch
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- =============================================================================
-- Which-key groups
-- =============================================================================
local ok, wk = pcall(require, "which-key")
if ok then
    wk.add({
        { "<leader>b", group = "buffer" },
        { "<leader>c", group = "code" },
        { "<leader>f", group = "file" },
        { "<leader>g", group = "git" },
        { "<leader>h", group = "help/reload" },
        { "<leader>o", group = "open" },
        { "<leader>p", group = "project" },
        { "<leader>s", group = "search" },
        { "<leader>w", group = "window" },
    })
end
