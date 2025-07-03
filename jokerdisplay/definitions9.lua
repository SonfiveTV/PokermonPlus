local jd_def = JokerDisplay.Definitions

jd_def["j_sonfive_shedinja"] = {
    text = {
        { text = "+$",                              colour = G.C.GOLD },
        { ref_table = "card.ability.extra",        ref_value = "money", colour = G.C.GOLD },
    },
    reminder_text = {
            {text = "["},
            { ref_table = "card.joker_display_values", ref_value = "nature1",},
            { text = ", " },
            { ref_table = "card.joker_display_values", ref_value = "nature2",},
            { text = ", "},
            { ref_table = "card.joker_display_values", ref_value = "nature3",},
            {text = "]"},
    },
    calc_function = function(card)
        card.joker_display_values.nature1 = localize(card.ability.extra.targets[1].value, 'ranks')
        card.joker_display_values.nature2 = localize(card.ability.extra.targets[2].value, 'ranks')
        card.joker_display_values.nature3 = localize(card.ability.extra.targets[3].value, 'ranks')
    end
}


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