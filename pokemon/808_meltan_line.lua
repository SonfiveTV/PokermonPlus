local meltan = { 
  name = "meltan", 
  poke_custom_prefix = "sonfive", -- This is your mod prefix
  pos = {x = 4, y = 9}, -- This is the sprite position on the atlas, where (0, 0) is the top left sprite 
  soul_pos = {x = 5, y = 9}, -- This is the sprite position for the floating sprite, for Legendary Jokers
  config = {extra = {chips = 0, count = 0, odds = 1, evo_rqmt = 1}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card) 
    info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"Sonfive"}}
		return {vars = {card.ability.extra.count, card.ability.extra.evo_rqmt, card.ability.extra.odds*100}} -- Here you can reference values in the Joker description
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
    abbr.count = (abbr.energy_count or 0) + (abbr.c_energy_count or 0) + (abbr.negative_energy_count or 0) + (abbr.negative_c_energy_count or 0)
    if context.setting_blind then
      if pseudorandom('meltan') <= abbr.odds then
        if not from_debuff then
            local _card = create_card('Item', G.consumeables, nil, nil, nil, nil, 'c_poke_metalcoat')
            local edition = {negative = true}
            _card:set_edition(edition, true)
            _card:add_to_deck()
            G.consumeables:emplace(_card)
            card_eval_status_text(_card, 'extra', nil, nil, nil, {message = localize('poke_plus_pokeitem'), colour = G.C.FILTER})
        end
    end
  end
    return scaling_evo(self, card, context, "j_sonfive_melmetal", card.ability.extra.count, card.ability.extra.evo_rqmt)
  end,
}

local melmetal = {
  name = "melmetal",
  pos = {x = 6, y = 9},
  soul_pos = {x = 7, y = 9},
  config = {extra = {Xmult_multi = 0.05}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"Sonfive"}}
		return {vars = {card.ability.extra.Xmult_multi, (#find_joker('metalcoat')*card.ability.extra.Xmult_multi), #find_joker('metalcoat')}}
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
    if context.individual and context.cardarea == G.hand and not context.other_card.debuff and not context.end_of_round and SMODS.has_enhancement(context.other_card, 'm_steel') then
      context.other_card.ability.perma_h_x_mult = context.other_card.ability.perma_h_x_mult or 0
      context.other_card.ability.perma_h_x_mult = context.other_card.ability.perma_h_x_mult + (card.ability.extra.Xmult_multi * #find_joker('metalcoat'))
      return {
          extra = {message = localize('k_upgrade_ex'), colour = G.C.MULT},
          colour = G.C.MULT,
          card = card
      }
    end
    -- if context.selling_self and not context.blueprint and #find_joker('metal_energy') >= 10*(2^((#find_joker('melmetal') + #find_joker('meltan')) - 1)) then
    --           G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
    --           local temp_card = {set = "Joker", area = G.jokers, key = "j_sonfive_meltan", no_edition = true}
    --           local new_card = SMODS.create_card(temp_card)
    --           new_card:add_to_deck()
    --           G.jokers:emplace(new_card)
    --           return true end }))
    --         if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
    --         G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
    --           local temp_card = {set = "Joker", area = G.jokers, key = "j_sonfive_meltan", no_edition = true}
    --           local new_card = SMODS.create_card(temp_card)
    --           new_card:add_to_deck()
    --           G.jokers:emplace(new_card)
    --           return true end }))
    --       end
    --       delay(0.6)

    --       card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('poke_darts_ex'), colour = G.C.MULT})
    --     end
  end,
}




if sonfive_config.Meltan then
  list = {meltan, melmetal}
else list = {}
end

return {name = "Meltan", 
list = list
}