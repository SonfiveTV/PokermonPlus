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

            b_sonfive_voiddeck = {
                name = "Void Deck",
                text = {
                        "{C:dark_edition}Negative{} {C:pink}Energy{} doesn't",
                        "count towards {C:pink}Energy{} Limit,",
                        "gain a {C:spectral,T:c_poke_nightmare}Nightmare{} card after",
                        "defeating each {C:attention}Boss Blind"
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
                name = "Duskull",
                text = {
                        "{C:spectral}Spectral{} cards may appear in the shop",
                        "{br:4}text needs to be here to work",
                        "Gains {C:mult}+#2#{} Mult per {C:spectral}Spectral{} card",
                        "used this run",
                        "{C:inactive}(Evolves at {C:mult}+#1#{}{C:inactive} / +15){}"

                },
            },

            j_sonfive_vullaby = {
                name = "Vullaby",
                text = {
                        "{C:mult}+#1#{}"

                },
            },

            j_sonfive_mandibuzz = {
                name = "Mandibuzz",
                text = {
                        "{C:spectral}Spectral{} cards may appear in the shop",
                        "{br:4}text needs to be here to work",
                        "Gains {C:mult}+#2#{} Mult per {C:spectral}Spectral{} card",
                        "used this run",
                        "{C:inactive}(Evolves at {C:mult}+#1#{}{C:inactive} / +15){}"

                },
            },

            j_sonfive_dusclops = {
                name = "Dusclops",
                text = {
                        "{C:spectral}Spectral{} cards may appear in the shop",
                        "{br:4}text needs to be here to work",
                        "Gains {C:mult}+#2#{} Mult per {C:spectral}Spectral{} card",
                        "used this run",
                        "{C:inactive}(Currently {C:mult}+#1#{}{C:inactive} Mult){}",
                        "{C:inactive,s:0.8}(Evolves with a {C:attention,s:0.8}Linking Cord{C:inactive,s:0.8})"
                },
            },


            j_sonfive_dusknoir = {
                name = "Dusknoir",
                text = {
                        "{C:spectral}Spectral{} cards may appear in the shop",
                        "{br:4}text needs to be here to work",
                        "Gains {X:red,C:white}X#2#{} Mult per {C:spectral}Spectral{} card",
                        "used this run",
                        "{C:inactive}(Currently {}{X:red,C:white}X#1#{}{C:inactive} Mult){}",
                },
            },

            j_sonfive_nincada = {
                name = 'Nincada',
                text = {
                    "{C:chips}+#1#{} Chips or {C:mult}+#2#{} Mult",
                    "{C:inactive,s:0.8}(Evolves after {C:attention,s:0.8}#3#{C:inactive,s:0.8} rounds)"                    
                } 
            },

            j_sonfive_ninjask = {
                name = 'Ninjask',
                text = {
                    "{C:chips}+#1#{} Chips",
                    "{C:mult}+#2#{} Mult",   
                    "{br:4}text needs to be here to work",
                    "Increases this Joker's {C:chips}Chips{}", 
                    "and {C:mult}Mult{} at end of round",
                    "{C:inactive}(#3# Speed Boosts remaining){}"

                } 
            },

            j_sonfive_shedinja = {
                name = 'Shedinja',
                text = {
                    "Earn {C:money}$#1#{} at",
                    "end of round",
                    "{br:4}seppuku",
                    "{C:attention}Weakness: {C:inactive}({C:attention}#2#, #3#, #4#{C:inactive}){}",
                    "If a {C:attention}Weakness{} card is",
                    "held in hand then",
                    "{S:1.1,C:red,E:2}self destructs{}",
                    "{C:inactive,s:0.8}(Weakness changes every round){}"                 
                } 
            },

            j_sonfive_nacli = {
                name = 'Nacli',
                text = {
                    "When {C:attention}Blind{} is selected, earn {C:money}$#1#{} ",
                    "for each Joker, earn double from",
                    "{X:water,C:white}Water{} and {X:metal,C:white}Metal{} Jokers",
                    "{br:4}text needs to be here to work",
                    "This Joker can't be debuffed",
                    "{C:inactive}(Evolves after earning {}{C:money}$24{}{C:inactive}){}"
                    
                } 
            },

            j_sonfive_naclstack = {
                name = 'Naclstack',
                text = {
                    "When {C:attention}Blind{} is selected, {C:green}1 in #3#{} chance to",
                    "destroy leftmost {C:attention}Joker{} and gain {X:red,C:white}X#1#{}",
                    "{C:inactive}({C:green}1 in #4#{}{C:inactive} if target is {}{X:water,C:white}Water{}{C:inactive} or {}{X:metal,C:white}Metal{}{C:inactive}){}",
                    "{br:4}text needs to be here to work",
                    "This Joker can't be debuffed",
                    "{C:inactive}(Evolves at {X:red,C:white}X#2#{}{C:inactive} / {}{X:red,C:white}X2{}{C:inactive}){}"
                    
                } 
            },

            j_sonfive_garganacl = {
                name = 'Garganacl',
                text = {
                    "When {C:attention}Blind{} is selected, {C:green}#3#%{} chance",
                    "to destroy leftmost {C:attention}Joker{} and",
                    " mulitply this Joker's {X:red,C:white}X{} Mult by {X:red,C:white}X#1#{}",
                    "{C:inactive}({C:green}#4#%{}{C:inactive} if target is {}{X:water,C:white}Water{}{C:inactive} or {}{X:metal,C:white}Metal{}{C:inactive}){}",
                    "{br:4}text needs to be here to work",
                    "This Joker can't be debuffed",
                    "{C:inactive}(Currently {}{X:red,C:white}X#2#{}{C:inactive} Mult){}"
                    
                } 
            },
            j_sonfive_meltan = {
                name = 'Meltan',
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "{C:green}#3#%{} chance to create a",
                    "{C:dark_edition}Negative{} {C:attention}Metal Coat{}",
                    "{C:inactive,s:0.8}(Odds decrease with each held Metal Coat){}",
                    "{C:inactive,s:0.8}(Evolves when Energized){}"
                    
                } 
            },
            j_sonfive_melmetal = {
                name = 'Melmetal',
                text = {
                    "{C:attention}Steel{} cards held in hand",
                    "gain {X:red,C:white}X#1#{} Mult when held",
                    "for each {C:attention}Metal Coat{} you have",
                    "{C:inactive}(Currently {}{X:red,C:white}X#2#{}{C:inactive} Mult){}",
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


            sonfive_rocket = {
                name = "sonfive Rocket",
                text = {
                        "{X:mult,C:white}X2{} Mult, {C:red}-1{} Joker slot"
                    },
            },

                sonfive_ex = {
                name = "EX",
                text = {
                        "Starts fully {C:pink}Energized{}",
                        "{br:4}exexexexexe",
                        "When {C:attention}Blind{} is selected,",
                        "{C:pink}-1{} Energy",
                        "{br:4}exexexexexe",
                        "Debuffs if {C:pink}0{} Energy"
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
            sleeve_sonfive_voidsleeve = {
                name = "Void Sleeve",
                text = {
                        "Start with a {C:dark_edition,T:c_poke_megastone}Mega Stone{}",
                        "{X:gray,C:attention}+4{} Ante win requirement"

                }
            },
            sleeve_sonfive_voidsleeve_alt = {
                name = "Void Sleeve Alt",
                text = {
                        "Start with a {C:dark_edition,T:c_poke_megastone}Mega Stone{}",
                        "{X:gray,C:attention}+4{} Ante win requirement"

                }
            },
        },
        Spectral = {
            c_sonfive_bottlecap = {
                name = "Bottle Cap",
                text = {
                  "Permanently increases the",
                  "{C:mult}Mult{}, {C:chips}Chips{}, {C:money}${} and {X:mult,C:white}X{} Mult",
                  "values of the leftmost", 
                  "or selected {C:attention}Joker{}"
                }
            },

            
        

        },
        Stake={
            stake_sonfive_rocket_stake = {
            name = "Rocket Stake",
            text = {"Shop can have sonfive Rocket Jokers",
                    "{C:inactive,s:0.8}({}{X:mult,C:white,s:0.8}X2{} {C:inactive,s:0.8}Mult, {}{C:red,s:0.8}-1{}{C:inactive,s:0.8} Joker slot){}",
                    "{s:0.8}Applies all previous Stakes"
                },
            },

            stake_sonfive_ex_stake = {
            name = "EX Stake",
            text = {"Shop can have {C:attention}EX{} Jokers",
                    "{C:inactive,s:0.8}(Starts fully {C:pink,s:0.8}Energized{}{C:inactive,s:0.8}...){}",

                    "{s:0.8}Applies all previous Stakes"
                },
            },
    },
            Tag={},
        Tarot={},
        Voucher={},
},

        misc = {
            challenge_names = {
            c_sonfive_salt_cured = "Salt Cured",
            c_sonfive_balls_of_steel = "Balls of Steel",
            c_sonfive_wonder_guard = "Guard the Wonder",
            },
            dictionary = {
                sonfive_saltcure_ex = "Salt Cure!",
            },
            v_text = {
           ch_c_sonfive_wonderguard = {"If {C:attention}Shedinja{} {S:1.1,C:red,E:2}self destructs{}, you {C:attention}lose{}"},
            },

            labels={
                sonfive_rocket = "Team Rocket",
                sonfive_ex = "EX"
            },















        }       
    }

