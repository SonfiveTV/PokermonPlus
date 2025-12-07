
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
        increment_energy(card, get_type(card), -1)
        card.ability.extra.e_limit_up = card.ability.extra.e_limit_up and (card.ability.extra.e_limit_up - 1) or -1
      end
    end
  end,
}

return {name = "Stickers",
      list = {weakened}
}