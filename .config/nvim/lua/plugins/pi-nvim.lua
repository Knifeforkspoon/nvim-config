return {
  "carderne/pi-nvim",
  config = function()
    require("pi-nvim").setup()

    -- Additional pi keymaps
    vim.keymap.set("n", "<leader>pp", ":PiSend<CR>", { silent = true, desc = "Send prompt to pi" })
    vim.keymap.set("n", "<leader>pf", ":PiSendFile<CR>", { silent = true, desc = "Send file to pi" })
    vim.keymap.set("v", "<leader>ps", ":PiSendSelection<CR>", { silent = true, desc = "Send selection to pi" })
    vim.keymap.set("n", "<leader>pb", ":PiSendBuffer<CR>", { silent = true, desc = "Send buffer to pi" })
    vim.keymap.set("n", "<leader>pi", ":PiPing<CR>", { silent = true, desc = "Check pi connection" })
    vim.keymap.set("n", "<leader>pl", ":PiSessions<CR>", { silent = true, desc = "List pi sessions" })
  end,
}
