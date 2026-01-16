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

-- SMODS.Keybind({ key = "openQuests", key_pressed = "o", action = G.FUNCS.sonfive_quest })

-- local capture_focused_input_ref = G.CONTROLLER.capture_focused_input
-- G.CONTROLLER.capture_focused_input = function(self, button, input_type, dt)
--   if input_type == 'press' and button == 'leftstick' then
--     G.FUNCS.sonfive_quest()
--   end
--   return capture_focused_input_ref(self, button, input_type, dt)
-- end

if not next(SMODS.find_mod("PokermonMaelmc")) then
  SMODS.Keybind({ key = "openQuests", key_pressed = "o", action = G.FUNCS.sonfive_quest })

  local capture_focused_input_ref = G.CONTROLLER.capture_focused_input
  G.CONTROLLER.capture_focused_input = function(self, button, input_type, dt)
    if input_type == 'press' and button == 'leftstick' then
      G.FUNCS.sonfive_quest()
    end
    return capture_focused_input_ref(self, button, input_type, dt)
  end
end

function add_quest_voucher(key)
  G.E_MANAGER:add_event(Event({
    trigger = 'after',
    delay = 0,
    func = function()
      if not (G.shop_vouchers and G.shop_vouchers.cards) then
        return true
      end

      -- Already present? Bail.
      for _, c in ipairs(G.shop_vouchers.cards) do
        if c.ability and c.ability.name == key then
          return true
        end
      end

      -- Ensure capacity
      G.shop_vouchers.config.card_limit =
        (G.shop_vouchers.config.card_limit or #G.shop_vouchers.cards) + 1

      local _card = Card(
        G.shop_vouchers.T.x + G.shop_vouchers.T.w / 2,
        G.shop_vouchers.T.y,
        G.CARD_W,
        G.CARD_H,
        G.P_CARDS.empty,
        G.P_CENTERS[key],
        { bypass_discovery_center = true, bypass_discovery_ui = true }
      )

      create_shop_card_ui(_card, 'Voucher', G.shop_vouchers)
      _card:start_materialize()
      G.shop_vouchers:emplace(_card)

      return true
    end
  }))
end


-- Thanks Mael :D
function sonfive_set_next_boss(key,force_next_ante,allow_during_boss,reset_chips)
  if force_next_ante or ((not allow_during_boss) and G.GAME and G.GAME.blind and G.GAME.blind.boss) then
    G.GAME.perscribed_bosses[G.GAME.round_resets.ante + 1] = key
    return
  end

  if (G.GAME and G.GAME.blind and G.GAME.blind.boss) and allow_during_boss then
    G.GAME.blind:set_blind(G.P_BLINDS[key])
    ease_background_colour_blind(G.STATE)
    if reset_chips then G.GAME.chips = 0 end
    return
  end

  G.E_MANAGER:add_event(Event({
    trigger = "condition",
    blocking = false,
    func = function()
      if not G.blind_select then return false end
      local par = G.blind_select_opts.boss.parent
      G.GAME.round_resets.blind_choices.Boss = key
      G.blind_select_opts.boss = UIBox{
        T = {par.T.x, 0, 0, 0, },
        definition =
        {n=G.UIT.ROOT, config={align = "cm", colour = G.C.CLEAR}, nodes={
            UIBox_dyn_container({create_UIBox_blind_choice('Boss')},false,get_blind_main_colour('Boss'), mix_colours(G.C.BLACK, get_blind_main_colour('Boss'), 0.8))
        }},
        config = {align="bmi",
          offset = {x=0,y=G.ROOM.T.y + 9},
          major = par,
          xy_bond = 'Weak'
        }
      }
      par.config.object = G.blind_select_opts.boss
      par.config.object:recalculate()
      G.blind_select_opts.boss.parent = par
      G.blind_select_opts.boss.alignment.offset.y = 0
      return true
    end
  }))
end