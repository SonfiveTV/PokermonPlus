local nacli = {
  name = "nacli",
  pos = {x = 3, y = 2},
  config = {extra = {Xmult_mod = 0.2, Xmult = 1, odds = 2}, evo_rqmt = 2},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"Sonfive"}}
		return {vars = {card.ability.extra.Xmult_mod, card.ability.extra.Xmult, card.ability.extra.odds, (card.ability.extra.odds / 2), G.GAME.probabilities.normal}}
  end,
  rarity = 3,
  cost = 6,
  stage = "One",
  ptype = "Earth",
  atlas = "Pokedex9",
  blueprint_compat = true,
  
  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
      local abbr = card.ability.extra
      local odds
      local rightmost = G.jokers.cards[#G.jokers.cards]

      if rightmost ~= card and not rightmost.ability.eternal then 
        if is_type(rightmost, "Metal") or is_type(rightmost, "Water") then
          odds = ((G.GAME.probabilities.normal/abbr.odds) * 2)
        else
          odds = (G.GAME.probabilities.normal/abbr.odds)
        end
        if pseudorandom('naclstack') < odds then
          abbr.Xmult = abbr.Xmult + abbr.Xmult_mod
          G.E_MANAGER:add_event(Event({
          remove(self, rightmost, context)
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
    return scaling_evo(self, card, context, "j_sonfive_naclstack", card.ability.extra.Xmult, self.config.evo_rqmt)
  end
}

local naclstack = {
  name = "naclstack",
  pos = {x = 4, y = 2},
  config = {extra = {Xmult_mod = 0.5, Xmult = 2, odds = 4}, evo_rqmt = 4},
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
      local rightmost = G.jokers.cards[#G.jokers.cards]

      if rightmost ~= card and not rightmost.ability.eternal then 
        if is_type(rightmost, "Metal") or is_type(rightmost, "Water") then
          odds = ((G.GAME.probabilities.normal/abbr.odds) * 2)
        else
          odds = (G.GAME.probabilities.normal/abbr.odds)
        end
        if pseudorandom('naclstack') < odds then
          abbr.Xmult = abbr.Xmult + abbr.Xmult_mod
          G.E_MANAGER:add_event(Event({
          remove(self, rightmost, context)
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
  config = {extra = {Xmult_multi = 1.1, Xmult = 4, odds = 8}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"Sonfive"}}
		return {vars = {card.ability.extra.Xmult_multi, card.ability.extra.Xmult, card.ability.extra.odds, (card.ability.extra.odds / 2), G.GAME.probabilities.normal}}
  end,
  rarity = "poke_safari",
  cost = 8,
  stage = "Two",
  ptype = "Earth",
  atlas = "Pokedex9",
  blueprint_compat = true,
  
  calculate = function(self, card, context)
    local abbr = card.ability.extra
    if context.setting_blind and not context.blueprint then
      local abbr = card.ability.extra
      local odds
      local rightmost = G.jokers.cards[#G.jokers.cards]

      if rightmost ~= card and not rightmost.ability.eternal then 
        if is_type(rightmost, "Metal") or is_type(rightmost, "Water") then
          odds = ((G.GAME.probabilities.normal/abbr.odds) * 2)
        else
          odds = (G.GAME.probabilities.normal/abbr.odds)
        end
        if pseudorandom('garganacl') < odds then
          abbr.Xmult = abbr.Xmult * abbr.Xmult_multi
          G.E_MANAGER:add_event(Event({
          remove(self, rightmost, context)
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
