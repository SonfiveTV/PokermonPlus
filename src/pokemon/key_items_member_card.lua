local member_card = {
  name = "member_card",
  config = {extra = {
    quest1 = 3,
    quest2 = 6,
    quest3 = 12,
    energy_used = {}
  }},
  loc_vars = function(self, info_queue, card)
    local info = card.ability.extra
    info_queue[#info_queue+1] = {set = 'Other', key = 'rewards_member_card', vars = {info.quest1, info.quest2, info.quest3}}
    info_queue[#info_queue + 1] = SONFIVE.member_card_tooltip(self, info_queue, card)
    
    local count = 0
    for _ in pairs(info.energy_used) do
      count = count + 1
    end
    return {vars = {count}}
  end,
  sonfive_config_key = "key_items",
  designer = "Sonfive",
  rarity = 3,
  cost = 8,
  stage = "Other",
  atlas = "sonfive_other",
  pos = {x = 1, y = 1},
  blueprint_compat = false,
  eternal_compat = false,
  in_pool = function(self)
    return sonfive_config.darkrai
    -- return not (next(SMODS.find_card("j_sonfive_darkrai")) or next(SMODS.find_card("j_sonfive_mega_darkrai")))
  end,
  calculate = function(self, card, context)
    local info = card.ability.extra
    local count = 0
    for _ in pairs(info.energy_used) do
      count = count + 1
    end
    if context.using_consumeable then
      for _, ptype in ipairs(POKE_TYPES) do
        local energy_key =
          'c_poke_' .. string.lower(ptype)
          .. (ptype == 'Dark' and 'ness' or '')
          .. '_energy'

        if context.consumeable.ability.name == energy_key then
          if not info.energy_used[ptype] then
            info.energy_used[ptype] = true
          end
        end
      end
        if context.consumeable.ability.name == 'double_rainbow_energy' then
          if not info.energy_used.rainbow then
            info.energy_used.rainbow = true
          end
        end
    end
    if context.selling_self and not context.blueprint then
      if count >= info.quest3 then
        SMODS.add_card{set = "Joker", key = "j_sonfive_darkrai"}
      elseif count >= info.quest2 then
        G.GAME.poke_energy_plus = (G.GAME.poke_energy_plus or 0) + 1
      elseif count >= info.quest1 then
        if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
          G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
          G.E_MANAGER:add_event(Event({
              func = function()
                SMODS.add_card{set = "Spectral", key = "c_poke_obituary"}
                G.GAME.consumeable_buffer = 0
                return true
              end
          })) 
          card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
        else
          card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "No Room!", colour = G.C.MULT})
        end
      end
    end

  end,

}


local list = {member_card}

return {name = "Member Card",
list = list
}