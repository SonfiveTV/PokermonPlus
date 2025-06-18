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
                        "{C:spectral}Spectral{} cards may",
                        "appear in the shop,",
                        "{C:dark_edition}Negative{} {C:pink}Energy{} doesn't",
                        "count towards {C:pink}Energy{} Limit,",
                        "start with a {C:spectral,T:c_poke_nightmare}Nightmare{} card"
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
            dictionary = {
                sonfive_saltcure_ex = "Salt Cure!",
            },

            labels={
                sonfive_rocket = "Team Rocket",
                sonfive_ex = "EX"
            },















        }       
    }

