function sonfive_heatran_quest(self, context)

  local cards = G.playing_cards

  local REQUIRED_CENTERS = {
    "m_bonus", "m_mult", "m_wild", "m_glass",
    "m_steel", "m_stone", "m_gold", "m_lucky",
    "e_foil", "e_holo", "e_polychrome"
  }

  local REQUIRED_SEALS = {
    "gold", "red", "blue", "purple", "poke_pink_seal", "poke_silver"
  }

  local center_present = {}
  local seal_present   = {}

  for _, card in pairs(cards) do
    if card.config and card.config.center then
      local center_key = card.config.center.key
      if center_key then center_present[center_key] = true end
    end

    if card.edition and card.edition.key then
      center_present[card.edition.key] = true
    end

    if card.seal then
      local seal_key = type(card.seal) == "table" and card.seal.key or card.seal
      if seal_key then seal_present[seal_key:lower()] = true end
    end
  end

  for _, key in ipairs(REQUIRED_CENTERS) do
    if not center_present[key] then return end
  end

  for _, key in ipairs(REQUIRED_SEALS) do
    if not seal_present[key] then return end
  end
   
  set_quest_boss('sonfive','heatran')
  
end

function sonfive_darkrai_quest(self, context)

  local types = {
    "Grass", "Fire", "Water", "Lightning", "Psychic",
    "Fighting", "Colorless", "Dark", "Metal", "Fairy",
    "Dragon", "Earth"
  }

  G.GAME.darkrai_quest_types = G.GAME.darkrai_quest_types or {}
print('Used consumable key:', context.consumeable.ability.name)

  for _, ptype in ipairs(types) do
    local energy_key =
      'c_poke_' .. string.lower(ptype)
      .. (ptype == 'Dark' and 'ness' or '')
      .. '_energy'

    if context.consumeable.ability.name == energy_key then
      if not G.GAME.darkrai_quest_types[ptype] then
        G.GAME.darkrai_quest_types[ptype] = true
        print('Darkrai quest: collected ' .. ptype .. ' energy')
      end
    end
  end

  local count = 0
  for _ in pairs(G.GAME.darkrai_quest_types) do
    count = count + 1
  end
  print('Darkrai quest: total types collected: ' .. count)
  if count == 12 and context.consumeable.ability.name == 'nightmare' then
    set_quest_boss('sonfive', 'darkrai')
  end
end
