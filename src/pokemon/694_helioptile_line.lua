local helioptile = {
  name = "helioptile",
  config = {extra = {
    money_mod = 1,
    suit = "Hearts",
    numerator = 1,
    denominator = 4
  }},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    local a = card.ability.extra
    local num, dem = SMODS.get_probability_vars(card, card.ability.extra.numerator, card.ability.extra.denominator, 'helioptile')
    local vars = {
      a.money_mod,
      a.money_mod * 2,
      localize(a.suit, 'suits_singular'),
      num,
      dem
    }

    return {vars = vars}
  end,
  designer = "Sonfive",
  rarity = 1,
  cost = 4,
  item_req = "sunstone",
  stage = "Basic",
  ptype = "Lightning",
  gen = 6,
  blueprint_compat = true,  
  calculate = function(self, card, context)
    local a = card.ability.extra
    if context.individual and context.cardarea == G.play and context.other_card:is_suit(a.suit) then
      if not context.end_of_round and not context.before and not context.after and not context.other_card.debuff then
        local earned = ease_poke_dollars(card, "helioptile", a.money_mod, true)
        if SMODS.pseudorandom_probability(card, 'helioptile', a.numerator, a.denominator, 'helioptile') then
            earned = ease_poke_dollars(card, "helioptile", a.money_mod * 2, true)
        end
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
    suit = "Hearts",
    numerator = 1,
    denominator = 4,
    percentage = 1
  }},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    local a = card.ability.extra
    local num, dem = SMODS.get_probability_vars(card, card.ability.extra.numerator, card.ability.extra.denominator, 'helioptile')
    local vars = {
      a.money_mod,
      a.money_mod * 2,
      localize(a.suit, 'suits_singular'),
      num,
      dem,
      a.percentage
    }

    return {vars = vars}
  end,
  designer = "Sonfive",
  rarity = "poke_safari",
  cost = 7,
  stage = "One",
  ptype = "Lightning",
  gen = 6,
  blueprint_compat = true,  
  calculate = function(self, card, context)
    local a = card.ability.extra

    if context.before or context.end_of_round then
        a.temp_balance = 0
    end
    if context.individual and context.cardarea == G.play and context.other_card:is_suit(a.suit) then
        if not context.end_of_round and not context.before and not context.after and not context.other_card.debuff then
            local current_dollars = G.GAME.dollars or 0


            -- Simulate live update
            if a.temp_balance then
                current_dollars = current_dollars + a.temp_balance
            end

            local earned = ease_poke_dollars(card, "heliolisk", a.money_mod, true)
            local bonus = 0

            if SMODS.pseudorandom_probability(card, 'heliolisk', a.numerator, a.denominator, 'heliolisk') then
                bonus = math.floor((current_dollars / 100 * a.percentage) * 10) / 10
                earned = ease_poke_dollars(card, "heliolisk", a.money_mod + bonus, true)
            end

            -- Track the running total manually
            a.temp_balance = (a.temp_balance or 0) + earned

            return {
                dollars = earned,
                card = card
            }
        end
    end
end

}


list = {helioptile, heliolisk}

return {name = "Helioptile", 
list = list
}