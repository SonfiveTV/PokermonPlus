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

-- copy of `is_energizable` but for centers instead
local is_center_energizable = function(center)
  if energizable_vanilla[center.name] then
    return true
  end
  -- Regular case
  if type(center.config.extra) == "table" then
    for name, _ in pairs(energy_values) do
      if type(center.config.extra[name]) == "number" then
        return true
      end
    end
  elseif type(center.config.extra) == "number" then
    return true
  -- More generic check for energizable values that aren't in ability.extra
  else
    for k, _ in pairs(energy_values) do
      if center.config[energy_values[k]] and center.config[energy_values[k]] > 0 then return true end
    end
  end
  return false
end

-- workaround for `get_family_keys` taking a card instead of a center
local get_family_key_set = function(center)
  local family = poke_get_family_list(center.name)
  local keys = {}
  if #family > 1 then
    local prefix = center.poke_custom_prefix or 'poke' -- if it's in a family, we know it's one of these
    for _, v in ipairs(family) do
      local name = type(v) == 'table' and v.key or v
      local key = 'j_' .. prefix .. '_' .. name
      if G.P_CENTERS[key] then
        keys[key] = true
      end
    end
  else
    keys[center.key] = true
  end
  return keys
end

SMODS.current_mod.reset_game_globals = function(run_start)
  if run_start then
    for _, center in pairs(G.P_CENTERS) do
      -- distribute `sonfive_weakened_compat` to jokers
      if G.GAME.modifiers.enable_sonfive_weakened and center.set == 'Joker'
          and center.sonfive_weakened_compat == nil then -- allow manual overrides
        local family_key_set = get_family_key_set(center)
        for k, _ in pairs(family_key_set) do
          local rel_center = G.P_CENTERS[k]
          if rel_center and is_center_energizable(rel_center) then
            center.sonfive_weakened_compat = true
            break
          end
        end
      end

      -- remove disabled cards from the pool
      if center.sonfive_config_key and not sonfive_config[center.sonfive_config_key] then
        G.GAME.banned_keys[center.key] = true
      end
    end
  end
end

-- function Card:calculate_shadow()
--     if self.ability.sonfive_shadow and self.ability.shadow_tally > 0 then
--         if self.ability.shadow_tally == 1 then
--           print(self.ability.extra_slots_used)
--             self.ability.shadow_tally = 0
--             -- card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize('k_disabled_ex'),colour = G.C.FILTER, delay = 0.45})
--             SMODS.Stickers["sonfive_purified"]:apply(self, true)
--             self:remove_sticker('sonfive_shadow')
--             self.ability.extra_slots_used = self.ability.extra_slots_used - 1
--             print(self.ability.extra_slots_used)
--         else
--             self.ability.shadow_tally = self.ability.shadow_tally - 1
--             card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize{type='variable',key='a_remaining',vars={self.ability.shadow_tally}},colour = G.C.FILTER, delay = 0.45})
--         end
--     end
-- end

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
      center.ability.sonfive_weakened and (get_total_energy(center) == 0)) or 
      (center.ability and center.ability.extra and type(center.ability.extra) == "table" and
      G.GAME.modifiers.pearlescent and (get_total_energy(center) == 0))
      then
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

  local card_type = get_type(card)

  if next(SMODS.find_card('j_sonfive_grafaiai')) then
    local groups = {}

    -- collect all Grafaiai target groups
    for _, graf in ipairs(G.jokers.cards) do
      if graf.ability and graf.ability.name == 'grafaiai' then
        local targets = graf.ability.extra.targets or {}

        local group = {}

        for _, t in ipairs(targets) do
          group[t.type] = true
        end

        table.insert(groups, group)
      end
    end

    -- merge overlapping groups
    local changed = true
    while changed do
      changed = false

      for i = #groups, 1, -1 do
        for j = i - 1, 1, -1 do
          local overlap = false

          for k in pairs(groups[i]) do
            if groups[j][k] then
              overlap = true
              break
            end
          end

          if overlap then
            -- merge i into j
            for k in pairs(groups[i]) do
              groups[j][k] = true
            end

            table.remove(groups, i)
            changed = true
            break
          end
        end
      end
    end

    -- check merged groups
    for _, group in ipairs(groups) do
      if group[target_type]
      and group[card_type]
      and target_type ~= card_type
      then
        return true
      end
    end
  end

  return is_type_ref(card, target_type)
end

canari_level = function(amount)
  if 3 <= amount and amount < 5 then return 1
    elseif 5 <= amount and amount < 8 then return 2
    elseif amount >= 8 then return 3
    else return 0
  end
end

canari_goal = function(level)
  if level == 0 then return 3
    elseif level == 1 then return 5
    elseif level == 2 then return 8
    elseif level == 3 then return 8
    else return 3
  end
end

SONFIVE_QUESTS = {}

--- Add a quest to the quest menu
---@param args {name:string, atlas:string, pos:function|table, display_text:function|table, dex:integer|nil, reward_text:function|table, reward_atlas:string|nil, reward_pos:function|table|nil, set:string|nil, designer:string|table|function}
---`name = "sepia_quest_name"` - Key for quest's name localization\
---`atlas = "maelmc_quests"` - Key for the quest's atlas, will be displayed as a PokeDisplayCard\
---`pos = {x = 0, y = 0}` - Table of {x,y} or function that returns said table\
---`display_text = {"a","b"}` - Table of strings or function that returns said table, describing the quest\
---`dex = 1` - Related Pokémon's dex number, or position in the quest's menu\
---`reward_text = {"a","b"}` - Table of strings or function that returns said table, describing rewards\
---`reward_atlas = "maelmc_boss_blinds"` - Key for the reward's atlas, or nil if none\
---`reward_pos = {x = 0, y = 0}` - Table of {x,y} or function that returns said table\
---`set = "Blind"` - The reward's set (only matters for Tag, Blind & Booster)\
---`designer = {name = "Maelmc", colour = G.C.MAELMC.ORANGE, back_colour = nil}` - A string of the designer's name, a table of {name,colour,back_colour} or a function returning either of these
function sonfive_add_quest(args)
  local new_quest = {
    name = args.name,
    atlas = args.atlas,
    pos = args.pos,
    display_text = args.display_text,
    dex = args.dex or 999999,
    reward_text = args.reward_text,
    reward_atlas = args.reward_atlas,
    reward_pos = args.reward_pos,
    set = args.set,
    designer = args.designer
  }

  local insert_at = 1
  for _, v in ipairs(SONFIVE_QUESTS) do
    if v.dex > args.dex then
      break
    end
    insert_at = insert_at + 1
  end
  table.insert(SONFIVE_QUESTS, insert_at, new_quest)
end

