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

            b_sonfive_hazardousdeck = {
                name = "Hazardous Deck",
                text = {
                        "{C:purple,T:m_poke_hazard}+#3# Hazards{}",
                        "{C:inactive}(1 per #2# cards)"

                }
            },

            b_sonfive_opportunisticdeck = {
                name = "Opportunistic Deck",
                text = {
                        "If you had {C:blue}1{} hand,",
                        "or 1 opportunity,",
                        "to seize everything", 
                        "you ever wanted,",
                        "with {C:red}8{} discards,",
                        "Would you capture it?",
                        "Or just let it slip"

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

            j_sonfive_slugma = {
                name = 'Slugma',
                text = {
                    "At start of round",
                    "add a {C:attention}Stone{} card to hand",
                    "for each adjacent {X:water,C:white}Water{C:attention} Joker",
                    "{C:inactive,s:0.8}(Evolves after creating #2#/{C:attention,s:0.8}#1# Stone{C:inactive,s:0.8} cards)"
                } 
            },

            j_sonfive_magcargo = {
                name = 'Magcargo',
                text = {
                    "{C:attention}Stone{} cards gain {C:mult}+#1#{} Mult",
                    "permanently when scored",
                    "for each {X:fire,C:white}Fire{C:attention} Joker{} you have",
                } 
            },


            


        },

        Item = {
            c_sonfive_timerball = {
                name = "Timer Ball",
                text = {
                        "Create a {V:1}#1#{C:attention} Pokemon{}",
                        "Rarity increases in {C:attention}#2#{} rounds!",
                        "{C:inactive}(Must have room)"
                },
            },
        

            c_sonfive_timerball_max = {
                name = "Timer Ball",
                text = {
                        "Creates a {V:1}#1#{C:attention} Pokemon{}",
                        "{C:inactive}(Must have room)"
                },
            },

            c_sonfive_timerball_start = {
                name = "Timer Ball",
                text = {
                        "Can create a ",
                        "{V:1}#1#{C:attention} Pokemon{} in {C:attention}1{} rounds!",
                        "{C:inactive}(Must have room)"
                },
            },

            c_sonfive_timerball_deck = {
                name = "Timer Ball",
                text = {
                        "Can create a ",
                        "{V:1}#1#{C:attention} Pokemon{} in {C:attention}1{} rounds!",
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
                        "{C:blue}Common Pokemon{} after {C:attention}1{} rounds",
                        "{C:green}Uncommon Pokemon{} after {C:attention}3{} rounds",
                        "{C:red}Rare Pokemon{} after {C:attention}7{} rounds",
                        "{C:legendary,E:1}Legendary Pokemon{} after {C:attention}15{} rounds"
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
