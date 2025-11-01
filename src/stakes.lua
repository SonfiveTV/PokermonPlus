local subdir = "src/stakes/"

if (SMODS.Mods["Pokermon"] or {}).can_load and SMODS.Mods["Pokermon"] and not pokermon_config.jokers_only then
    --Load stakes
    local stakes = NFS.getDirectoryItems(mod_dir..subdir)
  
    for _, file in ipairs(stakes) do
      sendDebugMessage ("The file is: "..file)
      local stakes, load_error = SMODS.load_file(subdir..file)
      if load_error then
        sendDebugMessage ("The error is: "..load_error)
      else
        local curr_stake = stakes()
        if curr_stake.init then curr_stake:init() end
        
        for i, item in ipairs(curr_stake.list) do
          SMODS.Stake(item)
        end
      end
    end
  end