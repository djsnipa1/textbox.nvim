-- Define a function to create the box
local function create_box(text)
  local max_width = 42
  local text_length = #text
  local spaces_to_add = max_width - text_length
  local line = string.rep(" ", spaces_to_add)

  print("┌──────────────────────────────────────────────┐")
  print("│ " .. text .. line .. " │")
  print("└──────────────────────────────────────────────┘")
end

-- Create a user command in Neovim
vim.api.nvim_create_user_command(
  'CreateBox',
  function(opts)
    create_box(opts.args)
  end,
  { nargs = 1 }
)
