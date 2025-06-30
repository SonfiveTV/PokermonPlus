local nacli = {
  name = "nacli",
  pos = {x = 3, y = 2},
  config = {extra = {money = 1, earned = 0}, evo_rqmt = 24},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"Sonfive"}}
		return {vars = {card.ability.extra.money, card.ability.extra.earned}}
  end,
  rarity = 3,
  cost = 5,
  stage = "Basic",
  ptype = "Earth",
  atlas = "Pokedex9",
  blueprint_compat = true,
  
  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
          local abbr = card.ability.extra
          local money_earned = (#G.jokers.cards + #find_pokemon_type("Water") + #find_pokemon_type("Metal")) * abbr.money
          local earned = ease_poke_dollars(card, "nacli", money_earned, true)
          abbr.earned = abbr.earned + money_earned
      return {
        dollars = earned,
        card = card
      }
        
    end
    return scaling_evo(self, card, context, "j_sonfive_naclstack", card.ability.extra.earned, self.config.evo_rqmt)
  end
}

local naclstack = {
  name = "naclstack",
  pos = {x = 4, y = 2},
  config = {extra = {Xmult_mod = 0.25, Xmult = 1, odds = 8}, evo_rqmt = 2},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"Sonfive"}}
		return {vars = {card.ability.extra.Xmult_mod, card.ability.extra.Xmult, card.ability.extra.odds, (card.ability.extra.odds / 2), G.GAME.probabilities.normal}}
  end,
  rarity = "poke_safari",
  cost = 6,
  stage = "One",
  ptype = "Earth",
  atlas = "Pokedex9",
  blueprint_compat = true,
  
  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
      local abbr = card.ability.extra
      local odds
      local leftmost = G.jokers.cards[1]

      if leftmost ~= card and not leftmost.ability.eternal then 
        if is_type(G.jokers.cards[1], "Metal") or is_type(G.jokers.cards[1], "Water") then
          odds = ((G.GAME.probabilities.normal/abbr.odds) * 2)
        else
          odds = (G.GAME.probabilities.normal/abbr.odds)
        end
        if pseudorandom('naclstack') < odds then
          abbr.Xmult = abbr.Xmult + abbr.Xmult_mod
          G.E_MANAGER:add_event(Event({
          remove(self, leftmost, context)
          }))
          return{
            message = localize('sonfive_saltcure_ex'), colour = HEX('A8F2FF')
          }
        end
      end
    end


    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main then
        return {
          message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.Xmult}}, 
          colour = G.C.XMULT,
          Xmult_mod = card.ability.extra.Xmult
        }
      end
    end
    return scaling_evo(self, card, context, "j_sonfive_garganacl", card.ability.extra.Xmult, self.config.evo_rqmt)
  end
}

local garganacl = {
  name = "garganacl",
  pos = {x = 5, y = 2},
  config = {extra = {Xmult_multi = 1.5, Xmult = 2, odds = 12.5}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"Sonfive"}}
		return {vars = {card.ability.extra.Xmult_multi, card.ability.extra.Xmult, card.ability.extra.odds, (2*card.ability.extra.odds)}}
  end,
  rarity = "poke_safari",
  cost = 8,
  stage = "Two",
  ptype = "Earth",
  atlas = "Pokedex9",
  blueprint_compat = true,
  
  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
      local abbr = card.ability.extra
      local odds
      local leftmost = G.jokers.cards[1]

      if leftmost ~= card and not leftmost.ability.eternal then 
        if is_type(G.jokers.cards[1], "Metal") or is_type(G.jokers.cards[1], "Water") then
          odds = ((abbr.odds/100) * 2)
        else
          odds = abbr.odds/100
        end
        if pseudorandom('garganacl') < odds then
          abbr.Xmult = abbr.Xmult * abbr.Xmult_multi
          G.E_MANAGER:add_event(Event({
          remove(self, leftmost, context)
          }))
          return{
            message = localize('sonfive_saltcure_ex'), colour = HEX('A8F2FF')
          }
        end
      end
    end


    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main then
        return {
          message = localize{type = 'variable', key = 'a_xmult', vars = {card.ability.extra.Xmult}}, 
          colour = G.C.XMULT,
          Xmult_mod = card.ability.extra.Xmult
        }
      end
    end
  end
}

if sonfive_config.Nacli then
  list = {nacli, naclstack, garganacl}
else list = {}
end

return {name = "Nacli", 
list = list
}