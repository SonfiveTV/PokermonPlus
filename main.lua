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
  key = "sleeves",
  px = 73,
  py = 95,
  path = "sleeves.png"
}):register()


pokermon.add_family({"nincada", "ninjask", "shedinja"})
pokermon.add_family({"vullaby", "mandibuzz"})
pokermon.add_family({"meltan", "melmetal"})
pokermon.add_family({"lechonk", "oinkologne"})
pokermon.add_family({"nacli", "naclstack", "garganacl"})
pokermon.add_family({"cetoddle", "cetitan"})

sonfive_config = SMODS.current_mod.config
mod_dir = ''..SMODS.current_mod.path
if (SMODS.Mods["Pokermon"] or {}).can_load then
    pokermon_config = SMODS.Mods["Pokermon"].config
end

SMODS.current_mod.config_tab = function() 
    local evo_lines = {
        "nincada", 
        "darkrai", 
        "vullaby", 
        "meltan", 
        "stonjourner", 
        "lechonk", 
        "nacli", 
        "cetoddle"
    }

    local nodes = {}

    for i = 1, #evo_lines do
        table.insert(nodes, create_toggle({
            label = localize(evo_lines[i].."_line"),
            ref_table = sonfive_config,
            ref_value = evo_lines[i]:gsub("^%l", string.upper),
        }))
    end

    -- Add the custom consumables toggle
    table.insert(nodes, create_toggle({
        label = localize("custom_consumeables"),
        ref_table = sonfive_config,
        ref_value = "customItems",
    }))

    return {
        n = G.UIT.ROOT,
        config = {
            align = "cm",
            padding = 0.05,
            colour = G.C.CLEAR,
        },
        nodes = nodes,
    }
end

--Load Joker Display if the mod is enabled
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

if (SMODS.Mods["Pokermon"] or {}).can_load and SMODS.Mods["Pokermon"] and sonfive_config.customItems then
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
if (SMODS.Mods["Pokermon"] or {}).can_load and SMODS.Mods["Pokermon"] and sonfive_config.customJokers then
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

--Load challenges file
local pchallenges = NFS.getDirectoryItems(mod_dir.."challenges")

for _, file in ipairs(pchallenges) do
  local challenge, load_error = SMODS.load_file("challenges/"..file)
  if load_error then
    sendDebugMessage ("The error is: "..load_error)
  else
    local curr_challenge = challenge()
    if curr_challenge.init then curr_challenge:init() end
    
    for i, item in ipairs(curr_challenge.list) do
      item.button_colour = HEX('87DEFF')
      SMODS.Challenge(item)
    end
  end
end 

--Load Debuff logic
local sprite, load_error = SMODS.load_file("functions/functions.lua")
if load_error then
  sendDebugMessage ("The error is: "..load_error)
else
  sprite()
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


-- SMODS.Spectral:take_ownership('poke_nightmare', -- object key (class prefix not required)
--     { -- table of properties to change from the existing object
-- 	soul_rate = 1,
--   allow_duplicates = true,
--     in_pool = function(self)
--         return true
--     end, 
-- 		-- more on this later

--     },
--     true -- silent | suppresses mod badge
-- )
