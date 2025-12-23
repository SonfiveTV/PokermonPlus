local heatran_boss={
    key = "heatran_boss",
    dollars = 10,
    mult = 10,
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
        if (#G.jokers.cards + G.GAME.joker_buffer) < G.jokers.config.card_limit then
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                G.GAME.joker_buffer = 0
                play_sound('timpani')
                local _card = SMODS.create_card{
                    set = "Joker",
                    area = G.jokers,
                    key = "j_sonfive_heatran",
                    no_edition = true
                }
                _card:add_to_deck()
                G.jokers:emplace(_card)
                return true end }))
            delay(0.6)
        end
        G.GAME.heatran_quest_complete = true
        G.GAME.quest_active = false
    end
}

return {name = "Heatran Boss Blind",
        list = {heatran_boss}
}