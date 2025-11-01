
local weakened = { 
  key = 'weakened',
  badge_colour = HEX('c497c4'),
  order = 5,
  pos = {x = 0, y = 0},
  atlas = 'stickers',
  apply = function(self, card, val)
    card.ability[self.key] = val
    if card.ability.extra then
      if type(card.ability.extra) == "table" then
        energy_shift(card, -2, card.ability.extra.ptype, false, true, true)
      end
    end
  end,
}

return {name = "Stickers",
      list = {weakened}
}