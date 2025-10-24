local subdir = "src/pokemon/"

sonfive_evo_lines = sonfive_evo_lines or {}

local function load_pokemon_folder(folder)
  local pfiles = NFS.getDirectoryItems(mod_dir..folder)
  if (SMODS.Mods["Pokermon"] or {}).can_load and SMODS.Mods["Pokermon"] and sonfive_config.customJokers then
    for _, file in ipairs(pfiles) do
      sendDebugMessage("The file is: " .. file)
      local pokemon, load_error = SMODS.load_file(folder .. file)
      if load_error then
        sendDebugMessage("The error is: " .. load_error)
      else
        local curr_pokemon = pokemon()
        if curr_pokemon.init then curr_pokemon:init() end

        local family = {}

        if curr_pokemon.list and #curr_pokemon.list > 0 then
          for _, item in ipairs(curr_pokemon.list) do
            family[#family + 1] = item.name

            if (pokermon_config.jokers_only and not item.joblacklist) or not pokermon_config.jokers_only then
              item.discovered = true
              if not item.key then item.key = item.name end

              if not pokermon_config.no_evos and not item.custom_pool_func then
                item.custom_pool_func = true
                item.in_pool = function(self)
                  local base_evo_name = sonfive_base_evo_name(self)
                  if (sonfive_config[base_evo_name]) then
                    return pokemon_in_pool(self)
                  end
                  return false
                end
              end

              item.config = item.config or {} 
              item.config.extra = item.config.extra or {} 

              local sprite = PokemonSprites[item.name]
              if sprite and sprite.base then
                  item.pos = item.pos or sprite.base.pos
                  item.soul_pos = item.soul_pos or sprite.base.soul_pos
              end

              local sprite = PokemonSprites[item.name]
              local atlas_prefix = item.custom_art and "AtlasJokersSeriesA" or "AtlasJokersBasic"
              local gen_string = (sprite.gen_atlas and item.gen and item.gen < 10 and 'Gen0'..item.gen)
                or (sprite.gen_atlas and item.gen and 'Gen'..item.gen)
              item.atlas = item.atlas or ((sprite.gen_atlas and item.gen) and atlas_prefix .. gen_string)
                or atlas_prefix .. "Natdex"

              if item.ptype then
                item.config.extra.ptype = item.ptype
              end
              if not item.set_badges then item.set_badges = poke_set_type_badge end

              if item.item_req then
                item.config.extra.item_req = item.item_req
              end
              if item.evo_list then
                item.config.extra.evo_list = item.evo_list
              end
              if pokermon_config.jokers_only and item.rarity == "poke_safari" then
                item.rarity = 3
              end

              item.discovered = not pokermon_config.pokemon_discovery
              pokermon.Pokemon(item, "sonfive", nil)
            end
            local function sonfive_create_config(sonfive_evo_lines, item_name)
              for _, v in ipairs(sonfive_evo_lines) do
                if v == sonfive_base_evo_name(tostring(item)) then
                  return  -- value already exists
                end
              end
              table.insert(sonfive_evo_lines, item_name)  -- value not found, insert it
            end
          end

          if #family > 1 then
            pokermon.add_family(family)
          end
        end
      end
    end
  end
end

load_pokemon_folder(subdir)
