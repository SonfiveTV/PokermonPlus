local ex = { -- Ex
    key = 'ex_stake',
    applied_stakes = {'green'},
    above_stake = 'green',
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}},

    modifiers = function()
        G.GAME.modifiers.enable_ex_in_shop = true
    end,

    colour = HEX('2b2b2b'),

    pos = {x = 1, y = 0},
    sticker_pos = {x = 1, y = 0},
    atlas = 'stakes',
    sticker_atlas = 'stake_stickers'
}



return {name = "Stakes",
      list = {ex}
}