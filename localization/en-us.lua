return {
    descriptions = {

        Back = {
            b_sonfive_reverencedeck = {
                name = "Reverence Deck",
                text = {
                        "All cards have ",
                        "a {C:dark_edition}Silver Seal{}"
                }
            },

            b_sonfive_virtuousdeck = {
                name = "Virtuous Deck",
                text = {
                        "Start with a {C:item,T:c_sonfive_timerball}Timer Ball{},",
                        "{C:blue}-1{} hand",
                        "every round" 
                }
            },

            b_sonfive_propheticdeck = {
                name = "Prophetic Deck",
                text = {
                        "{C:purple}+#2# {}Foresight,",
                        "{C:attention}#1# {}hand size" 

                }
            },

            b_sonfive_shinydeck = {
                name = "Shiny Deck",
                text = {
                        "{C:dark_edition}Shiny Pokemon{} are",
                        "more likely to appear" 

                }
            },

            b_sonfive_megadeck = {
                name = "Mega Deck",
                text = {
                        "Start with a {C:dark_edition,T:c_poke_megastone}Mega Stone{}",
                        "{X:gray,C:attention}+4{} Ante win requirement"

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

            j_sonfive_duskull = {
                name = "Dark Cave",
                text = {
                        "{C:green}#1# in #2#{} chance to create an",
                        "{C:green}Uncommon{} Pokemon {C:attention}Joker{}",
                        "at end of round",
                        "{br:2}text needs to be here to work",
                        "Guaranteed if you have",
                        "a {X:lightning, C:black}Lightning{} Joker",
                },
            },

            j_sonfive_dusclops = {
                name = "Dark Cave",
                text = {
                        "{C:green}#1# in #2#{} chance to create an",
                        "{C:green}Uncommon{} Pokemon {C:attention}Joker{}",
                        "at end of round",
                        "{br:2}text needs to be here to work",
                        "Guaranteed if you have",
                        "a {X:lightning, C:black}Lightning{} Joker",
                },
            },


            j_sonfive_dusknoir = {
                name = "Garganacl",
                text = {
                        "At the end of shop, remove {C:dark_edition}Negative{}",
                        "from all Jokers and multiply this",
                        "Joker's {X:red,C:white}X{} Mult by {X:red,C:white}X2{} for each",
                        "edition removed",
                        "{br:4}text needs to be here to work",
                        "This Joker can't be debuffed",
                        "{C:inactive}(Currently {}{X:red,C:white}X1{}{C:inactive} Mult){}",
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
                        "{C:green}Uncommon Pokemon{} after {C:attention}5{} rounds",
                        "{C:red}Rare Pokemon{} after {C:attention}10{} rounds",
                        "{C:legendary,E:1}Legendary Pokemon{} after {C:attention}20{} rounds"
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
                text = {
                        "All cards have ",
                        "a {C:dark_edition}Silver Seal{}"
                },
            },

            sleeve_sonfive_reverencesleeve_alt = {
                name = "Reverence Sleeve",
                text = {
                        "{C:attention}+1{} consumable slot"
                },
            },

            sleeve_sonfive_virtuoussleeve = {
                name = "Virtuous Sleeve",
                text = {
                        "Start with a {C:item,T:c_sonfive_timerball}Timer Ball{},",
                        "{C:blue}-1{} hand",
                        "every round" 
                }
            },

            sleeve_sonfive_virtuoussleeve_alt = {
                name = "Virtuous Sleeve",
                text = {
                        "Start run with the",
                        "{C:tarot,T:v_hieroglyph}Hieroglyph{} voucher"
                },
            },
            sleeve_sonfive_propheticsleeve = {
                name = "Prophetic Sleeve",
                text = {
                        "{C:purple}+#2# {}Foresight,",
                        "{C:attention}#1# {}hand size" 
                },
            },

            sleeve_sonfive_propheticsleeve_alt = {
                name = "Prophetic Sleeve",
                text = {
                        "{C:purple}+3 {}Foresight"
                },
            },

            

            sleeve_sonfive_shinysleeve = {
                name = "Shiny Sleeve",
                text = {
                        "{C:dark_edition}Shiny Pokemon{} are",
                        "more likely to appear" 
                },
            },

            

            sleeve_sonfive_shinysleeve_alt = {
                name = "Shiny Sleeve",
                text = {
                        "{C:dark_edition}Shiny Pokemon{} are",
                        "even more likely to appear" 
                },
            },

            

            sleeve_sonfive_megasleeve = {
                name = "Mega Sleeve",
                text = {
                        "Start with a {C:dark_edition,T:c_poke_megastone}Mega Stone{}",
                        "{X:gray,C:attention}+4{} Ante win requirement"

                }
            },



        }
    }
}
