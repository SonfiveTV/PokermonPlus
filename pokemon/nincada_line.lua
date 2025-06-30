local nincada = {
  name = "nincada",
  pos = {x = 8, y = 3},
  config = {extra = {chips = 45, mult = 3, rounds = 5}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"Sonfive"}}
		return {vars = {card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.rounds}}
  end,
  rarity = 1,
  cost = 5,
  stage = "Basic",
  ptype = "Grass",
  atlas = "Pokedex3",
  blueprint_compat = true,
  eternal_compat = false,
  
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
              if context.joker_main then
        local chips = card.ability.extra.chips
        if pseudorandom('nincada') <= 0.5 then
            return {
            message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}, 
            colour = G.C.CHIPS,
            chip_mod = card.ability.extra.chips
            }
        else
            return {
            message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
            colour = G.C.MULT,
            mult_mod = card.ability.extra.mult
            }
        end
      end
    end
    local evo = level_evo(self, card, context, "j_sonfive_ninjask")
    if evo and type(evo) == "table" and G.jokers and #G.jokers.cards < G.jokers.config.card_limit and not context.blueprint then
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            local temp_card = {set = "Joker", area = G.jokers, key = "j_sonfive_shedinja", no_edition = true}
            local new_card = SMODS.create_card(temp_card)
            new_card:add_to_deck()
            G.jokers:emplace(new_card)
            return true end }))
    end
    return evo
  end,
}

local ninjask = {
  name = "ninjask",
  pos = {x = 9, y = 3},
  config = {extra = {chips = 90, mult = 5, speedboost = 1}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"Sonfive"}}
		return {vars = {card.ability.extra.chips, card.ability.extra.mult, (7 - card.ability.extra.speedboost)}}
  end,
  rarity = 2,
  cost = 5,
  stage = "One",
  ptype = "Grass",
  atlas = "Pokedex3",
  blueprint_compat = true,
  
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
        if context.joker_main then
            return {
            chips = card.ability.extra.chips,
            mult = card.ability.extra.mult,
        }
      end
    end
    if context.end_of_round and card.ability.extra.speedboost < 7 then
        energy_shift(card, 1, card.ability.extra.ptype, false, true)
        card.ability.extra.speedboost = card.ability.extra.speedboost + 1
        return{
            message = localize('sonfive_speedboost'), colour = HEX('A8F2FF')
          }
    end

  end,
}

local shedinja = {
  name = "shedinja",
  pos = {x = 0, y = 4},
  config = {extra = {money = 10, targets = {{value = "Ace", id = "14"}, {value = "King", id = "13"}, {value = "Queen", id = "12"}}}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    
        local abbr = card.ability.extra
    info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"Sonfive"}}
    local card_vars = {abbr.money}
    add_target_cards_to_vars(card_vars, abbr.targets)
    return {vars = card_vars}
  end,
  rarity = "poke_safari",
  cost = 5,
  stage = "Basic",
  ptype = "Psychic",
  atlas = "Pokedex3",
  blueprint_compat = true,
  custom_pool_func = true,
  aux_poke = true,
  in_pool = function(self)
    return false
  end,
  calc_dollar_bonus = function(self, card)
    return ease_poke_dollars(card, "pikachu", math.min(10, #G.jokers.cards * card.ability.extra.money), true) 
  end,
  calculate = function(self, card, context)
    if context.end_of_round and not context.blueprint then 
        card.ability.extra.targets = get_poke_target_card_ranks("shedinja", 3, card.ability.extra.targets, true)
    end
    if context.individual and not context.end_of_round and context.cardarea == G.hand and not context.other_card.debuff then
      for i=1, #card.ability.extra.targets do
        if context.other_card:get_id() == card.ability.extra.targets[i].id then
            remove(self, card, {})
        end
      end
    end
  end,
  set_ability = function(self, card, initial, delay_sprites)
    if initial then
      card.ability.extra.targets = get_poke_target_card_ranks("shedinja", 3, card.ability.extra.targets, true)
    end
  end
}

if sonfive_config.Nincada then
  list = {nincada, ninjask, shedinja}
else list = {}
end

return {name = "Nincada", 
list = list
}


