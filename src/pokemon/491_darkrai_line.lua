local darkrai = {
  name = "darkrai",
  config = { extra = {} },
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    info_queue[#info_queue + 1] = { set = 'Spectral', key = 'c_poke_nightmare' }
  end,
  designer = "Sonfive",
  rarity = 4,
  cost = 20,
  stage = "Legendary",
  ptype = "Dark",
  gen = 4,
  blueprint_compat = false,
  add_to_deck = function(self, card, from_debuff)
    if not from_debuff then
      local _card = SMODS.add_card({key = 'c_poke_nightmare', area = G.consumeables})
      SMODS.calculate_effect({ message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral }, _card)
    end
  end,
  calculate = function(self, card, context)
    if not context.blueprint and G.consumeables then
      local darkrai_count = #SMODS.find_card("j_sonfive_darkrai") -- need this to support multiples

      for _, joker in ipairs(G.jokers.cards) do
        if not joker.ability.extra then joker.ability.extra = {} end
        local prev_count = joker.ability.extra.darkrai_ecount or 0
        local curr_count = 0

        -- Get the number of energy that have the joker's type
        for _, energy in pairs(pokermon.filter(G.consumeables.cards, function(energy) return energy.ability.set == 'poke_energy' end)) do
          if pokermon.is_type(joker, energy.config.center.etype) then
            curr_count = curr_count + darkrai_count
          end
        end

        -- Energize joker based on change of amount
        if curr_count ~= prev_count and pokermon.energy.is_energizable(joker) then
          local delta = curr_count - prev_count
          pokermon.energy.energize(joker, pokermon.get_type(joker), nil, true, delta)
          joker.ability.extra.darkrai_ecount = curr_count
        end
      end
    end
  end,

  remove_from_deck = function(self, card, from_debuff)
    for _, joker in ipairs(G.jokers.cards) do
      local extra = joker.ability and joker.ability.extra
      if extra and extra.darkrai_ecount then
        pokermon.energy.energize(joker, pokermon.get_type(joker), false, true, -extra.darkrai_ecount)
      end
      extra.darkrai_ecount = 0
    end
  end,
  megas = { "mega_darkrai" }
}

local mega_darkrai = {
  name = "mega_darkrai",
  config = { extra = { Xmult_multi = 1 } },
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    return { vars = { card.ability.extra.Xmult_multi } }
  end,
  designer = "Sonfive",
  rarity = "poke_mega",
  cost = 20,
  atlas = "sonfive_other",
  pos = { x = 0, y = 0 },
  soul_pos = { x = 1, y = 0 },
  stage = "Mega",
  ptype = "Dark",
  gen = 4,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.other_consumeable and context.other_consumeable.ability.set == 'poke_energy' then
      local Xmult = #pokermon.find_pokemon_type(context.other_consumeable.config.center.etype) * card.ability.extra.Xmult_multi

      if Xmult > 1 then
        return { Xmult = Xmult, message_card = context.other_consumeable }
      end
    end
  end
}


local list = { darkrai, mega_darkrai }

return {
  name = "Darkrai",
  list = list
}
