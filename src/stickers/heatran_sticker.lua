
local heatran = { 
  key = 'heatran',
  badge_colour = HEX('400000'),
  order = 6,
  pos = {x = 1, y = 0},
  atlas = 'stickers',
  no_collection = true,
  rate = 0.0,
  needs_enable_flag = true,
  default_compat = false,
  apply = function(self, card, val)
    card.ability[self.key] = val
  end,
  should_apply = function(self, card, center, area, bypass_roll)
    return (area == G.shop_jokers or area == G.pack_cards)
        and SMODS.Sticker.should_apply(self, card, center, area, bypass_roll)
  end,
}

return {name = "Stickers",
      list = {heatran}
}