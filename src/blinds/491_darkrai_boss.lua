local darkrai_boss={
    key = "darkrai_boss",
    dollars = 10,
    mult = 10,
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
                for i = 1, #G.jokers.cards do
                    local card = G.jokers.cards[i]
                    card.ability.extra.drain = ((card.ability.extra.energy_count or 0) + (card.ability.extra.c_energy_count or 0))
                    local drain = card.ability.extra.drain
                    if (card.ability.extra.energy_count and card.ability.extra.energy_count > 0) 
                        or (card.ability.extra.c_energy_count and card.ability.extra.c_energy_count > 0) then
                        
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
                for i = 1, #G.jokers.cards do
                    local card = G.jokers.cards[i]
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
                return true
            end
        }))
        complete_quest('sonfive','darkrai')
        G.GAME.darkrai_quest_complete = true
    end

}

return {name = "Darkrai Boss Blind",
        list = {darkrai_boss}
}