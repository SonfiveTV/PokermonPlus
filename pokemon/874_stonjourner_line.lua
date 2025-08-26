local stonjourner = {
  name = "stonjourner",
  pos = {x = 11, y = 4},
  config = {extra = {Xmult_multi = 1.3, Xmult_gain = 0.3, hand_played = "High Card", count = 9}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"Sonfive"}}
		return {vars = {card.ability.extra.Xmult_multi, card.ability.extra.Xmult_gain, card.ability.extra.hand_played and localize(card.ability.extra.hand_played, 'poker_hands'), card.ability.extra.count}}
  end,
  rarity = 3,
  cost = 8,
  stage = "Basic",
  ptype = "Earth",
  atlas = "Pokedex8",
  blueprint_compat = true,  
  calculate = function(self, card, context)
  local a = card.ability.extra
  if context.scoring_hand and not context.individual and not context.repetition and not context.blueprint then
    -- list hands
    local hands = {"High Card", "Pair", "Two Pair", "Three of a Kind", "Straight", "Flush", "Full House", "Four of a Kind", "Straight Flush", "Five of a Kind", "Flush House", "Flush Five"}
    local visible_hands = {}
    for i = 1, #hands do
      if G.GAME.hands[hands[i]].visible then
        table.insert(visible_hands, hands[i])
      end
    end

    if context.before and context.cardarea == G.jokers then
      -- correct hand type played
      if context.poker_hands[a.hand_played] and next(context.poker_hands[a.hand_played]) then
        -- tick down counter
        a.count = a.count - 1

        -- move to next hand in cycle
        for j = 1, #visible_hands do
          if visible_hands[j] == a.hand_played then
            if j == #visible_hands then
              a.hand_played = visible_hands[1]
            else
              a.hand_played = visible_hands[j+1]
            end
            break
          end
        end

        -- if counter hit 0 → reset & increment multiplier
        if a.count == 0 then
          a.count = #visible_hands
          a.Xmult_multi = a.Xmult_multi + a.Xmult_gain
        end

      else
        -- wrong hand type → reset counter only
        a.count = #visible_hands
      end
    end
  end
  
    local pos = 0
    for i = 1, #G.jokers.cards do
      if G.jokers.cards[i] == card then
        pos = i
        break
      end
    end
    if context.other_joker then
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
      local hands = {"High Card", "Pair", "Two Pair", "Three of a Kind", "Straight", "Flush", "Full House", "Four of a Kind", "Straight Flush", "Five of a Kind", "Flush House", "Flush Five"}
      local visible_hands = {}
      for i = 1, #hands do
        if G.GAME.hands[hands[i]].visible then
          table.insert(visible_hands, hands[i])
        end
      end

      card.ability.extra.hand_played = visible_hands[1]
      card.ability.extra.count = #visible_hands
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