local mystery_box = {
  name = "mystery_box",
  config = {extra = {
    quest1 = 5,
    quest2 = 10,
    quest3 = 20,
    count = 0
  }},
  loc_vars = function(self, info_queue, card)
    local info = card.ability.extra
    info_queue[#info_queue+1] = {set = 'Other', key = 'rewards_mystery_box', vars = {info.quest1, info.quest2, info.quest3}}
    
    local count = info.count or 0
    return {vars = {count}}
  end,
  designer = "Sonfive",
  rarity = 3,
  cost = 8,
  stage = "Other",
  atlas = "sonfive_other",
  pos = {x = 2, y = 1},
  blueprint_compat = false,
  calculate = function(self, card, context)
    local info = card.ability.extra
    local count = 0
    if context.selling_card and pokermon.is_type(context.card, "Metal") then
      info.count = info.count + 1
    end
    if context.selling_self and not context.blueprint then
      if info.count >= info.quest3 then
        SMODS.add_card{set = "Joker", key = "j_sonfive_meltan"}
      elseif info.count >= info.quest2 then
        if (#G.jokers.cards + G.GAME.joker_buffer) < G.jokers.config.card_limit then
          G.GAME.joker_buffer = G.GAME.joker_buffer + 1
          G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
              G.GAME.joker_buffer = 0
              play_sound('timpani')
              SMODS.add_card({ set = 'Joker', key = pokermon.get_random_poke_key('mystery_box', "Basic", nil, nil, "Metal"), edition = "e_negative" })
              return true
            end
          }))

          return {
            message = localize('k_plus_joker'),
            colour = G.C.BLUE,
          }
        end
      elseif info.count >= info.quest1 then
        if (#G.jokers.cards + G.GAME.joker_buffer) < G.jokers.config.card_limit then
          G.GAME.joker_buffer = G.GAME.joker_buffer + 1
          G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
              G.GAME.joker_buffer = 0
              play_sound('timpani')
              SMODS.add_card({ set = 'Joker', key = pokermon.get_random_poke_key('mystery_box', "Basic", nil, nil, "Metal") })
              return true
            end
          }))

          return {
            message = localize('k_plus_joker'),
            colour = G.C.BLUE,
          }
        end
      end
    end

  end,

}

local list = {mystery_box}

return {name = "Mystery Box",
list = list
}