-- local shuckle = {
--     name = "shuckle",
--     poke_custom_prefix = "sonfive",
--     pos = {x =  1,  y = 6},
--     config = {},
--     loc_vars =  function(self, info_queue, center)
--         type_tooltip(self, info_queue, center)
--         info_queue[#info_queue+1] = G.P_CENTERS.c_sonfive_berryjuice
--         info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"Sonfive"}}
--         return
--     end,
--     rarity = 2,
--     cost = 4,
--     ptype = "Grass",
--     stage = "Basic",
--     atlas = "pokedex_2",
--     blueprint_compat = true,
--     calculate = function(self, card, context)
--         if context.setting_blind then
--             if not from_debuff and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
--                 local _card = create_card('Item', G.consumeables, nil, nil, nil, nil, 'c_sonfive_berryjuice')
--                 _card:add_to_deck()
--                 G.consumeables:emplace(_card)
--                 card_eval_status_text(_card, 'extra', nil, nil, nil, {message = localize('poke_plus_pokeitem'), colour = G.C.FILTER})
--                 return true
--             end
--         end
--     end,
-- }

-- local duskull = {
--   name = "duskull", 
--   poke_custom_prefix = "sonfive",
--   pos = {x = 6, y = 10}, 
--   config = {extra = {mult_mod = 5, mult = 0}, evo_rqmt = 25},
--   loc_vars = function(self, info_queue, card)
--     type_tooltip(self, info_queue, card)
--     local mult = card.ability.extra.mult
--     return {vars = {mult, card.ability.extra.mult_mod}}
--   end,
--   rarity = 2, 
--   cost = 5, 
--   stage = "Basic", 
--   ptype = "Psychic",
--   atlas = "pokedex_3",
--   blueprint_compat = true,
--   calculate = function(self, card, context)
--     if context.cardarea == G.jokers and context.scoring_hand then
--       if context.joker_main and card.ability.extra.mult > 0 then
--         local mult = card.ability.extra.mult
--         return {
--           message = localize{type = 'variable', key = 'a_mult', vars = {mult}}, 
--           colour = G.C.MULT,
--           mult_mod = mult
--         }
--       end
--     end
--     return scaling_evo(self, card, context, "j_sonfive_dusclops", card.ability.extra.mult, self.config.evo_rqmt)
--   end,
--   update = function(self, card, dt)
--     if G.STAGE == G.STAGES.RUN then
--         card.ability.extra.mult = (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.spectral or 0) * card.ability.extra.mult_mod
--     end
--   end,
-- }

-- local dusclops = {
--   name = "dusclops", 
--   poke_custom_prefix = "sonfive",
--   pos = {x = 7, y = 10}, 
--   config = {extra = {mult_mod = 10, mult = 0}, evo_rqmt = 150},
--   loc_vars = function(self, info_queue, card)
--     type_tooltip(self, info_queue, card)
--     local mult = card.ability.extra.mult
--     return {vars = {mult, card.ability.extra.mult_mod}}
--   end,
--   rarity = 3, 
--   cost = 7, 
--   stage = "One", 
--   ptype = "Psychic",
--   atlas = "pokedex_3",
--   blueprint_compat = true,
--   calculate = function(self, card, context)
--     if context.cardarea == G.jokers and context.scoring_hand then
--       if context.joker_main and card.ability.extra.mult > 0 then
--         local mult = card.ability.extra.mult
--         return {
--           message = localize{type = 'variable', key = 'a_mult', vars = {mult}}, 
--           colour = G.C.MULT,
--           mult_mod = mult
--         }
--       end
--     end
--     return scaling_evo(self, card, context, "j_sonfive_dusknoir", card.ability.extra.mult, self.config.evo_rqmt)
--   end,
--   update = function(self, card, dt)
--     if G.STAGE == G.STAGES.RUN then
--         card.ability.extra.mult = (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.spectral or 0) * card.ability.extra.mult_mod
--     end
--   end,
--     add_to_deck = function(self, card, from_debuff)
--       G.E_MANAGER:add_event(Event({func = function()
--         for k, v in pairs(G.I.CARD) do
--             if v.set_cost then v:set_cost() end
--         end
--         return true end }))
--     end,
--     remove_from_deck = function(self, card, from_debuff)
--         G.E_MANAGER:add_event(Event({func = function()
--         for k, v in pairs(G.I.CARD) do
--             if v.set_cost then v:set_cost() end
--         end
--         return true end }))
--     end,
-- }

-- local dusknoir = {
--   name = "dusknoir", 
--   poke_custom_prefix = "sonfive",
--   pos = {x = 6, y = 6}, 
--   config = {extra = {Xmult_mod = 0.25, Xmult = 1}},
--   loc_vars = function(self, info_queue, card)
--     type_tooltip(self, info_queue, card)
--     local Xmult = 1 + (card.ability.extra.Xmult + card.ability.extra.Xmult_mod)
--     return {vars = {Xmult, card.ability.extra.Xmult_mod}}
--   end,
--   rarity = "poke_safari", 
--   cost = 7, 
--   stage = "Two", 
--   ptype = "Psychic",
--   atlas = "pokedex_4",
--   blueprint_compat = true,
--   calculate = function(self, card, context)
--     if context.cardarea == G.jokers and context.scoring_hand then
--       if context.joker_main then
--         local Xmult = 1 + card.ability.extra.Xmult * card.ability.extra.Xmult_mod
--         return {
--           message = localize{type = 'variable', key = 'a_xmult', vars = {Xmult}}, 
--           colour = G.C.MULT,
--           Xmult_mod = Xmult
--         }
--       end
--     end
--   end,
  
--   update = function(self, card, dt)
--     if G.STAGE == G.STAGES.RUN then
--         card.ability.extra.Xmult =  (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.spectral or 0)
--     end
--   end,

--     add_to_deck = function(self, card, from_debuff)
--       G.E_MANAGER:add_event(Event({func = function()
--         for k, v in pairs(G.I.CARD) do
--             if v.set_cost then v:set_cost() end
--         end
--         return true end }))
--     end,
--     remove_from_deck = function(self, card, from_debuff)
--         G.E_MANAGER:add_event(Event({func = function()
--         for k, v in pairs(G.I.CARD) do
--             if v.set_cost then v:set_cost() end
--         end
--         return true end }))
--     end,
-- }

-- local slugma={
--   name = "slugma",
--   poke_custom_prefix = "sonfive",
--   pos = {x = 6, y = 6},
--   config = {extra = {triggers = 0, evo_triggers = 5}},
--   loc_vars = function(self, info_queue, card)
--     type_tooltip(self, info_queue, card)
--     info_queue[#info_queue+1] = G.P_CENTERS.m_stone
--     return {vars = {card.ability.extra.evo_triggers, card.ability.extra.triggers}}
--   end,
--   rarity = 1,
--   cost = 3,
--   stage = "Basic",
--   ptype = "Fire",
--   atlas = "pokedex_2",
--   perishable_compat = true,
--   blueprint_compat = true,
--   eternal_compat = true,
--   calculate = function(self, card, context)
--     if context.first_hand_drawn then
--       local adjacent = 0
--       local adjacent_jokers = poke_get_adjacent_jokers(card)
--       for i = 1, #adjacent_jokers do
--         if is_type(adjacent_jokers[i], "Water") then adjacent = adjacent + 1 end
--       end
--       while adjacent > 0 do
--         card.ability.extra.triggers = card.ability.extra.triggers + 1
--         local _card = create_playing_card({front = pseudorandom_element(G.P_CARDS, pseudoseed('slugma')), center = G.P_CENTERS.m_stone}, G.hand, nil, nil, {G.C.RED})
--         playing_card_joker_effects({_card})
--         adjacent = adjacent - 1
--         if adjacent == 0 then
--           card:juice_up()
--         end
--       end
--     end
--     return scaling_evo(self, card, context, "j_sonfive_magcargo", card.ability.extra.triggers, card.ability.extra.evo_triggers)
--   end
-- }

-- local magcargo={ 
--   name = "magcargo",
--   poke_custom_prefix = "sonfive",
--   pos = {x = 7, y = 6},
--   config = {extra = {mult = 1}},
--   loc_vars = function(self, info_queue, card)
--     type_tooltip(self, info_queue, card)
--     info_queue[#info_queue+1] = G.P_CENTERS.m_stone
--     return {vars = {card.ability.extra.mult}}
--   end,
--   rarity = 3,
--   cost = 7,
--   stage = "One",
--   ptype = "Fire",
--   atlas = "pokedex_2",
--   perishable_compat = true,
--   blueprint_compat = true,
--   eternal_compat = true,
--   calculate = function(self, card, context)
--     if context.individual and context.cardarea == G.play and not context.other_card.debuff and not context.end_of_round and context.other_card.ability.name == 'Stone Card' then
--       local total = #find_pokemon_type("Fire")
--       if total > 0 then
--         context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) + (total * card.ability.extra.mult)
--         return {
--           message = localize('k_upgrade_ex'),
--           colour = G.C.MULT,
--           card = card,
--         }
--       end
--     end
--   end
-- }

local nacli = {
  name = "nacli",
  poke_custom_prefix = "sonfive",
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
  atlas = "pokedex_9",
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
  poke_custom_prefix = "sonfive",
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
  atlas = "pokedex_9",
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
  poke_custom_prefix = "sonfive",
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
  atlas = "pokedex_9",
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

list = {nacli, naclstack, garganacl}

return {name = "PokermonPlus1", 
list = list
}
