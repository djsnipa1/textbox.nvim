-- Define a function to create the box and insert it into the buffer
local function create_box(text)
  local max_width = 28
  local text_length = #text
  local spaces_to_add = max_width - text_length
  local line = string.rep(" ", spaces_to_add)

  local lines = {
    "# ╭──────────────────────────────╮",
    "# │ " .. text .. line .. " │",
    "# ╰──────────────────────────────╯"
  }

  -- Get the current buffer and cursor position
  local buf = vim.api.nvim_get_current_buf()
  local row = vim.api.nvim_win_get_cursor(0)[1]

  -- Insert the box lines into the buffer
  vim.api.nvim_buf_set_lines(buf, row - 1, row - 1, false, lines)
end

-- Create a user command in Neovim
vim.api.nvim_create_user_command(
  'CreateBox',
  function(opts)
    create_box(opts.args)
  end,
  { nargs = 1 }
)
