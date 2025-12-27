local old_reroll = G.FUNCS.reroll_boss
G.FUNCS.reroll_boss = function(...)
    local active = G.GAME.active_quest
    if active then
        local boss_key = 'bl_sonfive_'..active..'_boss'

        -- Current boss being shown in shop
        local current_boss = G.GAME.round_resets.blind_choices.Boss

        if current_boss == boss_key then
            G.GAME.active_quest = nil
        end
    end

    return old_reroll(...)
end


set_quest_boss = function(mod_prefix, pokemon) -- Adds the quest boss and marks the quest as active
    G.GAME.active_quest = pokemon

    G.GAME.perscribed_bosses = G.GAME.perscribed_bosses or {}
    G.GAME.bosses_used = G.GAME.bosses_used or {}

    G.GAME.bosses_used['bl_'..mod_prefix..'_'..pokemon..'_boss'] = G.GAME.bosses_used['bl_'..mod_prefix..'_'..pokemon..'_boss'] or 0
    G.GAME.perscribed_bosses[G.GAME.round_resets.ante + 1] = 'bl_'..mod_prefix..'_'..pokemon..'_boss'
end

complete_quest = function(mod_prefix, pokemon) -- Occurs when defeating the pokemon's Boss Blind 
  G.GAME.active_quest = nil
  G.GAME.quest_complete = G.GAME.quest_complete or {}
  G.GAME.quest_complete[pokemon] = true
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

sonfive_quest_keys = {}
SMODS.current_mod.calculate = function(self, context)
  local active = G.GAME.active_quest
  local complete = G.GAME.quest_complete
  local quests = {
    {pokemon = "heatran", func = sonfive_heatran_quest}, 
    {pokemon = "darkrai", func = sonfive_darkrai_quest}
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


function G.FUNCS.sonfive_quest()
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu {
        definition = create_UIBox_generic_options {
            back_func = 'exit_overlay_menu',
            contents = poke_create_UIBox_your_collection {
                keys = sonfive_quest_keys,
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