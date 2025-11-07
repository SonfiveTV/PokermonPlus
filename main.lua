sonfive_config = SMODS.current_mod.config
mod_dir = ''..SMODS.current_mod.path
if (SMODS.Mods["Pokermon"] or {}).can_load then
    pokermon_config = SMODS.Mods["Pokermon"].config
end

if (SMODS.Mods["JokerDisplay"] or {}).can_load then
  local jokerdisplays = NFS.getDirectoryItems(mod_dir.."jokerdisplay")

  for _, file in ipairs(jokerdisplays) do
    sendDebugMessage ("The file is: "..file)
    local helper, load_error = SMODS.load_file("jokerdisplay/"..file)
    if load_error then
      sendDebugMessage ("The error is: "..load_error)
    else
      helper()
    end
  end
end

--Load files
local function load_files()
  local files = {
    "atlases",
    "backs",
    "challenges",
    "consumables",
    "functions",
    "pokemon",
    "settings",
    "sleeves",
    "stakes",
    "stickers"
  }
  for i = 1, #files do 
    assert(SMODS.load_file("src/"..files[i]..".lua"))()
  end
end
load_files()