local helioptile = {
  name = "helioptile",
  config = {extra = {
    money_mod = 1,
    numerator = 1,
    denominator = 4
  }},
  loc_vars = function(self, info_queue, card)
    local a = card.ability.extra
    local num, dem = SMODS.get_probability_vars(card, card.ability.extra.numerator, card.ability.extra.denominator, 'helioptile')
    local vars = {
      math.min(a.money_mod, card.sell_cost),
      math.min(a.money_mod * 2, card.sell_cost),
      card.sell_cost,
      num,
      dem
    }
    return {vars = vars}
  end,
  designer = "Sonfive",
  rarity = 1,
  cost = 5,
  item_req = "sunstone",
  stage = "Basic",
  ptype = "Lightning",
  gen = 6,
  enhancement_gate = 'm_wild',
  blueprint_compat = true,  
  calculate = function(self, card, context)
    local a = card.ability.extra
    local bonus = 0
    if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_wild') then
      if not context.end_of_round and not context.before and not context.after and not context.other_card.debuff then
        if SMODS.pseudorandom_probability(card, 'helioptile', a.numerator, a.denominator, 'helioptile') then
          bonus =  a.money_mod * 2
        else
          bonus = a.money_mod
        end

        G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + bonus
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.dollar_buffer = 0
                return true
            end
        }))

        local earned = ease_poke_dollars(card, "helioptile", bonus, true)
        return {
          dollars = earned,
          card = card
        }
      end
    end
    return item_evo(self, card, context, "j_sonfive_heliolisk")
  end
}

local heliolisk = {
  name = "heliolisk",
  config = {extra = {
    money_mod = 2,
    numerator = 1,
    denominator = 4,
    money_mod1 = 1,
    money_mod2 = 2
  }},
  loc_vars = function(self, info_queue, card)

    local a = card.ability.extra
    local num, dem = SMODS.get_probability_vars(card, card.ability.extra.numerator, card.ability.extra.denominator, 'helioptile')
    local vars = {
      math.min(a.money_mod, card.sell_cost),
      math.min(a.money_mod * 2, card.sell_cost),
      card.sell_cost,
      num,
      dem,
      a.money_mod1
    }

    return {vars = vars}
  end,
  designer = "Sonfive",
  rarity = "poke_safari",
  cost = 8,
  stage = "One",
  ptype = "Lightning",
  gen = 6,
  enhancement_gate = 'm_wild',
  blueprint_compat = true,  
  calculate = function(self, card, context)
    local a = card.ability.extra
    if context.individual and context.cardarea == G.play
    and SMODS.has_enhancement(context.other_card, 'm_wild')
    and not context.end_of_round and not context.before and not context.after
    and not context.other_card.debuff then

      local total_earned = a.money_mod

      if SMODS.pseudorandom_probability(card, "heliolisk", a.numerator, a.denominator, "heliolisk") then
        a.money_mod = a.money_mod + a.money_mod1
      end

      G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + total_earned
      local earned = ease_poke_dollars(card, "heliolisk", math.min(total_earned, card.sell_cost), true)

      G.E_MANAGER:add_event(Event({
        func = function()
          G.GAME.dollar_buffer = 0
          return true
        end
      }))

      if earned and earned > 0 then
        return {
          dollars = earned,
          card = card
        }
      end
    end
    if context.end_of_round then
      a.money_mod = a.money_mod2
    end
  end
}


local list = {helioptile, heliolisk}

return {name = "Helioptile", 
list = list
}