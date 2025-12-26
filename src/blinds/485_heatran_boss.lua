local heatran_boss={
    key = "heatran_boss",
    dollars = 10,
    mult = 4,
    atlas = "sonfive_boss_blinds",
    pos = { 
        x = 0, 
        y = 0 
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
    local target = context.other_card
    
        if context.individual and context.cardarea ==  G.play and context.scoring_hand and not context.end_of_round then
            if (target.config.center ~= G.P_CENTERS.c_base) or target.edition or target.seal then
                return {
                x_mult = 0.5
                }
            end   
        end
        if context.individual and context.cardarea ==  G.hand and context.scoring_hand and not context.end_of_round then
            if (target.config.center ~= G.P_CENTERS.c_base) or target.edition or target.seal then
                return {
                x_mult = 0.5
                }
            end   
        end
    end,


    defeat = function(self)
        complete_quest('sonfive', 'heatran')
    end
}

return {name = "Heatran Boss Blind",
        list = {heatran_boss}
}