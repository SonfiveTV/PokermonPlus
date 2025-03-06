SMODS.Atlas({
    key = "modicon",
    path = "icon.png",
    px = 32,
    py = 32
}):register()

SMODS.Atlas({
    key = "backs",
    px = 71,
    py = 95,
    path = "backs.png"
}):register()

SMODS.Atlas({
    key = "consumables",
    path = "consumables.png",
    px = 71,
    py = 95
}):register()

SMODS.Atlas({
  key = "pokedex_2",
  path = "pokedex_2.png",
  px = 71,
  py = 95
}):register()

SMODS.Atlas({
  key = "shiny_pokedex_2",
  path = "shiny_pokedex_2.png",
  px = 71,
  py = 95
}):register()

SMODS.Atlas({
  key = "sleeves",
  px = 73,
  py = 95,
  path = "sleeves.png"
}):register()

sonfive_config = SMODS.current_mod.config
mod_dir = ''..SMODS.current_mod.path
if (SMODS.Mods["Pokermon"] or {}).can_load then
    pokermon_config = SMODS.Mods["Pokermon"].config
end


if (SMODS.Mods["Pokermon"] or {}).can_load and SMODS.Mods["Pokermon"] and not pokermon_config.jokers_only then
    --Load backs
    local backs = NFS.getDirectoryItems(mod_dir.."backs")
  
    for _, file in ipairs(backs) do
      sendDebugMessage ("The file is: "..file)
      local back, load_error = SMODS.load_file("backs/"..file)
      if load_error then
        sendDebugMessage ("The error is: "..load_error)
      else
        local curr_back = back()
        if curr_back.init then curr_back:init() end
        
        for i, item in ipairs(curr_back.list) do
          SMODS.Back(item)
        end
      end
    end
  end

local pconsumables = NFS.getDirectoryItems(mod_dir.."consumables")

if (SMODS.Mods["Pokermon"] or {}).can_load and SMODS.Mods["Pokermon"] then
  for _, file in ipairs(pconsumables) do
    sendDebugMessage ("The file is: "..file)
    local consumable, load_error = SMODS.load_file("consumables/"..file)
    if load_error then
      sendDebugMessage ("The error is: "..load_error)
    else
      local curr_consumable = consumable()
      if curr_consumable.init then curr_consumable:init() end
      
      for i, item in ipairs(curr_consumable.list) do
        if ((not pokermon_config.jokers_only and not item.pokeball) or (item.pokeball and pokermon_config.pokeballs)) or (item.evo_item and not pokermon_config.no_evos) then
          SMODS.Consumable(item)
        end
      end
    end
  end 
end



-- Get mod path and load other files
mod_dir = ''..SMODS.current_mod.path
if (SMODS.Mods["Pokermon"] or {}).can_load then
    pokermon_config = SMODS.Mods["Pokermon"].config
end

print("DEBUG")

--Load pokemon file
local pfiles = NFS.getDirectoryItems(mod_dir.."pokemon")
if (SMODS.Mods["Pokermon"] or {}).can_load and SMODS.Mods["Pokermon"] then
  for _, file in ipairs(pfiles) do
    sendDebugMessage ("The file is: "..file)
    local pokemon, load_error = SMODS.load_file("pokemon/"..file)
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
              item.in_pool = function(self)
                return pokemon_in_pool(self)
              end
            end
            if not item.config then
              item.config = {}
            end
            if item.ptype then
              if item.config and item.config.extra then
                item.config.extra.ptype = item.ptype
              elseif item.config then
                item.config.extra = {ptype = item.ptype}
              end
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
            SMODS.Joker(item)
          end
        end
      end
    end
  end
end 

if (SMODS.Mods["Pokermon"] or {}).can_load and SMODS.Mods["Pokermon"] and not pokermon_config.jokers_only then
  if (SMODS.Mods["CardSleeves"] or {}).can_load then
    --Load Sleeves
    local sleeves = NFS.getDirectoryItems(mod_dir.."sleeves")

    for _, file in ipairs(sleeves) do
      sendDebugMessage ("the file is: "..file)
      local sleeve, load_error = SMODS.load_file("sleeves/"..file)
      if load_error then
        sendDebugMessage("The error is: "..load_error)
      else
        local curr_sleeve = sleeve()
        if curr_sleeve.init then curr_sleeve.init() end
        
        for i,item in ipairs (curr_sleeve.list) do
          CardSleeves.Sleeve(item)
        end
      end
    end
  end
end