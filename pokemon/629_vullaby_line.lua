local vullaby ={
  name = "vullaby", 
  config = {extra = {chips = 0, chip_mod = 4, flush = 0.1, evo_rqmt = 1}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {vars = {center.ability.extra.chips, center.ability.extra.chip_mod}}
  end,
  designer = "Sonfive",
  rarity = 2, 
  cost = 7, 
  stage = "Basic", 
  ptype = "Dark",
  gen = 5,
  blueprint_compat = false,
  calculate = function(self, card, context)
    local abbr = card.ability.extra
    if context.first_hand_drawn then
      local eval = function() return G.GAME.current_round.hands_played == 0 end
      juice_card_until(card, eval, true)
    end
    if context.individual and context.cardarea == G.play and context.scoring_hand and G.GAME.current_round.hands_played == 0 then
      for i = 1, #context.scoring_hand do
        SMODS.debuff_card(context.scoring_hand[i], true, card.config.center.key)
        abbr.chips = abbr.chips + abbr.chip_mod
      end
        elseif context.joker_main then
          if #context.scoring_hand == 5 then
            local count = 0
            for i = 1, #context.scoring_hand do 
              if context.scoring_hand[i].debuff then 
                count = count + 1
                if count == 5 then 
                  card.ability.extra.flush = 1
                end
              end            
          end
        end
        return {
          message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}, 
          colour = G.C.CHIPS,
          chip_mod = card.ability.extra.chips
        }
      end
    return scaling_evo(self, card, context, "j_sonfive_mandibuzz", card.ability.extra.flush, card.ability.extra.evo_rqmt)
  end
}

local mandibuzz ={
  name = "mandibuzz", 
  config = {extra = {chips = 0, chip_mod = 8, money = 1, debuff_tally = 0}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    local count = 0
    for k, v in pairs(G.playing_cards or {}) do
      if v.debuff then count = count + 1 end
    end

    local money = center.ability.extra.money or 0
    local payout = math.floor(count / 4) * money
    return {vars = {center.ability.extra.chips, center.ability.extra.chip_mod, center.ability.extra.money, payout}}
  end,
  designer = "Sonfive",
  rarity = 3, 
  cost = 7, 
  stage = "One", 
  ptype = "Dark",
  gen = 5,
  blueprint_compat = false,
  calc_dollar_bonus = function(self, card)
    local count = 0
    for k, v in pairs(G.playing_cards or {}) do
      if v.debuff then count = count + 1 end
    end

    local money = card.ability.extra.money or 0
    local payout = math.floor(count / 4) * money

    return ease_poke_dollars(card, "mandibuzz", payout, true)
  end,
  calculate = function(self, card, context)
  local abbr = card.ability.extra

  -- Only react at joker_main (when scoring is resolved)
  if context.joker_main and context.scoring_hand then
    local count = 0
    for i = 1, #context.scoring_hand do
      if context.scoring_hand[i].debuff then
        count = count + 1
      end
    end

    if count > 0 then
      abbr.chips = abbr.chips + (abbr.chip_mod * count)
    end
      return {
        message = localize{type = 'variable', key = 'a_chips', vars = {abbr.chips}}, 
        colour = G.C.CHIPS,
        chip_mod = abbr.chips
      }
  end
end
}


if sonfive_config.Vullaby then
  list = {vullaby, mandibuzz}
else list = {}
end

return {name = "Vullaby", 
list = list
}