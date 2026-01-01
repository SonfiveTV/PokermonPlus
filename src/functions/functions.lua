-- Describe all the logic for debuffing or undebuffing

-- return values: true, false, or 'prevent_debuff'
SMODS.current_mod.set_debuff = function(card)
   if card and card.ability and card.ability.fainted == G.GAME.round then
      return G.STATE == G.STATES.SELECTING_HAND or G.STATE == G.STATES.HAND_PLAYED or G.STATE == G.STATES.DRAW_TO_HAND
   end

   -- prevent debuffs
   if card.ability.name == "nacli" then return 'prevent_debuff' end
   if card.ability.name == "naclstack" then return 'prevent_debuff' end
   if card.ability.name == "garganacl" then return 'prevent_debuff' end

   return false
end

SMODS.current_mod.reset_game_globals = function(run_start)
  if run_start then
    for _, center in pairs(G.P_CENTERS) do
      if center.sonfive_config_key and not sonfive_config[center.sonfive_config_key] then
        G.GAME.banned_keys[center.key] = true
      end
    end
  end
end

sonfive_quest_keys = {}
SMODS.current_mod.calculate = function(self, context)
  -- For Grafaiai
  if context.tag_triggered then
    G.GAME.last_tag = context.tag_triggered.key
  end

  -- For Quests
  local active = G.GAME.active_quest
  local complete = G.GAME.quest_complete
  local quests = {
    {pokemon = "heatran", func = sonfive_heatran_quest}, 
    {pokemon = "darkrai", func = sonfive_darkrai_quest},
    {pokemon = "meltan", func = sonfive_meltan_quest}
  }

  for i, q in ipairs(quests) do
    if not ((complete and complete[q.pokemon]) or (active == q.pokemon)) then
      q.func(self, context)
    end

    if active and active == q.pokemon then
      sonfive_quest_keys[i] = "j_sonfive_quest_"..q.pokemon.."_active"
    elseif complete and complete[q.pokemon] then
      sonfive_quest_keys[i] = "j_sonfive_quest_"..q.pokemon.."_complete"
    else
      sonfive_quest_keys[i] = "j_sonfive_quest_"..q.pokemon
    end
  end
end

-- Void Deck Negative Energy check
local energy_use_ref = energy_use
energy_use = function(self, card, area, copier, highlighted, exclude_spoon)
  if G.GAME.modifiers.void and card.edition and card.edition.negative then G.GAME.neg_energy_trigger = true end
  energy_use_ref(self, card, area, copier, highlighted, exclude_spoon)
end

local increment_energy_ref = increment_energy
increment_energy = function(card, etype, amount, silent)
  if G.GAME.modifiers.void and G.GAME.neg_energy_trigger then
    card.ability.extra.e_limit_up = (card.ability.extra.e_limit_up or 0) + 1
    G.GAME.neg_energy_trigger = nil
  end
  increment_energy_ref(card, etype, amount, silent)
end

-- Making the energy counter tooltip show at 0 energy for weakened jokers
local type_tooltip_ref = type_tooltip
type_tooltip = function(self, info_queue, center)
  if (center.ability and center.ability.extra and type(center.ability.extra) == "table" and
      center.ability.sonfive_weakened and (get_total_energy(center) == 0)) then
    info_queue[#info_queue+1] = {set = 'Other', key = "energy",
        vars = {get_total_energy(center), energy_max + (G.GAME.energy_plus or 0) + (center.ability.extra.e_limit_up or 0)}}
  end
  type_tooltip_ref(self, info_queue, center)
end

function sonfive_base_evo_name(card)
    -- Get the name of the base form if you can
    local fam = poke_get_family_list(card.name)
    -- Default is your own name, you may have no family T.T
    local base_evo_name = card.name
    if #fam > 0 then
        -- Found a base evo, use it's name
        base_evo_name = fam[1]
    end
    return base_evo_name
end

unique_hand_tooltip = function(self, info_queue, center)
  if center.ability and center.ability.extra and type(center.ability.extra) == "table" and center.ability.extra.played_hands then
    local a = center.ability.extra

    -- master hand order
    local hands = {
      "High Card", "Pair", "Two Pair", "Three of a Kind", "Straight",
      "Flush", "Full House", "Four of a Kind", "Straight Flush",
      "Five of a Kind", "Flush House", "Flush Five"
    }

    -- Collect only played hands
    local played_list = {}
    for _, hand in ipairs(hands) do
      if a.played_hands[hand] then
        table.insert(played_list, hand)
      end
    end

    -- Only show tooltip if there is at least one played hand
    if #played_list > 0 then
      local key = "ston_hands" .. #played_list  -- dynamic key
      info_queue[#info_queue + 1] = {set = 'Other', key = key, vars = played_list}
    end
  end
end



local is_type_ref = is_type

is_type = function(card, target_type)
  if not card then return false end

  if next(SMODS.find_card('j_sonfive_grafaiai')) then
    for _, graf in ipairs(G.jokers.cards) do
      if graf.ability and graf.ability.name == 'grafaiai' then
        local targets = graf.ability.extra.targets or {}

        -- build a lookup set
        local set = {}
        for _, t in ipairs(targets) do
          set[t.value] = true
        end

        -- both must be in the same target set, but not equal
        if set[target_type] and set[get_type(card)]
          and target_type ~= get_type(card)
        then
          return true
        end
      end
    end
  end

  return is_type_ref(card, target_type)
end

