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

            b_sonfive_roguedeck = {
                name = "Rogue Deck",
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
                        "{C:dark_edition}Negative{} {C:pink}Energy{} cards",
                        "give {C:pink}+1 Energy Limit{}",
                        "{br:4}text",
                        "Gain a {C:spectral,T:c_poke_nightmare}Nightmare{} Card after",
                        "defeating each {C:attention}Boss Blind"
                }
            },


        },
        Blind = {
            bl_sonfive_memento = {
                name = "Magenta Memento",
                text = {
                    "All Jokers lose 1",
                    "Energy per hand played",
                }, 
            },
        },

        Joker = {
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
                    "and {C:mult}Mult{} when {C:attention}Boss Blind{} is defeated",
                    "{C:inactive}(#3# Speed Boosts remaining){}"

                } 
            },
            j_sonfive_shedinja = {
                name = 'Shedinja',
                text = {
                    "Every {C:attention}unique{} rank {C:attention}held in hand{}",
                    "earns {C:money}$#1#{} at end of round",
                    -- "{C:inactive,s:0.8}(Gains Negative after earning {C:money,s:0.8}$#2#{}{C:inactive,s:0.8}/$#3#){}"  ,
                    "{br:4}seppuku",
                    "If a {C:attention}#4#, #5#,{} or {C:attention}#6#{} is",
                    "held in hand then",
                    "{S:1.1,C:red,E:2}self destructs{}",
                    "{C:inactive,s:0.8}(Rank changes every round){}"
                                  
                } 
            },
            j_sonfive_croagunk = {
                name = 'Croagunk',
                text = {
                    "If discard contains {C:attention}5{} {C:purple}Purple Seal{} cards",
                    "increase this Joker's retriggers by {C:attention}1{}",
                    "{br:3}ribbit",
                    "If scoring hand contains {C:purple}Purple Seal{} cards,",
                    "retrigger them and reset this",
                    "Joker's retriggers to {C:attention}0{}",
                    "{C:inactive,s:0.8}(#1# Retrigger(s) divided evenly between scoring cards){}",
                    "{C:inactive,s:0.8}(Evolves at {C:attention,s:0.8}#1#{}{C:inactive,s:0.8}/5 retriggers){}"
                }
            },
            j_sonfive_toxicroak = {
                name = 'Toxicroak',
                text = {
                    "Played {C:purple}Purple Seal{} cards retrigger",
                    "for each time the last played {C:purple}Tarot{}",
                    "card has been used consecutively",
                    "{C:inactive,s:0.8}(Resets at end of Ante if no Tarot cards were used){}",
                    "{br:3}ribbit",
                    "{C:inactive}(Previous Tarot: {C:purple}#2#{}{C:inactive}){}",
                    "{C:inactive}(Currently {C:attention}#1#{}{C:inactive} retriggers){}"
                }
            },
            j_sonfive_darkrai = {
                name = 'Darkrai',
                text = {
                    "Create a {C:spectral,T:c_poke_nightmare}Nightmare{} Card after",
                    "defeating each {C:attention}Boss Blind",
                    "{br:4}text",
                    "{C:attention}Held{} {C:pink}Energy{} cards are {C:attention}applied{}",
                    "to all Jokers with the same {C:pink}Type{}", 
                    "{C:inactive}(Doesn't increment Energy count){}"                                
                } 
            },
            j_sonfive_vullaby = {
                name = 'Vullaby',
                text = {
                    "Scoring cards in first played",
                    "hand are permanently {C:attention}debuffed{}",
                    "Gains {C:chips}+#2#{} Chips for each card debuffed",
                    "{C:inactive}(Currently {C:chips}+#1#{}{C:inactive} Chips){}",
                    "{C:inactive,s:0.8}(Evolves after playing 5 debuffed cards in scoring hand){}"

                } 
            },
            j_sonfive_mandibuzz = {
                name = 'Mandibuzz',
                text = {
                    "Gains {C:chips}+#2#{} Chips for each",
                    "{C:attention}debuffed{} card in scoring hand",
                    "{C:inactive}(Currently {C:chips}+#1#{}{C:inactive} Chips){}",
                    "{br:4}text",
                    "Earn {C:money}$#3#{} for every {C:attention}4{}",
                    "{C:attention}debuffed{} cards in the deck",
                    "{C:inactive}(Currently {C:money}$#4#{}{C:inactive}){}",                                
                } 
            },

            j_sonfive_meltan = {
                name = 'Meltan',
                text = {
                    "{C:attention}Holding {C:dark_edition}Negative {C:item}Metal Coat{}",
                    "Retrigger each {C:attention}Steel{} card",
                    "held in hand {C:attention}#3#{} time",
                    "{C:inactive,s:0.8}(Evolves after scoring #1#/#2# Steel cards){}"
                } 
            },
            j_sonfive_melmetal = {
                name = 'Melmetal',
                text = {
                    "Retrigger each {C:attention}Steel{} card",
                    "held in hand for each",
                    "{X:metal,C:white}Metal{} card you have",
                    "{C:inactive,s:0.8}(includes Jokers and Energy cards){}",
                    "{C:inactive}(Currently #1# retriggers)"
                } 
            },

            j_sonfive_stonjourner = {
                name = "Stonjourner",
                text = {
                    "Adjacent Jokers each give {X:red,C:white}X#1#{} Mult,",
                    "gains {X:red,C:white}X#2#{} Mult after {C:inactive}[{}{C:attention}#3#{}{C:inactive}]{} {C:attention}unique{} hands"
                }
            },

            j_sonfive_duraludon = {
                name = "Duraludon",
                text = {
                    "{X:red,C:white}X#1#{} Mult on each {C:attention}odd{} hand played",
                    "{C:inactive,s:0.8}(Evolves with a {C:metal,s:0.8}Metal{C:inactive,s:0.8} sticker)"
                }
            },


            j_sonfive_archaludon = {
                name = "Archaludon",
                text = {
                    "Gain {X:red,C:white}X#1#{} Mult for each {X:lightning,C:black}Lightning{} Joker",
                    "you have on each {C:attention}odd{} hand played",
                    "{C:inactive}(Resets at end of round){}",
                    "{br:3}brrrr",
                    "{X:red,C:white}X#2#{} Mult on each {C:attention}even{} hand played"
                }
            },

            j_sonfive_lechonk = {
                name = "Lechonk",
                text = {
                    "{C:attention}Volatile Right{}",
                    "{br:3}text",
                    "When {C:attention}Blind{} is selected",
                    "increase {C:attention}sell value{} by {C:attention}#1#%{} of",
                    "the amount of money you have",
                    "{C:red}Reduce{} money to {C:money}$#2#{}",
                    "{C:inactive}(Evolves after triggering {C:attention}#3#{} {C:inactive}times){}"
                }
            },

            j_sonfive_oinkologne = {
                name = "Oinkologne",
                text = {
                    "{C:attention}Volatile Right{}",
                    "{br:3}text",
                    "When {C:attention}Blind{} is selected",
                    "increase {C:attention}sell value{} by {C:attention}#1#%{} of",
                    "the amount of money you have",
                    "{C:red}Reduce{} money to {C:money}$#2#{}"
                }
            },

            j_sonfive_nacli = {
                name = 'Nacli',
                text = {
                    "When {C:attention}Blind{} is selected, {C:green}#3# in #4#{} chance to",
                    "destroy rightmost {C:attention}Joker{} and gain {X:red,C:white}X#1#{}",
                    "{C:inactive}(Guaranteed if target is {}{X:water,C:white}Water{}{C:inactive} or {}{X:metal,C:white}Metal{}{C:inactive}){}",
                    "{br:4}text needs to be here to work",
                    "This Joker can't be debuffed",
                    "{C:inactive}(Evolves at {X:red,C:white}X#2#{}{C:inactive} / {}{X:red,C:white}X2{}{C:inactive}){}"                 
                } 
            },
            j_sonfive_naclstack = {
                name = 'Naclstack',
                text = {
                    "When {C:attention}Blind{} is selected, {C:green}#3# in #4#{} chance to",
                    "destroy rightmost {C:attention}Joker{} and gain {X:red,C:white}X#1#{}",
                    "{C:inactive}({C:green}#3# in #5#{}{C:inactive} if target is {}{X:water,C:white}Water{}{C:inactive} or {}{X:metal,C:white}Metal{}{C:inactive}){}",
                    "{br:4}text needs to be here to work",
                    "This Joker can't be debuffed",
                    "{C:inactive}(Evolves at {X:red,C:white}X#2#{}{C:inactive} / {}{X:red,C:white}X4{}{C:inactive}){}"
                } 
            },
            j_sonfive_garganacl = {
                name = 'Garganacl',
                text = {
                    "When {C:attention}Blind{} is selected, {C:green}#3# in #4#{} chance",
                    "to destroy rightmost {C:attention}Joker{} and",
                    "mulitply this Joker's {X:red,C:white}X{} Mult by {X:red,C:white}X#1#{}",
                    "{C:inactive}({C:green}#3# in #5#{}{C:inactive} if target is {}{X:water,C:white}Water{}{C:inactive} or {}{X:metal,C:white}Metal{}{C:inactive}){}",
                    "{br:4}text needs to be here to work",
                    "This Joker can't be debuffed",
                    "{C:inactive}(Currently {}{X:red,C:white}X#2#{}{C:inactive} Mult){}"
                } 
            },

            j_sonfive_cetoddle = {
                name = 'Cetoddle',
                text = {
                    "Gains {X:red,C:white}X#1#{} Mult for every",
                    "{C:attention}Glass Card{} that is destroyed",
                    "{C:inactive}(Currently {}{X:red,C:white}X#2#{}{C:inactive} Mult){}",
                    "{C:inactive,s:0.8}(Evolves with an {C:attention,s:0.8}Ice Stone{C:inactive,s:0.8})"
                } 
            },
            j_sonfive_cetitan = {
                name = 'Cetitan',
                text = {
                    "Gains {X:red,C:white}X#1#{} Mult for every",
                    "{C:attention}Glass Card{} that is destroyed",
                    "{br:4}text needs to be here to work",
                    "Scores double if every card",
                    "held in hand is {C:attention}Glass{}",
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

            ston_hands1 = {
                name = "Played Hands",
                text = {
                        "#1#",
                },
            },

            ston_hands2 = {
                name = "Played Hands",
                text = {
                        "#1#",
                        "#2#",
                },
            },

            ston_hands3 = {
                name = "Played Hands",
                text = {
                        "#1#",
                        "#2#",
                        "#3#",
                },
            },

            ston_hands4 = {
                name = "Played Hands",
                text = {
                        "#1#",
                        "#2#",
                        "#3#",
                        "#4#",
                },
            },

            ston_hands5 = {
                name = "Played Hands",
                text = {
                        "#1#",
                        "#2#",
                        "#3#",
                        "#4#",
                        "#5#",
                },
            },

            ston_hands6 = {
                name = "Played Hands",
                text = {
                        "#1#",
                        "#2#",
                        "#3#",
                        "#4#",
                        "#5#",
                        "#6#",
                },
            },

            ston_hands7 = {
                name = "Played Hands",
                text = {
                        "#1#",
                        "#2#",
                        "#3#",
                        "#4#",
                        "#5#",
                        "#6#",
                        "#7#",
                },
            },

            ston_hands8 = {
                name = "Played Hands",
                text = {
                        "#1#",
                        "#2#",
                        "#3#",
                        "#4#",
                        "#5#",
                        "#6#",
                        "#7#",
                        "#8#",
                },
            },

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


            sonfive_weakened = {
                name = "Weakened",
                text = {
                        "Base values",
                        "are {C:attention}de-energized{}"
                    },
            },

                sonfive_lilac_stake_sticker = {
                name = "Lilac Sticker",
                text = {
                        "Used this Joker",
                        "to win on {C:attention}Lilac",
                        "{C:attention}Stake{} difficulty"
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
            sleeve_sonfive_roguesleeve = {
                name = "Rogue Sleeve",
                text = {
                        "Start with a {C:dark_edition,T:c_poke_megastone}Mega Stone{}",
                        "{X:gray,C:attention}+4{} Ante win requirement"

                }
            },
            sleeve_sonfive_voidsleeve = {
                name = "Void Sleeve",
                text = {
                        "{C:dark_edition}Negative{} {C:pink}Energy{} cards",
                        "give {C:pink}+1 Energy Limit{}",
                        "{br:4}text",
                        "Gain a {C:spectral,T:c_poke_nightmare}Nightmare{} Card after",
                        "defeating each {C:attention}Boss Blind"
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
            stake_sonfive_lilac_stake = {
            name = "Lilac Stake",
            text = {"Shop can have {C:attention}Weakened{} Jokers",
                    "{C:inactive,s:0.8}(Base values are {C:attention,s:0.8}de-energized{}{C:inactive,s:0.8}){}",
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
            c_sonfive_balls_of_patience = "Balls of Patience",
            c_sonfive_salt_cured = "Salt Cured",
            c_sonfive_metallurgy = "Metallurgy",
            c_sonfive_wonder_guard = "Guard the Wonder",
            c_sonfive_croagunk_test = "Croagunk Test",
            },
            dictionary = {
                -- Joker Messages
                sonfive_saltcure_ex = "Salt Cure!",
                sonfive_speedboost = "Speed Boost!",
                poke_deenergized_ex = "De-Energized!",

                -- Config Descriptions
                enable_timerball = "Enable Timer Ball?",
            },
            v_text = {
           ch_c_sonfive_wonderguard = {"If {C:attention}Shedinja{} {S:1.1,C:red,E:2}self destructs{}, you {C:attention}lose{}"},
            },

            labels={
                sonfive_weakened = "Weakened"
            },















        }       
    }

