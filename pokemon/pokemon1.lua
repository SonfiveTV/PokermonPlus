local shuckle = {
    name = "shuckle",
    poke_custom_prefix = "sonfive",
    pos = {x =  1,  y = 6},
    config = {},
    loc_vars =  function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.c_sonfive_berryjuice
        info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"Sonfive"}}
        return
    end,
    rarity = 2,
    cost = 4,
    ptype = "Grass",
    stage = "Basic",
    atlas = "pokedex_2",
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.setting_blind then
            if not from_debuff and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                local _card = create_card('Item', G.consumeables, nil, nil, nil, nil, 'c_sonfive_berryjuice')
                _card:add_to_deck()
                G.consumeables:emplace(_card)
                card_eval_status_text(_card, 'extra', nil, nil, nil, {message = localize('poke_plus_pokeitem'), colour = G.C.FILTER})
                return true
            end
        end
    end,
}

local shinx = {
    name = 'shinx',
    poke_custom_prefix = "sonfive",
    pos = {x = 0, y = 0},
    vars = {{odds = 4}, {xmult = 2}, {card_list = {}}},
    loc_vars = function(self, info_queue, card)
        local vars
        if G.GAME and G.GAME.probabilities.normal then
            vars = {G.GAME.probabilities.normal, card.ability.extra.odds, card.ability.extra.xmult}
        else
            vars = {1, card.ability.extra.odds, card.ability.extra.xmult}
        end
        return {vars = vars}
    end,
    ptype = "Lightning",
    stage = "Basic",
    atlas = "pokedex_2",
    rarity = 2, 
    cost = 5,
    blueprint_compat = true, 
    calculate = function(self, card, context)
        if context.stay_flipped and not context.blueprint then
            big_juice(card)
        end
        if context.play_cards then
            card.ability.extra.card_list = {}
            for i = 1, #G.hand.highlighted do
                if G.hand.highlighted[i].facing == 'back' then
                    table.insert(card.ability.extra.card_list, G.hand.highlighted[i])
                end
            end
        end
        if context.individual and context.cardarea == G.play and context.other_card then
            local condition = false
            for i = 1, #card.ability.extra.card_list do
                local flipped_card = card.ability.extra.card_list[i]
                if context.other_card == flipped_card then
                    condition = true
                    break
                end
            end
            if condition then return {
                x_mult = card.ability.extra.xmult,
                card = card
            }
            end
        end
    end,
}




list = {shuckle,}

return {name = "PokermonPlus1", 
list = list
}