local meltan = { 
  name = "meltan", 
  config = {extra = {retriggers = 1, count = 0, evo_rqmt = 100}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card) 
		return {vars = {card.ability.extra.count, card.ability.extra.evo_rqmt, card.ability.extra.retriggers}} -- Here you can reference values in the Joker description
  end,
  designer = "Sonfive",
  rarity = 4, -- 1 is Common, 2 is Uncommon, 3 is Rare, 4 is Legendary. Use "poke_safari" for Safari 
  cost = 20, -- This is the purchase cost, half is the sell cost
  stage = "Legendary", -- "Baby", "Basic", "One", "Two", "Legendary", "Mega"
  ptype = "Metal", -- Pokemon's type
  gen = 7,
  blueprint_compat = true, -- This decides whether Blueprint shows as compatible or not
  
  calculate = function(self, card, context)
    local abbr = card.ability.extra
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
  config = {extra = {}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
		return {vars = {1 + math.floor(#SMODS.find_card('c_poke_metal_energy') + #find_pokemon_type("Metal")/2)}}
  end,
  designer = "Sonfive",
  rarity = 4,
  cost = 20,
  stage = "Legendary",
  ptype = "Metal",
  gen = 7,
  blueprint_compat = true,
  custom_pool_func = true,
  in_pool = function(self)
    return false
  end,
  
  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.hand and (next(context.card_effects[1]) or #context.card_effects > 1) and SMODS.has_enhancement(context.other_card, 'm_steel') then
      local retriggers = 1 + math.floor(#SMODS.find_card('c_poke_metal_energy') + #find_pokemon_type("Metal")/2)
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

local list = {meltan, melmetal}

return {name = "Meltan", 
list = list

}
