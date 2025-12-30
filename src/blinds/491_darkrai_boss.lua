local darkrai_boss={
    key = "darkrai_boss",
    dollars = 10,
    mult = 4,
    atlas = "sonfive_boss_blinds",
    pos = { 
        x = 0, 
        y = 1 
    },
    boss = {
        showdown = false, 
        min = 8, 
        max = 80 
    },
    boss_colour = HEX("29293b"),
    in_pool = function(self)
        return false
    end,

    set_blind = function(self)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                for _, card in ipairs(G.jokers.cards) do
                    local extra = card.ability and card.ability.extra
                    if type(extra) == "table" then
                        card.ability.extra.drain = get_total_energy(card) + 1
                        local drain = card.ability.extra.drain

                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    card:juice_up()
                                    return true
                                end,
                            }))
                            energize(card, ptype, nil, true, -drain)
                            delay(0.1)
                    end
                end
                return true
            end
        }))
    end,

    defeat = function(self)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                for _, card in ipairs(G.jokers.cards) do
                    local extra = card.ability and card.ability.extra
                    if type(extra) == "table" then
                        local drain = card.ability.extra.drain
                        if drain then
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    card:juice_up()
                                    return true
                                end,
                            }))
                            energize(card, ptype, nil, true, drain)
                            delay(0.1)
                        end
                    end
                end
                return true
            end
        }))
        complete_quest('sonfive','darkrai')
    end

}

return {name = "Darkrai Boss Blind",
        list = {darkrai_boss}
}