-- code-feeder.lua
local M = {}

local api = vim.api
local marked_files = {}
local feeder_buffer = nil

-- Helper function to update the code-feeder buffer
local function update_feeder_buffer()
  if feeder_buffer and api.nvim_buf_is_valid(feeder_buffer) then
    api.nvim_buf_set_lines(feeder_buffer, 0, -1, false, marked_files)
  end
end

-- Add a file to the marked list
function M.add_file(file_path)
  if not vim.tbl_contains(marked_files, file_path) then
    table.insert(marked_files, file_path)
    update_feeder_buffer()
    print('Added file: ' .. file_path)
  else
    print('File already marked: ' .. file_path)
  end
end

-- Remove a file from the marked list
function M.remove_file(file_path)
  for i, path in ipairs(marked_files) do
    if path == file_path then
      table.remove(marked_files, i)
      update_feeder_buffer()
      print('Removed file: ' .. file_path)
      return
    end
  end
  print('File not found in marked list: ' .. file_path)
end

-- Open the code-feeder buffer
function M.open_feeder_buffer()
  if feeder_buffer == nil or not api.nvim_buf_is_valid(feeder_buffer) then
    feeder_buffer = api.nvim_create_buf(false, true) -- Create a new unlisted scratch buffer
    api.nvim_buf_set_name(feeder_buffer, 'code-feeder')

    -- Set buffer options
    api.nvim_buf_set_option(feeder_buffer, 'buftype', 'nofile')
    api.nvim_buf_set_option(feeder_buffer, 'modifiable', true)

    -- Set keymaps for the buffer
    api.nvim_buf_set_keymap(feeder_buffer, 'n', '<CR>', ":lua require('code-feeder').generate_string()<CR>", { noremap = true, silent = true })
    api.nvim_buf_set_keymap(feeder_buffer, 'n', 'dd', ":lua require('code-feeder').delete_line()<CR>", { noremap = true, silent = true })
  end

  -- Display the buffer
  api.nvim_set_current_buf(feeder_buffer)
  update_feeder_buffer()
end

-- Delete the current line in the feeder buffer
function M.delete_line()
  local current_line = api.nvim_get_current_line()
  M.remove_file(current_line)
end

-- Generate the formatted string with file paths and contents
function M.generate_string()
  local result = {}
  for _, file_path in ipairs(marked_files) do
    local file_content = {}
    local file = io.open(file_path, 'r')
    if file then
      for line in file:lines() do
        table.insert(file_content, line)
      end
      file:close()
      table.insert(result, file_path .. ':\n```')
      table.insert(result, table.concat(file_content, '\n'))
      table.insert(result, '```')
    else
      print('Could not read file: ' .. file_path)
    end
  end

  -- Copy the result to the clipboard
  local clipboard_string = table.concat(result, '\n')
  vim.fn.setreg('+', clipboard_string)
  print 'Generated string copied to clipboard!'
end

-- Keymap integration with nvim-tree
function M.setup_nvim_tree_keymap()
  vim.cmd [[    augroup CodeFeeder
      autocmd!
      autocmd FileType NvimTree lua require('code-feeder').set_nvim_tree_keymap()
    augroup END
  ]]
end

function M.set_nvim_tree_keymap()
  local api = vim.api
  local buf = api.nvim_get_current_buf()
  api.nvim_buf_set_keymap(buf, 'n', '<leader>m', ":lua require('code-feeder').mark_selected_file()<CR>", { noremap = true, silent = true })
end

function M.mark_selected_file()
  local node = require('nvim-tree.lib').get_node_at_cursor()
  if node and not node.nodes then -- Ensure it's a file, not a directory
    M.add_file(node.absolute_path)
  else
    print 'Cannot mark directories, only files.'
  end
end

vim.api.nvim_create_user_command('CodeFeederBuffer', function()
  M.open_feeder_buffer()
end, {})
vim.api.nvim_create_user_command('CodeFeederMark', function()
  M.mark_selected_file()
end, {})
vim.api.nvim_create_user_command('CodeFeederRemove', function()
  M.delete_line()
end, {})
vim.api.nvim_create_user_command('CodeFeederYank', function()
  M.generate_string()
end, {})

local spec = {
  'code-feeder.nvim',
  dependencies = {},
  config = function()
    -- require('code-feeder').setup_nvim_tree_keymap()
    -- Set a global keymap to open the code-feeder buffer
    -- vim.api.nvim_set_keymap('n', '<leader>cf', ":lua require('code-feeder').open_feeder_buffer()<CR>", { noremap = true, silent = true })
  end,
  dev = true,
}

return spec
