sonfive_config = SMODS.current_mod.config
mod_dir = ''..SMODS.current_mod.path
if (SMODS.Mods["Pokermon"] or {}).can_load then
    pokermon_config = SMODS.Mods["Pokermon"].config
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
  }
  for i = 1, #files do 
    assert(SMODS.load_file("src/"..files[i]..".lua"))()
  end
end
load_files()