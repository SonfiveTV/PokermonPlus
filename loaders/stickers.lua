local subdir = "src/stickers/"

if (SMODS.Mods["Pokermon"] or {}).can_load and SMODS.Mods["Pokermon"] and not pokermon_config.jokers_only then
    --Load stickers
    local stickers = NFS.getDirectoryItems(mod_dir..subdir)
  
    for _, file in ipairs(stickers) do
      sendDebugMessage ("The file is: "..file)
      local sticker, load_error = SMODS.load_file(subdir..file)
      if load_error then
        sendDebugMessage ("The error is: "..load_error)
      else
        local curr_sticker = sticker()
        if curr_sticker.init then curr_sticker:init() end
        
        for i, item in ipairs(curr_sticker.list) do
          SMODS.Sticker(item)
        end
      end
    end
  end
