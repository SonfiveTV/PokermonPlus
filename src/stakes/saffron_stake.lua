local saffron = {
    key = 'saffron_stake',
    applied_stakes = {'white'},
    above_stakes = (SMODS.Mods["NachosPokermonDip"] or {}).can_load and {'nacho_elite_stake'} or {'gold'},
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}},

    modifiers = function()
        G.GAME.modifiers.enable_sonfive_statuscondition = true
    end,

    colour = HEX('F4C430'),

    pos = {x = 1, y = 0},
    sticker_pos = {x = 1, y = 0},
    atlas = 'stakes',
    sticker_atlas = 'stake_stickers'
}



return {name = "Stakes",
      list = {saffron}
}