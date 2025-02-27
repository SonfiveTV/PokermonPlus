return {
    descriptions = {

        Back = {
            b_sonfive_reverencedeck = {
                name = "Reverence Deck",
                text={
                    "All cards have ",
                    "a {C:dark_edition}Silver Seal{}"
                }
            },

            b_sonfive_virtuousdeck = {
                name = "Virtuous Deck",
                text={
                    "Start run with a {C:tarot,T:c_sonfive_timerball}Timer Ball{}",
                    "Start with {C:money}$0{}",
                    "{C:red}-1{} hands" 
                }
            },



        },

        Joker = {
            j_sonfive_shuckle = {
                name = "Shuckle",
                text = {
                    "When blind is selected",
                    "create a {C:attention}Berry Juice{} card",
                    "{C:inactive}(Must have room)"
                },
            },

            j_sonfive_darkcave = {
                name = "Dark Cave",
                text = {
                    "1 in 2 chance to gain Uncommon Joker",
                    "when Blind is defeated",
                    "{C:inactive}(Must have room)"
                },
            },


        },

        Item = {
            c_sonfive_timerball = {
                name = "Timer Ball",
                text = {
                    "Create a random {V:1}#1#{C:attention} Pokemon{}",
                    "Rarity increases in {C:attention}#2#{} rounds!",
                    "{C:inactive}(Must have room)"
                },
            },
        

            c_sonfive_timerball_max = {
                name = "Timer Ball",
                text = {
                    "Create a random {V:1}#1#{C:attention} Pokemon{}",
                    "{C:inactive}(Must have room)"
                },
            },

            c_sonfive_timerball_start = {
                name = "Timer Ball",
                text = {
                    "Can create a random ",
                    "{V:1}#1#{C:attention} Pokemon{} in {C:attention}#2#{} rounds!",
                    "{C:inactive}(Must have room)"
                },
            },

            c_sonfive_timerball_deck = {
                name = "Timer Ball",
                text = {
                    "Can create a random ",
                    "{V:1}#1#{C:attention} Pokemon{} in {C:attention}2{} rounds!",
                    "{C:inactive}(Must have room)"
                },
            },

            c_sonfive_berryjuice = {
                name = "Berry Juice",
                text = {
                    "Remove debuff from a",
                    "selected {C:attention}Joker{}",
                    "and reverse the",
                    "Perishable count by {C:attention}1{}"
                },
            },
        },

        Other = {

            timer = {
                name = "Timer Ball",
                text = {
                    "{C:blue}Common Pokemon{} after {C:attention}2{} rounds",
                    "{C:green}Uncommon Pokemon{} after {C:attention}6{} rounds",
                    "{C:red}Rare Pokemon{} after {C:attention}12{} rounds",
                    "{C:legendary,E:1}Legendary Pokemon{} after {C:attention}21{} rounds"
                },
            },

            designed_by = {
                name = "Designed By",
                text = {
                    "{C:dark_edition}#1#{}"
                },
            },
        },

        Sleeve = {

            sleeve_sonfive_reverencesleeve = {
                name = "Reverence Sleeve",
                text = {"All cards have ",
                        "a {C:dark_edition}Silver Seal{}"
                },
            },

            sleeve_sonfive_virtuoussleeve = {
                name = "Virtuous Sleeve",
                text = {
                    "Start run with a {C:tarot,T:c_sonfive_timerball}Timer Ball{}",
                    "Start with {C:money}$0{}",
                    "{C:red}-1{} hands" 
                }
            },

            sleeve_sonfive_virtuoussleeve_alt = {
                name = "Virtuous Sleeve",
                text = {
                        "Start run with the",
                        "{C:tarot,T:v_hieroglyph}Hieroglyph{} voucher"
                },
            },



        }
    }
}
