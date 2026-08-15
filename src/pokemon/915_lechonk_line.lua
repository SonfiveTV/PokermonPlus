local lechonk = {
    name = "lechonk",
    config = {
        extra = {
          triggers = 0,
          reset = 0,
          volatile = 'right',
          money_mod = 1,
        },
        evo_rqmt = 3,
    },
    loc_vars = function(self, info_queue, card)
        if pokermon_config.detailed_tooltips then
          info_queue[#info_queue+1] = {set = 'Other', key = 'poke_volatile_'..card.ability.extra.volatile}
        end
        local earned = (SMODS.Mods["Talisman"] or {}).can_load and to_number(G.GAME.dollars) or G.GAME.dollars
        return {
            vars = {
              (card.ability.extra.money_mod * math.floor(earned)),
              card.ability.extra.reset,
              card.ability.evo_rqmt - card.ability.extra.triggers,
            }
        }
    end,
    designer = "Sonfive",
    rarity = 1,
    cost = 6,
    stage = "Basic",
    ptype = "Colorless",
    gen = 9,
    custom_art = true,
    blueprint_compat = false,
    calculate = function(self, card, context)
    local a = card.ability.extra
    local earned = nil
    if context.setting_blind and not context.blueprint and volatile_active(self, card, card.ability.extra.volatile) then
      a.triggers = a.triggers + 1
      earned = (SMODS.Mods["Talisman"] or {}).can_load and to_number(G.GAME.dollars) or G.GAME.dollars
      if earned > 0 then
        card.ability.extra_value = (card.ability.extra_value or 0) + (a.money_mod * math.floor(earned))
        card:set_cost()
        return {
            dollars = a.reset - earned,
            card = card
        }
      end
    end
    return pokermon.scaling_evo(self, card, context, "j_sonfive_oinkologne", card.ability.extra.triggers, self.config.evo_rqmt)
  end
}


local oinkologne = {
    name = "oinkologne",
    config = {
        extra = {
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                math.floor(card.sell_cost / 25),
            }
        }
    end,
    -- atlas = "AtlasJokersBasicGen09",
    -- pos = {x = 0, y = 0},
    designer = "Sonfive",
    rarity = "poke_safari",
    cost = 8,
    stage = "One",
    ptype = "Colorless",
    gen = 9,
    blueprint_compat = false,
    calculate = function(self, card, context)
    if context.setting_blind and context.blind and context.blind.boss and not context.blueprint then
      local count = math.floor(card.sell_cost / 25)
      if count > 0 then
        for _ = 1, count do
          G.E_MANAGER:add_event(Event({
            func = (function()
              add_tag(Tag("tag_investment"))
              play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
              play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
              return true
            end)
          }))
        end
      end
    end
  end,
}

local list = {lechonk, oinkologne}

return {name = "Lechonk", 
list = list
}
