local lilac = {
    key = 'lilac_stake',
    applied_stakes = {'gold'},
    above_stake = 'gold',
    prefix_config = {above_stake = {mod = false}, applied_stakes = {mod = false}},

    modifiers = function()
        G.GAME.modifiers.enable_weakened_in_shop = true
    end,

    colour = HEX('E8CCE8'),

    pos = {x = 0, y = 0},
    sticker_pos = {x = 0, y = 0},
    atlas = 'stakes',
    sticker_atlas = 'stake_stickers'
}



return {name = "Stakes",
      list = {lilac}
}