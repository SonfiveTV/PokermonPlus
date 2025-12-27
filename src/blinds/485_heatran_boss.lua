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
        G.GAME.heatran_boss_count = G.GAME.heatran_boss_count or 0

        if context.cardarea == G.play and context.individual and not target.debuff and not context.end_of_round then
            if target.config.center ~= G.P_CENTERS.c_base then G.GAME.heatran_boss_count = G.GAME.heatran_boss_count + 1 end
            if target.edition then G.GAME.heatran_boss_count = G.GAME.heatran_boss_count + 1 end
            if target.seal then G.GAME.heatran_boss_count = G.GAME.heatran_boss_count + 1 end
        end
        if context.final_scoring_step then
            local f_count = G.GAME.heatran_boss_count
            G.GAME.heatran_boss_count = 0 -- reset for next hand
            return { xmult = 0.9 ^ f_count }
        end
    end,
    defeat = function(self)
        G.GAME.heatran_boss_count = 0
        complete_quest('sonfive', 'heatran')
    end
}

return {name = "Heatran Boss Blind",
        list = {heatran_boss}
}