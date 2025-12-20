local darkrai = {
  name = "darkrai",
  config = {extra = {}},
  loc_vars = function(self, info_queue, card)
      type_tooltip(self, info_queue, card)
  end,
  designer = "Sonfive",
  rarity = 4,
  cost = 20,
  stage = "Legendary",
  ptype = "Dark",
  gen = 4,
  blueprint_compat = false,
  calculate = function(self, card, context)
      -- Spawn Spectral card if conditions are met
      if not context.repetition and not context.individual and context.end_of_round
         and G.GAME.last_blind and G.GAME.last_blind.boss then
          if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
              local _card = SMODS.add_card({set = 'Spectral', area = G.consumeables, key = 'c_poke_nightmare'})
              card_eval_status_text(_card, 'extra', nil, nil, nil,
                  {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
          end
      end

      local a = card.ability.extra
      local types = {"Grass", "Fire", "Water", "Lightning", "Psychic",
                    "Fighting", "Colorless", "Dark", "Metal", "Fairy",
                    "Dragon", "Earth"}

      if not context.blueprint then
          local darkrai_count = #SMODS.find_card("j_sonfive_darkrai")

          -- Initialize Darkrai's snapshot
          if not a.darkrai_applied_energy then
              a.darkrai_applied_energy = {}
          end

          -- Step 1: Calculate desired energy per type
          for _, ptype in pairs(types) do
              local energy_key = 'c_poke_'..string.lower(ptype)..(ptype == 'Dark' and 'ness' or '')..'_energy'
              local energy_type_count = #SMODS.find_card(energy_key) * darkrai_count
              a.darkrai_applied_energy[ptype] = energy_type_count

              -- Step 2: Apply to jokers
              for j = 1, #G.jokers.cards do
                  local joker = G.jokers.cards[j]
                  joker.ability.extra = joker.ability.extra or {}
                  if not joker.ability.extra.darkrai_applied then
                      joker.ability.extra.darkrai_applied = {}
                  end
                  local to_apply = a.darkrai_applied_energy[ptype]
                  local last_applied = joker.ability.extra.darkrai_applied[ptype] or 0

                  if is_type(joker, ptype) then
                      -- Joker matches this type → sync energies
                      if to_apply ~= last_applied then
                          local diff = to_apply - last_applied
                          energize(joker, ptype, nil, true, diff)
                          joker.ability.extra.darkrai_applied[ptype] = to_apply
                      end
                  else
                      -- Joker no longer this type → remove old Darkrai-applied energy
                      if last_applied > 0 then
                          energize(joker, ptype, false, true, -last_applied)
                          joker.ability.extra.darkrai_applied[ptype] = 0
                      end
                  end
              end
          end
      end
  end,

  remove_from_deck = function(self, card, from_debuff)
      local a = card.ability.extra
      local types = {"Grass", "Fire", "Water", "Lightning", "Psychic",
                    "Fighting", "Colorless", "Dark", "Metal", "Fairy",
                    "Dragon", "Earth"}

      for j = 1, #G.jokers.cards do
          local joker = G.jokers.cards[j]
          joker.ability.extra = joker.ability.extra or {}
          local applied = joker.ability.extra.darkrai_applied or {}

          for _, ptype in pairs(types) do
              local last_applied = applied[ptype] or 0
              if last_applied > 0 then
                  energize(joker, ptype, false, true, -last_applied)
                  applied[ptype] = 0
              end
          end
      end
      -- Clear Darkrai's own stored snapshot
      a.darkrai_applied_energy = {}
  end,
  megas = {"mega_darkrai"}
}

local mega_darkrai = {
  name = "mega_darkrai",
  config = {extra = {Xmult_multi = 1}},
  loc_vars = function(self, info_queue, card)
      type_tooltip(self, info_queue, card)
      local vars = {
      card.ability.extra.Xmult_multi
    }

    return {vars = vars}
  end,
  designer = "Sonfive",
  rarity = "poke_mega",
  cost = 20,
  atlas = "sonfive_mega",
  pos = {x = 0, y = 0},
  soul_pos = {x = 1, y = 0},
  stage = "Mega",
  ptype = "Dark",
  gen = 4,
  blueprint_compat = true,

calculate = function(self, card, context)
    if context.other_consumeable and context.other_consumeable.ability.set == 'Energy' then
        local types = {"Grass", "Fire", "Water", "Lightning", "Psychic",
                       "Fighting", "Colorless", "Dark", "Metal", "Fairy",
                       "Dragon", "Earth"}
        local Xmult = 0
        for _, ptype in pairs(types) do
            if context.other_consumeable.ability.name == 'c_poke_'..string.lower(ptype)..(ptype == 'Dark' and 'ness' or '')..'_energy' then
                Xmult = (#find_pokemon_type(ptype) * card.ability.extra.Xmult_multi)
                break 
            end
        end
        
        if Xmult > 1 then
            return {
                message = localize{type = 'variable', key = 'a_xmult', vars = {Xmult}}, 
                colour = G.C.XMULT,
                Xmult_mod = Xmult
            }
        end
    end
end
}


local list = {darkrai, mega_darkrai}

return {name = "Darkrai",
list = list
}