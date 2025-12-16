local cetoddle = {
    name = "cetoddle",
    config = {extra = {Xmult_mod = 0.25, Xmult = 1}},
    loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
		return {vars = {card.ability.extra.Xmult_mod, card.ability.extra.Xmult}}
    end,
    designer = "Sonfive",
    rarity = 2,
    cost = 6,
    enhancement_gate = 'm_glass',
    item_req = "icestone",
    stage = "Basic",
    ptype = "Water",
    gen = 9,
    custom_art = true,
    blueprint_compat = true,
    perishable_compat = false,
    calculate = function(self, card, context)
        if context.remove_playing_cards and not context.blueprint then
            local glass_cards = 0
            for _, removed_card in ipairs(context.removed) do
                if removed_card.shattered then glass_cards = glass_cards + 1 end
            end
            if glass_cards > 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                card.ability.extra.Xmult = card.ability.extra.Xmult +
                                    card.ability.extra.Xmult_mod * glass_cards
                                return true
                            end
                        }))
                        SMODS.calculate_effect(
                            {
                                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult +
                                card.ability.extra.Xmult_mod * glass_cards } }
                            }, card)
                        return true
                    end
                }))
                return nil, true -- This is for Joker retrigger purposes
            end
        end
        if context.using_consumeable and not context.blueprint and context.consumeable.config.center.key == 'c_hanged_man' then
            -- Glass Joker updates on Hanged Man and no other destroy consumable
            local glass_cards = 0
            for _, removed_card in ipairs(G.hand.highlighted) do
                if SMODS.has_enhancement(removed_card, 'm_glass') then glass_cards = glass_cards + 1 end
            end
            if glass_cards > 0 then
                card.ability.extra.Xmult = card.ability.extra.Xmult +
                    card.ability.extra.Xmult_mod * glass_cards
                return {
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } }
                }
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.Xmult
            }
        end
        return item_evo(self, card, context, "j_sonfive_cetitan")
    end,
}

local cetitan = {
    name = "cetitan",
    config = {extra = {Xmult_mod = 0.5, Xmult = 1}, evo_rqmt = 3},
    loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
		return {vars = {card.ability.extra.Xmult_mod, card.ability.extra.Xmult}}
    end,
    designer = "Sonfive",
    rarity = "poke_safari",
    cost = 8,
    enhancement_gate = 'm_glass',
    stage = "One",
    ptype = "Water",
    gen = 9,
    blueprint_compat = true,
    perishable_compat = false,
    calculate = function(self, card, context)
        if context.remove_playing_cards and not context.blueprint then
            local glass_cards = 0
            for _, removed_card in ipairs(context.removed) do
                if removed_card.shattered then glass_cards = glass_cards + 1 end
            end
            if glass_cards > 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                card.ability.extra.Xmult = card.ability.extra.Xmult +
                                    card.ability.extra.Xmult_mod * glass_cards
                                return true
                            end
                        }))
                        SMODS.calculate_effect(
                            {
                                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult +
                                card.ability.extra.Xmult_mod * glass_cards } }
                            }, card)
                        return true
                    end
                }))
                return nil, true -- This is for Joker retrigger purposes
            end
        end
        if context.using_consumeable and not context.blueprint and context.consumeable.config.center.key == 'c_hanged_man' then
            -- Glass Joker updates on Hanged Man and no other destroy consumable
            local glass_cards = 0
            for _, removed_card in ipairs(G.hand.highlighted) do
                if SMODS.has_enhancement(removed_card, 'm_glass') then glass_cards = glass_cards + 1 end
            end
            if glass_cards > 0 then
                card.ability.extra.Xmult = card.ability.extra.Xmult +
                    card.ability.extra.Xmult_mod * glass_cards
                return {
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } }
                }
            end
        end

        if context.joker_main then
            if hail() then
                return {
                    xmult = (card.ability.extra.Xmult * 2)
                }
            else
                return {
                    xmult = card.ability.extra.Xmult
                }
            end
        end
    end,
}


local list = {cetoddle, cetitan}

return {name = "Cetoddle", 
list = list
}