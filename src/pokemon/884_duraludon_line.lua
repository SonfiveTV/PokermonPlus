local duraludon = {
  name = "duraludon",
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
  rarity = 3,
  cost = 8,
  stage = "Basic",
  ptype = "Dragon",
  gen = 8,
  blueprint_compat = true,  
  calculate = function(self, card, context)
    local a = card.ability.extra
    local odd, even = (a.current_hand == "odd"), (a.current_hand == "even")
    if context.joker_main and not context.repetition then
      if odd then 
        a.current_hand = "even"
        return {
          message = localize{type = 'variable', key = 'a_xmult', vars = {a.Xmult}}, 
          colour = G.C.XMULT,
          Xmult_mod = a.Xmult
        }
      elseif even then
        a.current_hand = "odd"
        return {
          message = "Recharging.."
        }
      end
    end
    if context.end_of_round then
      a.current_hand = "odd"
    end
    return type_evo(self, card, context, "j_sonfive_archaludon", "metal")
  end,
}

local archaludon = {
  name = "archaludon",
  config = {extra = {
    Xmult_mod = 0.5,
    Xmult = 1,
    current_hand = "odd" 
  }},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)

    local a = card.ability.extra

    local vars = {
      a.Xmult_mod,   -- 1
      a.Xmult,    -- 2
    }

    return {vars = vars}
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
    local odd, even = (a.current_hand == "odd"), (a.current_hand == "even")
    local count = 1 + #find_pokemon_type("Lightning")
    if context.joker_main and not context.repetition then
      if even then 
        a.current_hand = "odd"
        return {
          message = localize{type = 'variable', key = 'a_xmult', vars = {a.Xmult}}, 
          colour = G.C.XMULT,
          Xmult_mod = a.Xmult
        }
      elseif odd then
        a.current_hand = "even"
        a.Xmult = a.Xmult + (count * a.Xmult_mod)
        return {
          message = "Absorbing.." 
        }
        
      end
    end

    if context.end_of_round and not context.repetition and not context.individual and not context.blueprint then
      a.Xmult = 1
      a.current_hand = "odd"
      return {
        message = localize('k_reset'),
        colour = G.C.RED
      }
    end
  end,
}


list = {duraludon, archaludon}

return {name = "Duraludon", 
list = list
}