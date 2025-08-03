return {
    descriptions = {

        Back = {
            b_sonfive_virtuousdeck = {
                name = "バーチュアスデッキ",
                text = {
                        "{C:item,T:c_sonfive_timerball}タイマーボール{} カードで始まる",
                        "ハンド {C:blue}-1{}",
                }
            },
            b_sonfive_propheticdeck = {
                name = "プロフェティックデッキ",
                text = {
                        "{C:purple}見破る +#2#",
                        "ハンドサイズ {C:attention}+#1#{}",
                }
            },
            b_sonfive_shinydeck = {
                name = "シャイニーデッキ",
                text = {
                        "{C:dark_edition}色違いポケモン{}が",
                        "出現しやすくなります"  
                }
            },
            b_sonfive_megadeck = {
                name = "メガデッキ",
                text = {
                        "{C:dark_edition,T:c_poke_megastone}メガストーン{} カードで始まる",
                        "勝利条件のアンティ数が {X:gray,C:attention}+4{}"
                }
            },
            b_sonfive_voiddeck = {
                name = "ボイドデッキ",
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
                name = 'ツチニン',
                text = {
                    "チップ {C:chips}+#1#{} か 倍率 {C:mult}+#2#{}",
                    "{C:inactive,s:0.8}({C:attention,s:0.8}#3#{}{C:inactive,s:0.8} ラウンド後に進化)"                    
                } 
            },
            j_sonfive_ninjask = {
                name = 'テッカニン',
                text = {
                    "チップ {C:chips}+#1#{}",
                    "倍率 {C:mult}+#2#{}",   
                    "{br:4}text needs to be here to work",
                    "Increases this Joker's {C:chips}Chips{}", 
                    "and {C:mult}Mult{} at end of round",
                    "{C:inactive}(#3# Speed Boosts remaining){}"
                } 
            },
            j_sonfive_shedinja = {
                name = 'ヌケニン',
                text = {
                    "Every {C:attention}unique{} rank {C:attention}held in hand{}",
                    "earns {C:money}$#1#{} at end of round",
                    -- "{C:inactive,s:0.8}(Gains Negative after earning {C:money,s:0.8}$#2#{}{C:inactive,s:0.8}/$#3#){}"  ,
                    "{br:4}seppuku",
                    "If a {C:attention}#4#, #5#,{} or {C:attention}#6#{} is",
                    "held in hand then",
                    "{S:1.1,C:red,E:2}self destructs{}",
                    "{C:inactive,s:0.8}(Rank changes every round){}",            
                } 
            },
            j_sonfive_nacli = {
                name = 'コジオ',
                text = {
                    "{C:attention}ブラインド{}が選択された時",
                    "{C:attention}ジョーカー{} カード1枚につき, {C:money}$#1#{} を与える",
                    "{C:inactive}({}{X:water,C:white}水{}{C:inactive} と {}{X:metal,C:white}鉄{}{C:inactive} が 2倍 を与える){}",
                    "{br:4}text needs to be here to work",
                    "このジョーカーはデバフできない",
                    "{C:inactive,s:0.8}({C:money,s:0.8}$24{C:inactive,s:0.8} 与えた後に進化)",
                } 
            },
            j_sonfive_naclstack = {
                name = 'ジオヅム',
                text = {
                    "{C:attention}ブラインド{}が選択された時 {C:green}#3#分の#5#{} 確率で",
                    "一番左の{C:attention}ジョーカー{}を破壊して 倍率 {X:red,C:white}X#1#{} を得る",
                    "{C:inactive}({C:inactive} 一番左は{} {X:water,C:white}水{} {C:inactive}か{} {X:metal,C:white}鉄{} {C:inactive}なら、確率は {C:green}#4#分の#5#{}){}",
                    "{br:4}text needs to be here to work",
                    "このジョーカーはデバフできない",
                    "{C:inactive}(倍率 {X:red,C:white}X#2#{}{C:inactive} / {}{X:red,C:white}X2{}{C:inactive} で進化){}"                  
                } 
            },
            j_sonfive_garganacl = {
                name = 'キョジオーン',
                text = {
                    "{C:attention}ブラインド{}が選択された時 {C:green}#3#%{} 確率で",
                    "一番左の{C:attention}ジョーカー{}を破壊して",
                    "このジョーカーの {X:red,C:white}X{}倍率を {X:red,C:white}X#1#{} に倍する",
                    "{C:inactive}({C:inactive} 一番左は{} {X:water,C:white}水{} {C:inactive}か{} {X:metal,C:white}鉄{} {C:inactive}なら、確率は {C:green}#4#%{}){}",
                    "{br:4}text needs to be here to work",
                    "このジョーカーはデバフできない",
                    "{C:inactive}(現在 倍率 {X:red,C:white}X#2#{C:inactive})",           
                } 
            },
            j_sonfive_meltan = {
                name = 'メルタン',
                text = {
                    "{C:dark_edition}ネガティブ {C:item}メタルコート{}を{C:attention}持っている{}",
                    "手札にある",
					"すべての {C:attention}スチール{} カードを",
					"{C:attention}#3#{} 回再発動する",
                    "{C:inactive,s:0.8}(スチールカードを #1# / #2#枚スコアした後に進化){}"                    
                } 
            },
            j_sonfive_melmetal = {
                name = 'メルメタル',
                text = {
                    "手札にある",
					"すべての {C:attention}スチール{} カードを",
                    "{X:metal,C:white}鋼{} タイプカード",
					"1枚につき再発動する",
                    "{C:inactive,s:0.8}(ジョーカかエネルギー){}",
                    "{C:inactive}(現在 #1# 再発動)"
                } 
            },     
        },
        Item = {
            c_sonfive_timerball = {
                name = "タイマーボール",
                text = {
                        "{V:1}#1#{C:attention} ポケモン{}を",
                        "作る",
                        "レアリティ増加まであと{C:attention}#2#{}ラウンド",
                        "{C:inactive}(空きが必要)"
                },
            },
            c_sonfive_timerball_max = {
                name = "タイマーボール",
                text = {
                        "{V:1}#1#{C:attention} ポケモン{}を",
                        "作る",
                        "{C:inactive}(空きが必要)"
                },
            },
            c_sonfive_timerball_start = {
                name = "タイマーボール",
                text = {
                        "{C:attention}1{}ラウンドで{V:1}#1#{C:attention} ポケモン{}を",
                        "作られる",
                        "{C:inactive}(空きが必要)"
                },
            },
            c_sonfive_timerball_deck = {
                name = "タイマーボール",
                text = {
                        "{C:attention}1{}ラウンドで{V:1}#1#{C:attention} ポケモン{}を",
                        "作られる",
                        "{C:inactive}(空きが必要)"
                },
            },
        },
        Other = {
            timer = {
                name = "タイマーボール",
                text = {
                        "{C:attention}1{}ラウンド後に{C:blue}コモンポケモン{}を作る",
                        "{C:attention}3{}ラウンド後に{C:green}アンコモンポケモン{}を作る",
                        "{C:attention}7{}ラウンド後に{C:red}レアポケモン{}を作る",
                        "{C:attention}15{}ラウンド後に{C:legendary,E:1}レジェンドポケモン{}を作る",
                },
            },
            designed_by = {
                name = "デザイン",
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
            sleeve_sonfive_virtuoussleeve = {
                name = "バーチュアススリーブ",
                text = {
                        "{C:item,T:c_sonfive_timerball}タイマーボール{} カードで始まる",
                        "ハンド {C:blue}-1{}",
                }
            },
            sleeve_sonfive_virtuoussleeve_alt = {
                name = "バーチュアススリーブ",
                text = {
                        "{C:tarot,T:v_hieroglyph}Hieroglyph{} のバウチャー",
                        "ランをスタートする"
                },
            },
            sleeve_sonfive_propheticsleeve = {
                name = "プロフェティックスリーブ",
                text = {
                        "{C:purple}見破る +#2#",
                        "ハンドサイズ {C:attention}+#1#{}",
                },
            },
            sleeve_sonfive_propheticsleeve_alt = {
                name = "プロフェティックスリーブ",
                text = {
                        "{C:purple}見破る +3",
                },
            },
            sleeve_sonfive_shinysleeve = {
                name = "シャイニースリーブ",
                text = {
                        "{C:dark_edition}色違いポケモン{}が",
                        "出現しやすくなります" 
                },
            },
            sleeve_sonfive_shinysleeve_alt = {
                name = "シャイニースリーブ",
                text = {
                        "さらに{C:dark_edition}色違いポケモン{}が",
                        "出現しやすくなります" 
                },
            },
            sleeve_sonfive_megasleeve = {
                name = "メガスリーブ",
                text = {
                        "{C:dark_edition,T:c_poke_megastone}メガストーン{} カードで始まる",
                        "勝利条件のアンティ数が {X:gray,C:attention}+4{}"
                }
            },
            sleeve_sonfive_voidsleeve = {
                name = "ボイドスリーブ",
                text = {
                        
                }
            },
            sleeve_sonfive_voidsleeve_alt = {
                name = "ボイドスリーブ",
                text = {
                        
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
            c_sonfive_balls_of_patience = "忍耐の玉",
            c_sonfive_salt_cured = "塩硬化",
            c_sonfive_metallurgy = "冶金",
            c_sonfive_wonder_guard = "不思議を守る",
            },
            dictionary = {
                -- Joker Messages
                sonfive_saltcure_ex = "しおづけ!",
                sonfive_speedboost = "かそく!",

                -- Config Descriptions
                custom_jokers = "カスタムジョーカーを有効?",
                nincada_line = "ツチニン系?",
                meltan_line = "メルタン系?",
                nacli_line = "コジオ系?",
                custom_consumeables = "カスタム消耗を有効?",
            },
            v_text = {
                -- Custom Challenge Descriptions
           ch_c_sonfive_wonderguard = {"{C:attention}ヌケニン{}が{S:1.1,C:red,E:2}自らを破壊{}しれば、ランを{C:attention}負ける{}"},
            },

            labels={
            },















        }       
    }

