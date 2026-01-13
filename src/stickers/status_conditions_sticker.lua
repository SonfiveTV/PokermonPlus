local statuscondition = { 
  key = 'statuscondition',
  badge_colour = HEX('c497c4'),
  pos = {x = -1, y = 0},
  atlas = 'stickers',
  rate = 1,
  needs_enable_flag = false,
  default_compat = true,
  apply = function(self, card, val)
    local statuses = {}
    if card.ability.ptype and card.ability.ptype == 'Fire' then
      statuses = {'sonfive_paralyzed', 'sonfive_frozen', 'sonfive_asleep', 'sonfive_poisoned'}
    elseif card.ability.ptype and card.ability.ptype == 'Lightning' then
      statuses = {'sonfive_burned', 'sonfive_frozen', 'sonfive_asleep', 'sonfive_poisoned'}
    elseif card.ability.ptype and card.ability.ptype == 'Metal' then
      statuses = {'sonfive_burned', 'sonfive_paralyzed', 'sonfive_frozen', 'sonfive_asleep'}
    else
      statuses = {'sonfive_burned', 'sonfive_paralyzed', 'sonfive_frozen', 'sonfive_asleep', 'sonfive_poisoned'}
    end
    local status = pseudorandom_element(statuses, pseudoseed('statuscondition'))

    SMODS.Stickers[status]:apply(self, true)
  end,

  should_apply = function(self, card, center, area, bypass_roll)
    return (area == G.shop_jokers or area == G.pack_cards)
        and SMODS.Sticker.should_apply(self, card, center, area, bypass_roll)
  end,
}

local burned = { 
  key = 'burned',
  badge_colour = HEX('c497c4'),
  pos = {x = -1, y = 0},
  atlas = 'stickers',
  rate = 0,
  default_compat = true,
  apply = function(self, card, val)
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        x_mult = 0.5
      }
    end
  end,
}

local paralyzed = { 
  key = 'paralyzed',
  badge_colour = HEX('c497c4'),
  pos = {x = -1, y = 0},
  atlas = 'stickers',
  rate = 0,
  default_compat = true,
  apply = function(self, card, val)
  end,
  calculate = function(self, card, context)
    if context.before then
      if pseudorandom('paralyzed') < 0.25 then
        card.ability.extra.paralyzed = true
        card:set_debuff(true)
      end
    end
    if context.final_scoring_step and card.ability.extra.paralyzed then
      card.ability.extra.paralyzed = false
      card:set_debuff(false)
    end
  end,
}

return {name = "Stickers",
      list = {statuscondition, burned, paralyzed}
}