local jd_def = JokerDisplay.Definitions


jd_def["j_sonfive_nacli"] = {
    text = {
        { text = "+$",                              colour = G.C.GOLD },
        { ref_table = "card.joker_display_values",        ref_value = "money", colour = G.C.GOLD },
    },
    calc_function = function(card)
        local count = 0
        if G.jokers then
            for _, joker_card in ipairs(G.jokers.cards) do
                if joker_card.config.center.rarity and is_type(joker_card, "Water") then
                    count = count + 1
                end
            end
        end
                if G.jokers then
            for _, joker_card in ipairs(G.jokers.cards) do
                if joker_card.config.center.rarity and is_type(joker_card, "Metal") then
                    count = count + 1
                end
            end
        end
        card.joker_display_values.money = card.ability.extra.money * (#G.jokers.cards + count)
    end
}

jd_def["j_sonfive_naclstack"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "Xmult", retrigger_type = "exp" },
            },
        },
    },
}

jd_def["j_sonfive_garganacl"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "Xmult", retrigger_type = "exp" },
            },
        },
    },
}