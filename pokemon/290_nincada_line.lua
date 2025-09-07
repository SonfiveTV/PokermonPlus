local nincada = {
  name = "nincada",
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
    if not context.individual and context.end_of_round and card.ability.extra.speedboost < 7 and not context.repetition and G.GAME.last_blind and G.GAME.last_blind.boss then
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
  config = {extra = {money = 0, money_mod = 2, earned = 0, threshold = 292, targets = {{value = "Ace", id = "14"}, {value = "King", id = "13"}, {value = "Queen", id = "12"}}}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    
        local abbr = card.ability.extra
    info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"Sonfive"}}
    local card_vars = {abbr.money_mod, abbr.earned, abbr.threshold}
    add_target_cards_to_vars(card_vars, abbr.targets)
    return {vars = card_vars}
  end,
  rarity = "poke_safari",
  cost = 5,
  stage = "Basic",
  ptype = "Psychic",
  blueprint_compat = false,
  calc_dollar_bonus = function(self, card)
    card.ability.extra.earned = card.ability.extra.earned + card.ability.extra.money
    return ease_poke_dollars(card, "shedinja", (card.ability.extra.money), true)
    
	end,
  custom_pool_func = true,
  aux_poke = true,
  in_pool = function(self)
    return false
  end,
  calculate = function(self, card, context)
    if context.end_of_round and not context.blueprint then 
        card.ability.extra.targets = get_poke_target_card_ranks("shedinja", 3, card.ability.extra.targets, true)
    --     local turn_neg = nil
    --     turn_neg = card.ability.extra.earned >= card.ability.extra.threshold
    --     if turn_neg then
    --   local edition = {negative = true}
    --   card:set_edition(edition, true)
    -- end
    end 
    local unique_ranks = {}
    if context.cardarea == G.jokers and context.scoring_hand and not context.blueprint then
        if G.hand and G.hand.cards and #G.hand.cards > 0 then
          for i=1, #G.hand.cards do
              local contains = false
              if unique_ranks ~= {} then
                for j = 1, #unique_ranks do
                  if G.hand.cards[i]:get_id() == unique_ranks[j] then contains = true end
                end
              end
              if not contains then
                unique_ranks[#unique_ranks+1] = G.hand.cards[i]:get_id()
              end
            end
          end
          card.ability.extra.money = (card.ability.extra.money_mod * #unique_ranks)
    
    end
    if context.individual and not context.end_of_round and context.cardarea == G.hand and not context.other_card.debuff and not context.blueprint then
      for i=1, #card.ability.extra.targets do
        if context.other_card:get_id() == card.ability.extra.targets[i].id then
            remove(self, card, {})
            if G.GAME.modifiers.sonfive_wonderguard then
              G.STATE = G.STATES.GAME_OVER
            end
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


