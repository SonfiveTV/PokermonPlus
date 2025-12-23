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

  G.GAME.quest_active = true
  G.GAME.perscribed_bosses = G.GAME.perscribed_bosses or {}
  G.GAME.bosses_used = G.GAME.bosses_used or {}

  G.GAME.bosses_used['bl_sonfive_heatran_boss'] = G.GAME.bosses_used['bl_sonfive_heatran_boss'] or 0
  G.GAME.perscribed_bosses[G.GAME.round_resets.ante + 1] = 'bl_sonfive_heatran_boss'
end