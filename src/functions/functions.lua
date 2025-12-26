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

local old_reroll = G.FUNCS.reroll_boss
G.FUNCS.reroll_boss = function(...)
    local result = old_reroll(...)   -- call original
    if G.GAME.quest_active then
        G.GAME.quest_active = false
    end
    return result
end

set_quest_boss = function(mod_prefix, pokemon)
    G.GAME.quest_active = true
    G.GAME.perscribed_bosses = G.GAME.perscribed_bosses or {}
    G.GAME.bosses_used = G.GAME.bosses_used or {}

    G.GAME.bosses_used['bl_'..mod_prefix..'_'..pokemon..'_boss'] = G.GAME.bosses_used['bl_'..mod_prefix..'_'..pokemon..'_boss'] or 0
    G.GAME.perscribed_bosses[G.GAME.round_resets.ante + 1] = 'bl_'..mod_prefix..'_'..pokemon..'_boss'
end

complete_quest = function(mod_prefix, pokemon)
  G.GAME.quest_active = false

  if (#G.jokers.cards + G.GAME.joker_buffer) < G.jokers.config.card_limit then
    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
    G.GAME.joker_buffer = 0
    play_sound('timpani')
    local _card = SMODS.create_card{
        set = "Joker",
        area = G.jokers,
        key = "j_"..mod_prefix..'_'..pokemon,
        no_edition = true
    }
    _card:add_to_deck()
    G.jokers:emplace(_card)
    return true end }))
    delay(0.6)
  end
end

SMODS.current_mod.calculate = function(self, context)
  if context.using_consumeable and not (G.GAME.heatran_quest_complete or G.GAME.quest_active) then
    sonfive_heatran_quest(self, context)
  end
  if context.using_consumeable and not (G.GAME.darkrai_quest_complete or G.GAME.quest_active) then
    sonfive_darkrai_quest(self, context)
  end
end

pokermon_quest_keys = {"j_sonfive_quest_heatran", "j_sonfive_quest_darkrai"}
function G.FUNCS.sonfive_quest()
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu {
        definition = create_UIBox_generic_options {
            back_func = 'exit_overlay_menu',
            contents = poke_create_UIBox_your_collection {
                keys = pokermon_quest_keys,
                cols = 4,
                dynamic_sizing = true
            },
        }
    }
end

SMODS.Keybind({ key = "openQuests", key_pressed = "o", action = G.FUNCS.sonfive_quest })

local capture_focused_input_ref = G.CONTROLLER.capture_focused_input
G.CONTROLLER.capture_focused_input = function(self, button, input_type, dt)
  if input_type == 'press' and button == 'leftstick' then
    G.FUNCS.sonfive_quest()
  end
  return capture_focused_input_ref(self, button, input_type, dt)
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

sandstorm = function()
  local count = 0
  for i=1, #G.hand.cards do
    if SMODS.has_enhancement(G.hand.cards[i], 'm_count') then 
        count = count + 1
    end
  end
  if count == #G.hand.cards then
    return true
  else 
    return false
  end
end

hail = function()
  local count = 0
  for i=1, #G.hand.cards do
    if SMODS.has_enhancement(G.hand.cards[i], 'm_glass') then 
        count = count + 1
    end
  end
  if count == #G.hand.cards then
    return true
  else 
    return false
  end
end

rain = function()
  local count = 0
  for i=1, #G.hand.cards do
    if SMODS.has_enhancement(G.hand.cards[i], 'm_bonus') then 
        count = count + 1
    end
  end
  if count == #G.hand.cards then
    return true
  else 
    return false
  end
end

sunny = function()
  local count = 0
  for i=1, #G.hand.cards do
    if SMODS.has_enhancement(G.hand.cards[i], 'm_mult') then 
        count = count + 1
    end
  end
  if count == #G.hand.cards then
    return true
  else 
    return false
  end
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

local original_pokemon_in_pool = pokemon_in_pool

function pokemon_in_pool(v)
  if v and v.tagged == "sonfive" then
    local base_evo_name = sonfive_base_evo_name(v)
    if not sonfive_config[base_evo_name] then
      return false
    end
  end
  return original_pokemon_in_pool(v)
end