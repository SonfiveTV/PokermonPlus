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


local Jlist = {shuckle}

return {name = "PokermonPlus1", 
list = Jlist
}