local jd_def = JokerDisplay.Definitions

jd_def["j_sonfive_shedinja"] = {
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

jd_def["j_sonfive_meltan"] = {
    retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
        return held_in_hand and playing_card.ability.effect == "Steel Card" and (joker_card.ability.extra.retriggers * JokerDisplay.calculate_joker_triggers(joker_card)) or 0
    end
}

jd_def["j_sonfive_melmetal"] = {
    retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
        local retriggers = #find_joker('metal_energy') + #find_pokemon_type("Metal")
        return held_in_hand and playing_card.ability.effect == "Steel Card" and (retriggers * JokerDisplay.calculate_joker_triggers(joker_card)) or 0
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