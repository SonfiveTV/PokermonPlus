local jd_def = JokerDisplay.Definitions

jd_def["j_sonfive_nincada"] = {
    text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult", colour = G.C.MULT },
        { text = " or " },
        { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult", colour = G.C.CHIPS },
    },
}

jd_def["j_sonfive_ninjask"] = {
    text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult", colour = G.C.MULT },
        { text = " & " },
        { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult", colour = G.C.CHIPS },
    },
}

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

jd_def["j_sonfive_helioptile"] = {
  text = {
    { text = "Min: ", colour = G.C.GREY },
    { text = "+$", colour = G.C.GOLD },
    { ref_table = "card.joker_display_values", ref_value = "money", colour = G.C.GOLD },
    { text = " Max: ", colour = G.C.GREY },
    { text = "+$", colour = G.C.GOLD },
    { ref_table = "card.joker_display_values", ref_value = "money2", colour = G.C.GOLD }
  },
  reminder_text = {
    { text = "(" },
    { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = lighten(G.C.SUITS["Hearts"], 0.35) },
    { text = ")" }
  },
  extra = {
    {
      { text = "(", colour = G.C.GREEN, scale = 0.3 },
      { ref_table = "card.joker_display_values", ref_value = "odds", colour = G.C.GREEN, scale = 0.3 },
      { text = ")", colour = G.C.GREEN, scale = 0.3 },
    },
  },
  calc_function = function(card)
    local count = 0
    if G.play then
      local text, _, scoring_hand = JokerDisplay.evaluate_hand()
      if text ~= 'Unknown' then
        for _, scoring_card in pairs(scoring_hand) do
          if scoring_card:is_suit("Hearts") then
            count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
          end
        end
      end
    end
    card.joker_display_values.money = count * card.ability.extra.money_mod
    card.joker_display_values.money2 = count * card.ability.extra.money_mod * 2
    card.joker_display_values.localized_text = localize("Hearts", 'suits_plural')
    local num, dem = SMODS.get_probability_vars(card, card.ability.extra.numerator, card.ability.extra.denominator, 'helioptile')
    card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { num, dem } }
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

jd_def["j_sonfive_duraludon"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" },
            },
        },
    },
    calc_function = function(card)
        card.joker_display_values.x_mult = ((card.ability.extra.current_hand == "odd") and card.ability.extra.Xmult) or 1
    end
    
}

jd_def["j_sonfive_archaludon"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" },
            },
        },
    },
    calc_function = function(card)
        card.joker_display_values.x_mult = ((card.ability.extra.current_hand == "even") and card.ability.extra.Xmult) or 1
    end
    
}

jd_def["j_sonfive_nacli"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "Xmult", retrigger_type = "exp" },
            },
        },
    },
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

jd_def["j_sonfive_cetoddle"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "Xmult", retrigger_type = "exp" },
            },
        },
    },
}

jd_def["j_sonfive_cetitan"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" },
            },
        },
    },
  calc_function = function(card)
        local playing_hand = next(G.play.cards)
        local count = 0
        local glass_count = 0
        local double = false
        for _, playing_card in ipairs(G.hand.cards) do
            if playing_hand or not playing_card.highlighted then
                if playing_card then
                    count = count + 1
                    if playing_card and playing_card.ability and playing_card.ability.effect and playing_card.ability.effect == "Glass Card" then
                        glass_count = glass_count + 1
                    end
                end
            end
        end
        if glass_count == count then 
            double = true
        else
            double = false
        end
        card.joker_display_values.x_mult = (double and (card.ability.extra.Xmult * 2)) or card.ability.extra.Xmult
    end
}
