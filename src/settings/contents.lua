-- Automatically derive naming and prefix from current mod
local PREFIX = "j_" .. SMODS.current_mod.prefix .. "_"
local TITLE_PREFIX = SMODS.current_mod.prefix .. "_regular_pokemon"
local TILES_PER_PAGE = 6  -- adjust number of tiles per page

-- Helpers
local function label(key)
  return function()
    return localize {
      type = "name_text",
      set = "Joker",
      key = PREFIX .. key
    }
  end
end

local function title()
  return function()
    return "Toggle Pokemon lines"
  end
end

-- Define all tiles (key inferred from first element in list)
local all_tiles = {
  { list = { "nincada", "ninjask", "shedinja" } },
  { list = { "croagunk", "toxicroak" } },
  { list = { "darkrai" } },
  { list = { "vullaby", "mandibuzz" } },
  { list = { "meltan", "melmetal" } },
  { list = { "lechonk", "oinkologne" } },
  { list = { "nacli", "naclstack", "garganacl" } },
  { list = { "cetoddle", "cetitan" } },
}

-- Build one tile entry
local function build_tile(tile_data)
  local key = tile_data.list[1]
  local list_with_prefix = {}

  for _, name in ipairs(tile_data.list) do
    table.insert(list_with_prefix, PREFIX .. name)
  end

  return {
    list = list_with_prefix,
    label = label(key),
    config_key = key,
  }
end

-- Automatically split tiles into pages
local pages = {}
local total_tiles = #all_tiles
local page_count = math.ceil(total_tiles / TILES_PER_PAGE)

for i = 1, page_count do
  local start_idx = (i - 1) * TILES_PER_PAGE + 1
  local end_idx = math.min(i * TILES_PER_PAGE, total_tiles)
  local tiles = {}

  for j = start_idx, end_idx do
    table.insert(tiles, build_tile(all_tiles[j]))
  end

  table.insert(pages, {
    title = title(),
    tiles = tiles,
  })
end

-- Return final structure
return { pages = pages }
