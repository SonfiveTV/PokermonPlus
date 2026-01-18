local subdir = "src/blinds/"

local blinds = NFS.getDirectoryItems(mod_dir..subdir)

for _, file in ipairs(blinds) do
  sendDebugMessage ("The file is: "..file)
  local blind, load_error = SMODS.load_file(subdir..file)
  if load_error then
    sendDebugMessage ("The error is: "..load_error)
  else
    local curr_blind = blind()
    if curr_blind.init then curr_blind:init() end
    
    for i, item in ipairs(curr_blind.list) do
      item.discovered = not pokermon_config.pokemon_discovery
      SMODS.Blind(item)
    end
  end
end