local subdir = "src/backs/"

if (SMODS.Mods["Pokermon"] or {}).can_load and SMODS.Mods["Pokermon"] then
  local backs = NFS.getDirectoryItems(mod_dir..subdir)

  for _, file in ipairs(backs) do
    sendDebugMessage ("The file is: "..file)
    local back, load_error = SMODS.load_file(subdir..file)
    if load_error then
      sendDebugMessage ("The error is: "..load_error)
    else
      local curr_back = back()
      if curr_back.init then curr_back:init() end
      
      for i, item in ipairs(curr_back.list) do
        SMODS.Back(item)
      end
    end
  end
end