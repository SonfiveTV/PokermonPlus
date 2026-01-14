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
                        "{C:attention}-1{} Booster Pack slot available in shop",
                        "After defeating each",
                        "{C:attention}Small{} or {C:attention}Big Blind{}, gain",
                        "a {C:attention,T:tag_poke_shiny_tag}Shiny Tag"
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


            b_sonfive_pyritedeck = {
                name = "Pyrite Deck",
                text = {
                        "{C:blue}+#1#{} Joker slot, {C:blue}+#2#{} consumable slot,",
                        "{C:blue}+#3#{} shop slot, {C:blue}+#4#{} Voucher slot,",
                        "{C:blue}+#5#{} Booster Pack slot, {C:blue}+#6#{} hand,",
                        "{C:blue}+#7#{} discard, {C:blue}+#8#{} hand size",
                        "{C:red}X#9#{} base Blind size",
                        "{C:inactive}(Doubles each Ante)"
                }
            },


        },
        Blind = {
            bl_sonfive_heatran_boss = {
                name = "Molten Mountain",
                text = {
                    "X0.9 Mult for each",
                    "enhancement, edition, and",
                    "seal in played hand",
                }, 
            },
            bl_sonfive_darkrai_boss = {
                name = "Newmoon Nightmare",
                text = {
                    "Jokers are weakened and",
                    "drained of any Energy",
                }, 
            },
            bl_sonfive_meltan_boss = {
                name = "Metallic Mutiny",
                text = {
                    "Steel cards give 0.8X Mult",
                    "for every Metal Joker you have",
                }, 
            },
        },

        Joker = {
            j_sonfive_nincada = {
                name = 'Nincada',
                text = {
                    "{C:chips}+#1#{} Chips",
                    "{C:mult}+#2#{} Mult",
                    "{C:inactive,s:0.8}(Evolves after {C:attention,s:0.8}#3#{C:inactive,s:0.8} rounds)"                    
                } 
            },
            j_sonfive_ninjask = {
                name = 'Ninjask',
                text = {
                    "{C:chips}+#1#{} Chips",
                    "{C:mult}+#2#{} Mult",   
                    "{br:4}text needs to be here to work",
                    "Increases this Joker's {C:pink}Energy{} limit", 
                    "when {C:attention}Boss Blind{} is defeated",
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
            j_sonfive_helioptile = {
                name = 'Helioptile',
                text = {
                    "Played {C:hearts}#3#{} cards earn {C:money}$#1#{} when scored",
                    "{C:green}#4# in #5#{} chance to earn {C:money}$#2#{} instead",
                    "{C:inactive,s:0.8}(Evolves with a {C:attention,s:0.8}Sun Stone{C:inactive,s:0.8})",
                }
            },
            j_sonfive_heliolisk = {
                name = 'Heliolisk',
                text = {
                    "Played {C:hearts}#3#{} cards earn {C:money}$#1#{} when scored",
                    "{C:green}#4# in #5#{} chance to earn an additional {C:money}$#6#{}",
                    "for every {C:money}$100{} you have"
                }
            },
            j_sonfive_heatran = {
                name = 'Heatran',
                text = {
                    "Scored cards {C:attention}permanently{} gain",
                    "the stats of their {C:attention}modifiers{},",
                    "then remove all {C:attention}modifiers{}",
                    "{C:inactive}(Enhancements, Editions, and Seals)"
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
            j_sonfive_mega_darkrai = {
                name = 'Mega Darkrai',
                text = {
                    "Every held {C:pink}Energy{} card gives",
                    "{X:red,C:white}X#1#{} Mult for each Joker you have",
                    "of the corresponding {C:pink}Type{}", 
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
                    "held in hand {C:attention}#3#{} additional time",
                    "{C:inactive,s:0.8}(Evolves after scoring #1#/#2# Steel cards){}"
                } 
            },
            j_sonfive_melmetal = {
                name = 'Melmetal',
                text = {
                    "{C:attention}Steel{} cards held in hand",
                    "retrigger an additional time for",
                    "every {C:attention}2{} {X:metal,C:white}Metal{} cards you have",
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
                    "Gain {X:red,C:white}X#1#{} Mult plus an additional",
                    "{X:red,C:white}X#1#{} Mult for each {X:lightning,C:black}Lightning{} Joker",
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
            j_sonfive_shroodle = {
                name = 'Shroodle',
                text = {
                    "{C:attention}Nature:{} {B:1,V:4}#1#{}, {B:2,V:5}#2#{}, {B:3,V:6}#3#{}",
                    "{br:3}text",
                    "When {C:attention}Boss Blind{} is defeated",
                    "create a {C:attention}random{} tag",
                    "{C:inactive,s:0.8}(Evolves after triggering {C:attention,s:0.8}#4#{C:inactive,s:0.8} tags){}"
                } 
            },

            j_sonfive_grafaiai = {
                name = 'Grafaiai',
                text = {
                    "{C:attention}Nature:{} {B:1,V:4}#1#{}, {B:2,V:5}#2#{}, {B:3,V:6}#3#{}",
                    "Jokers with a {C:attention}Nature{} type also",
                    "count as the other {C:attention}Nature{} Types",
                    "{br:3}text",
                    "When {C:attention}Boss Blind{} is defeated, create the",
                    "last {C:attention}tag{} used during this run",
                    "{C:inactive}(Last used: #4#){}"
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
            j_sonfive_questbook = {
                name = "Quest Book",
                text = {
                    "Double-click to view Quest progress"
                }
            },
            j_sonfive_quest_heatran = {
                name = "Into The Volcano",
                text = {
                    {
                    "{V:1,s:0.8}#1#"
                    },
                    {
                    "Requirements:",
                    "{V:2,s:0.8}#2#{}",
                    "{V:5,s:0.8}#5#{}{V:6,s:0.8} #6#{}{V:7,s:0.8} #7#{}{V:8,s:0.8} #8#{}{V:9,s:0.8} #9#{}{V:10,s:0.8} #10#{}{V:11,s:0.8} #11#{}{V:12,s:0.8} #12#{}",
                    "{V:3,s:0.8}#3#{}",
                    "{V:13,s:0.8}#13#{}{V:14,s:0.8} #14#{}{V:15,s:0.8} #15#{}",
                    "{V:4,s:0.8}#4#{}",
                    "{V:16,s:0.8}#16#{}{V:17,s:0.8} #17#{}{V:18,s:0.8} #18#{}{V:19,s:0.8} #19#{}{V:20,s:0.8} #20#{}{V:21,s:0.8} #21#{}"
                    }
                }
            },
            j_sonfive_quest_heatran_active = {
                name = "Into The Volcano",
                text = {
                    "Get ready to battle {C:attention}Heatran{}!",
                    "You'll need an empty Joker slot if you",
                    "plan on catching them after the battle"
                }
            },
            j_sonfive_quest_heatran_complete = {
                name = "Into The Volcano",
                text = {
                    "You have completed this Quest already!",
                }
            },
            j_sonfive_quest_darkrai = {
                name = "The Nightmare Begins",
                text = {
                    {
                    "{V:1,s:0.8}#1#"
                    },
                    {"{s:0.8}Requirements:{}",
                    "{V:2,s:0.8}#2#",
                    "{V:3,s:0.8}#3#",
                    "{V:4,s:0.8}#4#",
                    "{V:5,s:0.8}#5#",
                    "{V:6,s:0.8}#6#",
                    "{V:7,s:0.8}#7#",
                    "{V:8,s:0.8}#8#",
                    "{V:9,s:0.8}#9#",
                    "{V:10,s:0.8}#10#",
                    "{V:11,s:0.8}#11#",
                    "{V:12,s:0.8}#12#",
                    "{V:13,s:0.8}#13#"}
                }
            },
            j_sonfive_quest_darkrai_active = {
                name = "The Nightmare Begins",
                text = {
                    "Get ready to battle {C:attention}Darkrai{}!",
                    "You'll need an empty Joker slot if you",
                    "plan on catching them after the battle"
                }
            },
            j_sonfive_quest_darkrai_complete = {
                name = "The Nightmare Begins",
                text = {
                    "You have completed this Quest already!",
                }
            },
            j_sonfive_quest_meltan = {
                name = "Superalloy Showdown",
                text = {
                    {
                    "{V:4,s:0.8}#4#"
                    },
                    {"{s:0.8}Requirements:{}",
                    "{V:1,s:0.8}#1#",
                    "{V:2,s:0.8}#2#",
                    "{V:3,s:0.8}#3#",
                    }
                }
            },
            j_sonfive_quest_meltan_active = {
                name = "Superalloy Showdown",
                text = {
                    "Get ready to battle {C:attention}Meltan{}!",
                    "You'll need an empty Joker slot if you",
                    "plan on catching them after the battle"
                }
            },
            j_sonfive_quest_meltan_complete = {
                name = "Superalloy Showdown",
                text = {
                    "You have completed this Quest already!",
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

            sonfive_heatran = {
                name = "Forged",
                text = {
                        "This card has been",
                        "forged by {C:attention}Heatran{}",
                    },
            },

            sonfive_burned = {
                name = "Burned",
                text = {
                        "{X:red,C:white}X0.5{} Mult",
                    },
            },
            sonfive_paralyzed = {
                name = "Paralyzed",
                text = {
                        "When a hand is played,",
                        "{C:green}25%{} chance to be",
                        "debuffed for that hand"
                    },
            },
            sonfive_frozen = {
                name = "Frozen",
                text = {
                        "{C:attention}Frozen Count{}: {C:attention}#1#{}",
                        "{C:attention}Debuffed{} while Frozen Count is greater than {C:attention}0{}",
                        "When Blind is selected decrease Frozen Count by {C:attention}1{}",
                        "plus {C:attention}1{} for each adjacent {X:fire,C:white}Fire{} Joker",
                    },
            },
            sonfive_asleep = {
                name = "Asleep",
                text = {
                        "{C:attention}Debuffed{} for",
                        "{C:attention}2{} to {C:attention}4{} rounds",
                    },
            },
            sonfive_poisoned = {
                name = "Poisoned",
                text = {
                        "When Blind is selected, if this",
                        "Joker's sell value is {C:money}$1{}",
                        "{S:1.1,C:red,E:2}self destructs{}",
                        "Otherwise, lose {C:money}$#1#{} of sell value",
                        "{C:inactive,s:0.8}(Increases by $0.1 after each Blind selection){}",
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

                sonfive_saffron_stake_sticker = {
                name = "Saffron Sticker",
                text = {
                        "Used this Joker",
                        "to win on {C:attention}Saffron",
                        "{C:attention}Stake{} difficulty"
                    },
            },
        },

        Sleeve = {

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
            stake_sonfive_saffron_stake = {
            name = "Saffron Stake",
            text = {"Shop can have Jokers",
                    "with {C:attention}Status Conditions{}",
                    "{s:0.8}Applies White Stake"
                },
            },
        },
        Tag={},
        Tarot={},
        Voucher={
            v_sonfive_heatran = {
                name = "Magma Stone",
                text = {
                    "Change upcoming Boss Blind",
                    "to {C:attention}Heatran{}",
                    },
                },
            v_sonfive_darkrai = {
                name = "Member Card",
                text = {
                    "Change upcoming Boss Blind",
                    "to {C:attention}Darkrai{}",
                    },
                },
            v_sonfive_meltan = {
                name = "Mystery Box",
                text = {
                    "Change upcoming Boss Blind",
                    "to {C:attention}Meltan{}",
                    },
                },
            },
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
            sonfive_weakened = "Weakened",
            sonfive_heatran = "Forged",
            sonfive_burned = "Burned",
            sonfive_paralyzed = "Paralyzed",
            sonfive_frozen = "Frozen",
            sonfive_asleep = "Asleep",
            sonfive_poisoned = "Poisoned"
        },
    }       
}
