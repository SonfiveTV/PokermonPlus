pokermon.add_family({"nincada", "ninjask", "shedinja"})
pokermon.add_family({"vullaby", "mandibuzz"})
pokermon.add_family({"meltan", "melmetal"})
pokermon.add_family({"lechonk", "oinkologne"})
pokermon.add_family({"nacli", "naclstack", "garganacl"})
pokermon.add_family({"cetoddle", "cetitan"})

local subdir = "src/pokemon/"

local function load_pokemon_folder(folder)
  local pfiles = NFS.getDirectoryItems(mod_dir..folder)
  if (SMODS.Mods["Pokermon"] or {}).can_load and SMODS.Mods["Pokermon"] and sonfive_config.customJokers then
    for _, file in ipairs(pfiles) do
      sendDebugMessage ("The file is: "..file)
      local pokemon, load_error = SMODS.load_file(folder..file)
      if load_error then
        sendDebugMessage ("The error is: "..load_error)
      else
        local curr_pokemon = pokemon()
        if curr_pokemon.init then curr_pokemon:init() end
        
        if curr_pokemon.list and #curr_pokemon.list > 0 then
          for i, item in ipairs(curr_pokemon.list) do
            if (pokermon_config.jokers_only and not item.joblacklist) or not pokermon_config.jokers_only  then
              item.discovered = true
              if not item.key then
                item.key = item.name
              end
              if not pokermon_config.no_evos and not item.custom_pool_func then
                item.custom_pool_func = true
                item.in_pool = function(self)
                  local basic_name = curr_pokemon.list[1]
                  if sonfive_config[basic_name] then
                    return pokemon_in_pool(self)
                  else
                    return false
                  end
                end
              end
              if not item.config then
                item.config = {}
              end
              if not item.pos then
                local sprite = PokemonSprites[item.name]
                
                if sprite and sprite.base then
                    item.pos = sprite.base.pos
                end
                if sprite.base.soul_pos then 
                  item.soul_pos = sprite.base.soul_pos
                end
              end
              if not item.atlas then
                local sprite = PokemonSprites[item.name]
                local gen_string = nil
                local atlas_prefix = nil
                if not item.custom_art then
                  atlas_prefix = "AtlasJokersBasic"
                else 
                  atlas_prefix = "AtlasJokersSeriesA"
                end
                if sprite.gen_atlas and item.gen then
                  if item.gen < 10 then
                    gen_string = 'Gen0'..item.gen 
                  else
                    gen_string = 'Gen'..item.gen
                  end
                  item.atlas = atlas_prefix..gen_string
                else
                  item.atlas = atlas_prefix.."Natdex"
                end              
              end
              if item.ptype then
                if item.config and item.config.extra then
                  item.config.extra.ptype = item.ptype
                elseif item.config then
                  item.config.extra = {ptype = item.ptype}
                end
              end
              if not item.set_badges then
                item.set_badges = poke_set_type_badge
              end
              if item.item_req then
                if item.config and item.config.extra then
                  item.config.extra.item_req = item.item_req
                elseif item.config then
                  item.config.extra = {item_req = item.item_req}
                end
              end
              if item.evo_list then
                if item.config and item.config.extra then
                  item.config.extra.evo_list = item.evo_list
                elseif item.config then
                  item.config.extra = {item_req = item.evo_list}
                end
              end
              if pokermon_config.jokers_only and item.rarity == "poke_safari" then
                item.rarity = 3
              end
              item.discovered = not pokermon_config.pokemon_discovery 
              pokermon.Pokemon(item, "sonfive", nil)
            end
          end
        end
      end
    end
  end 
end

load_pokemon_folder(subdir)