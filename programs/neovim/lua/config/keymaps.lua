-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "i", "v" }, "<A-j><A-k>", "<Esc>", { silent = true })
vim.keymap.set("t", "<A-j><A-k>", "<C-\\><C-N>", { silent = true })
-- New tab
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { silent = true })
vim.keymap.set("n", "<leader>td", ":tabclose<CR>", { silent = true })
vim.keymap.set("n", "tn", ":tabn<CR>", { silent = true })
vim.keymap.set("n", "tp", ":tabp<CR>", { silent = true })

-- Prittier math equations
vim.keymap.set("n", "<leader>p", ":lua require('nabla').toggle_virt({silent = true})<CR>", { silent = true })

-- ZenMode
vim.keymap.set("n", "zm", ":ZenMode<CR>", { silent = true })

-- Pop-up terminal
vim.keymap.set("n", "tt", ":ToggleTerm direction=float<CR>", { silent = true })

-- Delete a word
vim.keymap.set("i", "<C-BS>", "<C-W>", { silent = true })

local function get_env_var(var)
	return vim.fn.getenv(var) or ""
end
vim.g.dadbod = {
	url = get_env_var("DB_CONNECTION"),
}
