local meltan = { 
  name = "meltan", 
  poke_custom_prefix = "sonfive", -- This is your mod prefix
  pos = {x = 4, y = 9}, -- This is the sprite position on the atlas, where (0, 0) is the top left sprite 
  soul_pos = {x = 5, y = 9}, -- This is the sprite position for the floating sprite, for Legendary Jokers
  config = {extra = {chips = 0, retriggers = 1, count = 0, evo_rqmt = 100}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card) 
    info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"Sonfive"}}
		return {vars = {card.ability.extra.count, card.ability.extra.evo_rqmt, card.ability.extra.retriggers}} -- Here you can reference values in the Joker description
  end,
  rarity = 4, -- 1 is Common, 2 is Uncommon, 3 is Rare, 4 is Legendary. Use "poke_safari" for Safari 
  cost = 20, -- This is the purchase cost, half is the sell cost
  stage = "Legendary", -- "Baby", "Basic", "One", "Two", "Legendary", "Mega"
  ptype = "Metal", -- Pokemon's type
  atlas = "Pokedex7", -- This is the spritesheet that the pokemons sprite is located on
  blueprint_compat = true, -- This decides whether Blueprint shows as compatible or not
  
  calculate = function(self, card, context)
    local abbr = card.ability.extra
    abbr.odds = (1 / (#find_joker('metalcoat') + 1))
    if context.individual and not context.end_of_round and context.cardarea == G.hand then
      if SMODS.has_enhancement(context.other_card, 'm_steel') then 
        abbr.count = abbr.count + 1
      end
    end
    if context.repetition and context.cardarea == G.hand and (next(context.card_effects[1]) or #context.card_effects > 1) and SMODS.has_enhancement(context.other_card, 'm_steel') then
        return {
          message = localize('k_again_ex'),
          repetitions = abbr.retriggers,
          card = card
        }
    end
    return scaling_evo(self, card, context, "j_sonfive_melmetal", card.ability.extra.count, card.ability.extra.evo_rqmt)
  end,
  add_to_deck = function(self, card, from_debuff)
    if not from_debuff then
      local _card = create_card('Item', G.consumeables, nil, nil, nil, nil, 'c_poke_metalcoat')
      local edition = {negative = true}
      _card:set_edition(edition, true)
      _card:add_to_deck()
      G.consumeables:emplace(_card)
      card_eval_status_text(_card, 'extra', nil, nil, nil, {message = localize('poke_plus_pokeitem'), colour = G.C.FILTER})
    end
  end
}

local melmetal = {
  name = "melmetal",
  pos = {x = 6, y = 9},
  soul_pos = {x = 7, y = 9},
  config = {extra = {}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"Sonfive"}}
		return {vars = {#find_joker('metal_energy') + #find_pokemon_type("Metal")}}
  end,
  rarity = 4,
  cost = 20,
  stage = "Legendary",
  ptype = "Metal",
  atlas = "Pokedex7",
  blueprint_compat = true,
  custom_pool_func = true,
  aux_poke = true,
  in_pool = function(self)
    return false
  end,
  
  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.hand and (next(context.card_effects[1]) or #context.card_effects > 1) and SMODS.has_enhancement(context.other_card, 'm_steel') then
      local retriggers = #find_joker('metal_energy') + #find_pokemon_type("Metal")
      if retriggers > 0 then
        return {
          message = localize('k_again_ex'),
          repetitions = retriggers,
          card = card
        }
      end
    end
  end,
}

if sonfive_config.Meltan then
  list = {meltan, melmetal}
else list = {}
end

return {name = "Meltan", 
list = list
}