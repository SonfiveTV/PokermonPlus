local lechonk = {
    name = "lechonk",
    config = {
        extra = {
            triggered = false,
            rounds = 5,
        }
    },

    loc_vars = function(self, info_queue, card)
        type_tooltip(self, info_queue, card)
        local balance = "Not set"
        if card.ability.extra.previous then
            color = G.C.MONEY
            balance = "$"..card.ability.extra.previous
        else
            color = G.C.UI.TEXT_INACTIVE
            balance = "Not set"
        end
        return {
            vars = {
                card.ability.extra.rounds,
                balance,
                colours = {color}
            }
        }
    end,

    designer = "Sonfive",
    rarity = 1,
    cost = 6,
    stage = "Basic",
    ptype = "Colorless",
    gen = 9,
    blueprint_compat = false,
    poke_custom_values_to_keep = {"previous", "earned"},
    calculate = function(self, card, context)
        local a = card.ability.extra
        local earned = nil
        if context.setting_blind and not a.triggered and not context.blueprint then 
            if a.previous then
                if  G.GAME.dollars > a.previous then
                    earned = G.GAME.dollars - a.previous

                    card.ability.extra_value = (card.ability.extra_value or 0) + (earned)
                    card:set_cost()
                    return {
                        dollars = -earned,
                        card = card
                    }
                end
            end
            a.triggered = true
            a.previous = G.GAME.dollars
        end
        if context.end_of_round then
            a.triggered = false
        end
        return level_evo(self, card, context, "j_sonfive_oinkologne")
    end,
}


local oinkologne = {
    name = "oinkologne",
    config = {
        extra = {
            current = 0,
            earned = 0,
            triggered = false,
            initial_blind = true,
        }
    },

    loc_vars = function(self, info_queue, card)
        type_tooltip(self, info_queue, card)
        local balance = "Not set"
        if card.ability.extra.previous then
            color = G.C.MONEY
            balance = "$"..card.ability.extra.previous
        else
            color = G.C.UI.TEXT_INACTIVE
            balance = "Not set"
        end
        return {
            vars = {
                balance,
                colours = {color}
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
        if context.setting_blind and not a.triggered and not context.blueprint then 
            if a.initial_blind then
                a.previous = G.GAME.dollars
                a.initial_blind = false
            end
            a.current = G.GAME.dollars
            if a.previous and (a.current > a.previous) then 
                a.earned = math.floor(a.current - a.previous)
                a.triggered = true
                card.ability.extra_value = (card.ability.extra_value or 0) + (a.earned)
                card:set_cost()
                return {
                    dollars = -(a.earned / 2),
                    card = card
                }
            end
            a.previous = G.GAME.dollars
            a.previous = a.current
        end
        if context.end_of_round and not context.blueprint then
            a.triggered = false
        end
    end
}

if sonfive_config.Lechonk then
  list = {lechonk, oinkologne}
else list = {}
end

return {name = "Lechonk", 
list = list
}