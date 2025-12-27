local meltan_boss={
    key = "meltan_boss",
    dollars = 10,
    mult = 4,
    atlas = "sonfive_boss_blinds",
    pos = { 
        x = 0, 
        y = 2
    },
    boss = {
        showdown = false, 
        min = 8, 
        max = 80 
    },
    boss_colour = HEX("8f3e21"),
    in_pool = function(self)
        return false
    end,
    calculate = function(self, card, context)
        if context.individual and not context.end_of_round and context.other_card and SMODS.has_enhancement(context.other_card, 'm_steel') and (context.cardarea == G.play or context.cardarea == G.hand) then

            local metal_count = 0

            for i = 1, #G.jokers.cards do
                local joker = G.jokers.cards[i]
                if joker and is_type(joker, "Metal") then
                    metal_count = metal_count + 1
                end
            end

            if metal_count > 0 then
                return { xmult = 0.8 ^ metal_count }
            end
        end
    end,

    defeat = function(self)
        complete_quest('sonfive', 'meltan')
    end
}

return {name = "Meltan Boss Blind",
        list = {meltan_boss}
}