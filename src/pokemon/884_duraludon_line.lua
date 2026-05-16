local duraludon = {
  name = "duraludon",
  config = {extra = {
    Xmult = 2,
    hands_played = 0,
  }},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.Xmult,
        (card.ability.extra.hands_played % 2 == 1) and "1 remaining" or "Active!",

      }
    }
  end,
  designer = "Sonfive",
  rarity = 3,
  cost = 8,
  stage = "Basic",
  ptype = "Dragon",
  gmax = "gmax_duraludon",
  gen = 8,
  blueprint_compat = true,  
  calculate = function(self, card, context)
    local a = card.ability.extra
    local odd, even = (a.hands_played % 2 == 1), (a.hands_played % 2 == 0)
    if context.joker_main and not context.repetition then
      if even then 
        a.hands_played = a.hands_played + 1
        return {
          message = localize{type = 'variable', key = 'a_xmult', vars = {a.Xmult}}, 
          colour = G.C.XMULT,
          Xmult_mod = a.Xmult
        }
      elseif odd then
        a.hands_played = a.hands_played + 1
        return {
          message = "Recharging.." 
        }
        
      end
    end
  end,
}

local archaludon = {
  name = "archaludon",
  config = {extra = {
    Xmult_mod = 0.5,
    Xmult = 1,
    Xmult1 = 1,
    hands_played = 0,
  }},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.Xmult_mod,
        card.ability.extra.Xmult,
        (card.ability.extra.hands_played % 2 == 1) and "1 remaining" or "Active!",
        (card.ability.extra.hands_played % 2 == 0) and "1 remaining" or "Active!",

      }
    }
  end,
  designer = "Sonfive",
  rarity = "poke_safari",
  cost = 8,
  stage = "One",
  ptype = "Metal",
  gen = 8,
  blueprint_compat = true,  
  calculate = function(self, card, context)
    local a = card.ability.extra
    local odd, even = (a.hands_played % 2 == 1), (a.hands_played % 2 == 0)
    local count = 1 + #find_pokemon_type("Lightning")
    if context.joker_main and not context.repetition then
      if even then 
        a.hands_played = a.hands_played + 1
        return {
          message = localize{type = 'variable', key = 'a_xmult', vars = {a.Xmult}}, 
          colour = G.C.XMULT,
          Xmult_mod = a.Xmult
        }
      elseif odd then
        a.hands_played = a.hands_played + 1
        a.Xmult = a.Xmult + (count * a.Xmult_mod)
        return {
          message = "Absorbing.." 
        }
        
      end
    end

    if context.end_of_round and not context.repetition and not context.individual and not context.blueprint then
      a.Xmult = a.Xmult1
      return {
        message = localize('k_reset'),
        colour = G.C.RED
      }
    end
  end,
}

local gmax_duraludon = {
  name = "gmax_duraludon",
  config = {extra = {
    Xmult = 2,
    current_hand = "odd" 
  }},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)

    local a = card.ability.extra

    local vars = {
      a.Xmult,    
    }

    return {vars = vars}
  end,
  designer = "Sonfive",
  rarity = "agar_gmax",
  cost = 8,
  stage = "Gigantamax",
  ptype = "Dragon",
  gen = 8,
  blueprint_compat = true,  
  calculate = function(self, card, context)
    local a = card.ability.extra
    if context.joker_main and not context.repetition then
      return {
        message = localize{type = 'variable', key = 'a_xmult', vars = {a.Xmult}}, 
        colour = G.C.XMULT,
        Xmult_mod = a.Xmult
      }
    end
  end,
}

local list = {}
if next(SMODS.find_mod("Agarmons")) then
  list = {duraludon, archaludon, gmax_duraludon}
else
  list = {duraludon, archaludon}
end
return {name = "Duraludon", 
list = list
}