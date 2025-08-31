local stonjourner = {
  name = "stonjourner",
  pos = {x = 11, y = 4},
  config = {extra = {
    Xmult_multi = 1.2,
    Xmult_mod = 0.1,
    count = 9,
    reset = 9,
    played_hands = {} 
  }},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    unique_hand_tooltip(self, info_queue, card)
    info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"Sonfive"}}

    local a = card.ability.extra

    local vars = {
      a.Xmult_multi,   -- 1
      a.Xmult_mod,    -- 2
      a.count or 0     -- 3
    }

    return {vars = vars}
  end,
  rarity = 3,
  cost = 8,
  stage = "Basic",
  ptype = "Earth",
  atlas = "Pokedex8",
  blueprint_compat = false,  
  calculate = function(self, card, context)
    local a = card.ability.extra
    if context.scoring_hand and not context.individual and not context.repetition and not context.blueprint then
      local hands = {
        "High Card", "Pair", "Two Pair", "Three of a Kind", "Straight",
        "Flush", "Full House", "Four of a Kind", "Straight Flush",
        "Five of a Kind", "Flush House", "Flush Five"
      }
      local visible_hands = {}
      for i = 1, #hands do
        if G.GAME.hands[hands[i]].visible then
          table.insert(visible_hands, hands[i])
        end
      end

      if context.before and context.cardarea == G.jokers then
        if not a.played_hands then a.played_hands = {} end

        local played_hand = nil
        for i = #visible_hands, 1, -1 do
          local hand = visible_hands[i]
          if context.poker_hands[hand] and next(context.poker_hands[hand]) then
            played_hand = hand
            break
          end
        end

        if played_hand and not context.blueprint then
          if a.played_hands[played_hand] then
            -- repeated hand → reset memory & counter first
            -- a.played_hands = {}
            -- a.count = 9 
            --return {message = localize{"k_reset"}}
          else

          a.played_hands[played_hand] = true
          a.count = a.count - 1
          end

          -- all unique hands played → boost & reset
          if a.count <= 0 and not context.blueprint then
            a.played_hands = {}
            a.count = a.reset
            a.Xmult_multi = a.Xmult_multi + a.Xmult_mod
            --return {message = localize{"k_upgrade_ex"}}
          end
        end
      end
    end

    
    
    if context.other_joker and not context.blueprint then
      local pos = 0
    for i = 1, #G.jokers.cards do
      if G.jokers.cards[i] == card then
        pos = i
        break
      end
    end
      if context.other_joker == G.jokers.cards[pos-1] or context.other_joker == G.jokers.cards[pos+1] then
        G.E_MANAGER:add_event(Event({
          func = function()
            context.other_joker:juice_up(0.5, 0.5)
            return true
          end
        }))
        return {
          message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.Xmult_multi}}, 
          colour = G.C.XMULT,
          Xmult_mod = card.ability.extra.Xmult_multi
        }
      end
    end
  end,
  set_ability = function(self, card, initial, delay_sprites)
    if initial then
      card.ability.extra.count = card.ability.extra.reset
      card.ability.extra.played_hands = {} 
    end
  end
}


if sonfive_config.Stonjourner then
  list = {stonjourner}
else list = {}
end

return {name = "Stonjourner", 
list = list
}