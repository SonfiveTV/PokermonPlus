local lechonk = {
  name = "lechonk",
  config = {
      extra = {
        rounds = 5,
      },
  },
  loc_vars = function(self, info_queue, card)
      return {
          vars = {
            card.ability.extra.rounds
          }
      }
  end,
  designer = "Emma",
  rarity = 2,
  cost = 6,
  stage = "Basic",
  ptype = "Colorless",
  gen = 9,
  custom_art = true,
  blueprint_compat = false,
  calculate = function(self, card, context)
    local a = card.ability.extra
    local earned = nil
    local money = nil
    if context.end_of_round and context.main_eval and not context.blueprint then
      money = G.GAME.interest_amount*math.min(math.floor(G.GAME.dollars/5), G.GAME.interest_cap/5)
      earned = (SMODS.Mods["Talisman"] or {}).can_load and to_number(money) or money
      if earned > 0 then
        card.ability.extra_value = (card.ability.extra_value or 0) + earned
        card:set_cost()
        return {
            card = card
        }
      end
    end
    return pokermon.level_evo(self, card, context, "j_sonfive_oinkologne")
  end
}


local oinkologne = {
  name = "oinkologne",
  config = {extra = {}},
  designer = "Emma",
  rarity = "poke_safari",
  cost = 8,
  stage = "One",
  ptype = "Colorless",
  gen = 9,
  blueprint_compat = false,
  calculate = function(self, card, context)
    local a = card.ability.extra
    local earned = nil
    local money = nil
    if context.end_of_round and context.main_eval and not context.blueprint then
      money = G.GAME.interest_amount*math.min(math.floor(G.GAME.dollars/5), G.GAME.interest_cap/5)
      earned = (SMODS.Mods["Talisman"] or {}).can_load and to_number(money) or money
      if earned > 0 then
        card.ability.extra_value = (card.ability.extra_value or 0) + (2 * earned)
        card:set_cost()
        return {
            card = card
        }
      end
    end
  end
}

local list = {lechonk, oinkologne}

return {name = "Lechonk", 
list = list
}
