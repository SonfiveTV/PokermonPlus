local heatran = {
  name = "heatran",
  config = {extra = {}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
		return {vars = {}}
  end,
  designer = "Sonfive",
  rarity = 4,
  cost = 20,
  stage = "Legendary",
  ptype = "Fire",
  gen = 4,
  calculate = function(self, card, context)
    local target = context.other_card
    local enhancement_effects = {
      [G.P_CENTERS.m_bonus] = function(card) card.ability.perma_bonus = (card.ability.perma_bonus or 0) + 30 end,
      [G.P_CENTERS.m_mult] = function(card) card.ability.perma_mult = (card.ability.perma_mult or 0) + 4 end,
      [G.P_CENTERS.m_stone] = function(card) card.ability.perma_bonus = (card.ability.perma_bonus or 0) + 50 end,
      [G.P_CENTERS.m_steel] = function(card) card.ability.perma_h_x_mult = (card.ability.perma_h_x_mult or 1) + 0.5 end,
      [G.P_CENTERS.m_gold] = function(card) card.ability.perma_h_dollars = (card.ability.perma_h_dollars or 0) + 3 end,
      [G.P_CENTERS.m_glass] = function(card) card.ability.perma_x_mult = (card.ability.perma_x_mult or 1) + 1 end,
      [G.P_CENTERS.m_poke_flower] = function(card) card.ability.perma_x_mult = (card.ability.perma_x_mult or 1) + 2 end,
      [G.P_CENTERS.m_lucky] = function(card) if pseudorandom('heatran_lucky_mult') < (1/5) then card.ability.perma_mult = (card.ability.perma_mult or 0) + 20 end ; if pseudorandom('heatran_lucky_dollars') < (1/15) then card.ability.perma_p_dollars = (card.ability.perma_p_dollars or 0) + 20 end end
    }
    local edition_effects = {
      e_foil = function(card) card.ability.perma_bonus = (card.ability.perma_bonus or 0) + 50 end,
      e_holo = function(card) card.ability.perma_mult = (card.ability.perma_mult or 0) + 10 end,
      e_polychrome = function(card) card.ability.perma_x_mult = (card.ability.perma_x_mult or 1) + 0.5 end
    }
    local seal_effects = {
      -- Purple = function(card) card.ability.perma_purple_seal = 1 end,
      Red = function(card) card.ability.perma_repetitions = (card.ability.perma_repetitions or 0) + 1 end,
      Gold = function(card) card.ability.perma_p_dollars = (card.ability.perma_p_dollars or 0) + 3 end
    }
    
    if context.individual and context.cardarea == G.play and context.scoring_hand then
      if target.config.center ~= G.P_CENTERS.c_base then
        local effect = enhancement_effects[target.config.center]
        if effect then
          effect(target)
          target:set_ability(G.P_CENTERS.c_base, nil, true)
        end
      end

      if target.edition then
        local effect = edition_effects[target.edition.key]
        if effect then
          effect(target)
          target:set_edition()
        end
      end

      if target.seal then
        local effect = seal_effects[target.seal]
        if effect then
          effect(target)
          target:set_seal()
        end
      end
    end
  end,
}

local list = {heatran}

return {name = "Heatran",
list = list
}