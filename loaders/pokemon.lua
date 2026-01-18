local subdir = "src/pokemon/"

sonfive_evo_lines = sonfive_evo_lines or {}

local function load_pokemon_folder(folder)
  local pfiles = NFS.getDirectoryItems(mod_dir..folder)
  if (SMODS.Mods["Pokermon"] or {}).can_load and SMODS.Mods["Pokermon"] then
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

              if not item.sonfive_config_key then
                item.sonfive_config_key = family[1] or item.name
              end

              item.config = item.config or {} 
              item.config.extra = item.config.extra or {} 

              

              

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
              if item.atlas and string.find(item.atlas, "sonfive") then
                pokermon.Pokemon(item,"sonfive",true)
              else
                  poke_load_atlas(item)
                  poke_load_sprites(item)
                pokermon.Pokemon(item,"sonfive",false)
              end
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
