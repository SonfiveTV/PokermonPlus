local jd_def = JokerDisplay.Definitions

local subdir = "src/jokerdisplay/"
local files = NFS.getDirectoryItems(SMODS.current_mod.path .. subdir)

for _, file in ipairs(files) do
  local defs = assert(SMODS.load_file(subdir .. file))()

  if defs.dict then
    for key, item in pairs(defs.dict) do
      jd_def[key] = item
    end
  end
end