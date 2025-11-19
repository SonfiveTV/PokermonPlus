local lechonk = {
    name = "lechonk",
    config = {
        extra = {
            triggers = 0,
            percentage = 75,
            reset = 0,
            volatile = 'right',
            evo_rqmt = 5
        }
    },
    loc_vars = function(self, info_queue, card)
        type_tooltip(self, info_queue, card)
        if pokermon_config.detailed_tooltips then
          info_queue[#info_queue+1] = {set = 'Other', key = 'poke_volatile_'..card.ability.extra.volatile}
        end
        return {
            vars = {
                card.ability.extra.percentage,
                card.ability.extra.reset,
                card.ability.extra.evo_rqmt - card.ability.extra.triggers,
                
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
        card.ability.extra_value = (card.ability.extra_value or 0) + (a.percentage / 100 * earned)
        card:set_cost()
        return {
            dollars = a.reset - earned,
            card = card
        }
      end
    end
    return scaling_evo(self, card, context, "j_sonfive_oinkologne", card.ability.extra.triggers, card.ability.extra.evo_rqmt)
  end
}


local oinkologne = {
    name = "oinkologne",
    config = {
        extra = {
            percentage = 150,
            reset = 0,
            volatile = 'right'
        }
    },
    loc_vars = function(self, info_queue, card)
        type_tooltip(self, info_queue, card)
        if pokermon_config.detailed_tooltips then
          info_queue[#info_queue+1] = {set = 'Other', key = 'poke_volatile_'..card.ability.extra.volatile}
        end
        return {
            vars = {
                card.ability.extra.percentage,
                card.ability.extra.reset
            }
        }
    end,
    atlas = "AtlasJokersBasicGen09",
    pos = {x = 0, y = 0},
    designer = "Sonfive",
    rarity = "poke_safari",
    cost = 8,
    stage = "One",
    ptype = "Colorless",
    gen = 9,
    blueprint_compat = false,
    calculate = function(self, card, context)
    local a = card.ability.extra
    local earned = nil
    if context.setting_blind and not context.blueprint and volatile_active(self, card, card.ability.extra.volatile) then
      earned = (SMODS.Mods["Talisman"] or {}).can_load and to_number(G.GAME.dollars) or G.GAME.dollars
      if earned > 0 then
        card.ability.extra_value = (card.ability.extra_value or 0) + (a.percentage / 100 * earned)
        card:set_cost()
        return {
            dollars = a.reset - earned,
            card = card
        }
      end
    end
  end,
}

list = {lechonk, oinkologne}

return {name = "Lechonk", 
list = list
}
