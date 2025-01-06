return {
  "vim-test/vim-test",
  config = function()
    vim.g["test#ruby#rspec#executable"] = "docker compose exec spring bundle exec rspec"
    vim.api.nvim_create_user_command("TestN", "TestNearest", {})
    vim.api.nvim_create_user_command("TestF", "TestFile", {})
  end,
}
