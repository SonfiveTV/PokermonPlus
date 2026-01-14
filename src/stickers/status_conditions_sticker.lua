local function remove_value(t, value)
  for i = 1, #t do
    if t[i] == value then
      table.remove(t, i)
      return true
    end
  end
  return false
end

local statuscondition = { 
  key = 'statuscondition',
  badge_colour = HEX('c497c4'),
  pos = {x = 0, y = 1},
  atlas = 'stickers',
  rate = 1,
  no_collection = true,
  needs_enable_flag = false,
  default_compat = true,
  apply = function(self, card, val)
    print(card.ability)
    local statuses = {'sonfive_burned', 'sonfive_paralyzed', 'sonfive_frozen', 'sonfive_asleep', 'sonfive_poisoned'}
    if is_type(card,'Fire') then remove_value(statuses, 'sonfive_burned') end
    if is_type(card,'Lightning') then remove_value(statuses, 'sonfive_paralyzed') end
    if is_type(card,'Metal') or (card.sell_cost <= 1) then remove_value(statuses, 'sonfive_poisoned') end
    print(statuses)
    local status = pseudorandom_element(statuses, pseudoseed('statuscondition'))

    SMODS.Stickers[status]:apply(card, true)
    card:remove_sticker('sonfive_statiscondition')

  end,

  should_apply = function(self, card, center, area, bypass_roll)
    return (area == G.shop_jokers or area == G.pack_cards)
        and SMODS.Sticker.should_apply(self, card, center, area, bypass_roll)
  end,
}

local burned = { 
  key = 'burned',
  badge_colour = HEX('f94e00'),
  pos = {x = 1, y = 1},
  atlas = 'stickers',
  rate = 0,
  default_compat = true,
  calculate = function(self, card, context)
    if context.joker_main then
      return {x_mult = 0.5, message = "Burned!"}
    end
  end,
}

local paralyzed = { 
  key = 'paralyzed',
  badge_colour = HEX('fdae10'),
  pos = {x = 2, y = 1},
  atlas = 'stickers',
  rate = 0,
  default_compat = true,
  calculate = function(self, card, context)
    if context.before then
      if pseudorandom('paralyzed') < 0.25 then
        card.ability.extra.paralyzed = true
        card:set_debuff(true)
        return {message = "Paralyzed!", sound = 'sonfive_paralyzed'}
      end
    end
  end,
}

local frozen = { 
  key = 'frozen',
  badge_colour = HEX('62ccd4'),
  pos = {x = 3, y = 1},
  atlas = 'stickers',
  rate = 0,
  default_compat = true,
  loc_vars = function(self, info_queue, card)
    return {vars = {(card.ability and card.ability.extra and card.ability.extra.frozen_tally) or 6}}
  end,
  calculate = function(self, card, context)
    if not card.ability.extra.frozen_tally then
      card.ability.extra.frozen_tally = 6
      card.ability.perma_debuff = true
    end
  end,
}

local asleep = { 
  key = 'asleep',
  badge_colour = HEX('7d7d7d'),
  pos = {x = 4, y = 1},
  atlas = 'stickers',
  rate = 0,
  default_compat = true,
  calculate = function(self, card, context)
    if not card.ability.extra.wake_chance then
      card.ability.extra.wake_chance = math.random(1, 3)
      card.ability.perma_debuff = true
    end
  end,
}

local poisoned = { 
  key = 'poisoned',
  badge_colour = HEX('bc52e7'),
  pos = {x = 5, y = 1},
  atlas = 'stickers',
  rate = 0,
  default_compat = true,
  loc_vars = function(self, info_queue, card)
    return {vars = {(card.ability and card.ability.extra and card.ability.extra.poison_damage) or 0.0}}
  end,
  calculate = function(self, card, context)
    if not card.ability.extra.poison_damage then
      card.ability.extra.poison_damage = 0.0
    end
    if context.setting_blind then
      if card.sell_cost > 1 then
        local temp = nil
        card.ability.extra_value = (card.ability.extra_value or 0) - card.ability.extra.poison_damage
        card:set_cost()
        if card.ability.extra.poison_damage > 0 then
          temp = true
        end
        card.ability.extra.poison_damage = card.ability.extra.poison_damage + 0.1
        if temp then
          return {message = "Poisoned!"}
        end
      else
        remove(self, card)
      end
    end
  end,
}

return {name = "Stickers",
      list = {statuscondition, burned, paralyzed, frozen, asleep, poisoned}
}