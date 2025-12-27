function sonfive_heatran_quest(self, context) -- Collect all Enhancements, Editions, and Seals, then use Immolate to activate the quest
  if not context.using_consumeable then return end
  if context.consumeable.ability.name ~= 'Immolate' then return end

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

function sonfive_darkrai_quest(self, context) -- Use all 12 Energy card types, then use Nightmare to activate the quest
  if not context.using_consumeable then return end
  local types = {
    "Grass", "Fire", "Water", "Lightning", "Psychic",
    "Fighting", "Colorless", "Dark", "Metal", "Fairy",
    "Dragon", "Earth"
  }

  G.GAME.darkrai_quest_types = G.GAME.darkrai_quest_types or {}

  for _, ptype in ipairs(types) do
    local energy_key =
      'c_poke_' .. string.lower(ptype)
      .. (ptype == 'Dark' and 'ness' or '')
      .. '_energy'

    if context.consumeable.ability.name == energy_key then
      if not G.GAME.darkrai_quest_types[ptype] then
        G.GAME.darkrai_quest_types[ptype] = true
      end
    end
  end

  local count = 0
  for _ in pairs(G.GAME.darkrai_quest_types) do
    count = count + 1
  end
  if count == 12 and context.consumeable.ability.name == 'nightmare' then
    set_quest_boss('sonfive', 'darkrai')
  end
end

function sonfive_meltan_quest(self, context) -- Use Metal Energy, Metal Coat, and The Chariot 10 times each, then use Ankh to activate the quest
    G.GAME.meltan_quest = G.GAME.meltan_quest or {}
    local quest = G.GAME.meltan_quest

    -- Define counters with default values
    quest.energy_used = quest.energy_used or 0
    quest.metalcoat = quest.metalcoat or 0
    quest.chariot = quest.chariot or 0

    if not context.using_consumeable then return end

    -- Map ability names to quest counters
    local ability_map = {
        ['c_poke_metal_energy'] = 'energy_used',
        ['metalcoat']           = 'metalcoat',
        ['The Chariot']         = 'chariot'
    }

    local ability_name = context.consumeable.ability.name
    local counter = ability_map[ability_name]

    -- Increment the counter if applicable
    if counter then
        quest[counter] = math.min(quest[counter] + 1, 10)
    end

    -- Trigger the quest boss when all requirements are met
    if ability_name == 'Ankh' and
       quest.energy_used >= 10 and
       quest.metalcoat >= 10 and
       quest.chariot >= 10 then
        set_quest_boss('sonfive', 'meltan')
    end
end


