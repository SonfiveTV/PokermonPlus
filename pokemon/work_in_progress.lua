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

local duskull = {
  name = "duskull", 
  poke_custom_prefix = "sonfive",
  pos = {x = 6, y = 10}, 
  config = {extra = {mult_mod = 5, mult = 0}, evo_rqmt = 25},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"vagabond_aeon"}}
    local mult = card.ability.extra.mult
    return {vars = {mult, card.ability.extra.mult_mod}}
  end,
  rarity = 2, 
  cost = 5, 
  stage = "Basic", 
  ptype = "Psychic",
  atlas = "pokedex_3",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main and card.ability.extra.mult > 0 then
        local mult = card.ability.extra.mult
        return {
          message = localize{type = 'variable', key = 'a_mult', vars = {mult}}, 
          colour = G.C.MULT,
          mult_mod = mult
        }
      end
    end
    return scaling_evo(self, card, context, "j_sonfive_dusclops", card.ability.extra.mult, self.config.evo_rqmt)
  end,
  update = function(self, card, dt)
    if G.STAGE == G.STAGES.RUN then
        card.ability.extra.mult = (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.spectral or 0) * card.ability.extra.mult_mod
    end
  end,
      add_to_deck = function(self, card, from_debuff)
      G.GAME.spectral_rate = G.GAME.spectral_rate + 1
    end,
    remove_from_deck = function(self, card, from_debuff)
      G.GAME.spectral_rate = G.GAME.spectral_rate - 1
    end,
}

local dusclops = {
  name = "dusclops", 
  poke_custom_prefix = "sonfive",
  pos = {x = 7, y = 10}, 
  config = {extra = {mult_mod = 10, mult = 0}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"vagabond_aeon"}}
    local mult = card.ability.extra.mult
    return {vars = {mult, card.ability.extra.mult_mod}}
  end,
  rarity = 3, 
  cost = 7, 
  item_req = "linkcable",
  stage = "One", 
  ptype = "Psychic",
  atlas = "pokedex_3",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main and card.ability.extra.mult > 0 then
        local mult = card.ability.extra.mult
        return {
          message = localize{type = 'variable', key = 'a_mult', vars = {mult}}, 
          colour = G.C.MULT,
          mult_mod = mult
        }
      end
    end
    return item_evo(self, card, context, "j_sonfive_dusknoir")
  end,
  update = function(self, card, dt)
    if G.STAGE == G.STAGES.RUN then
        card.ability.extra.mult = (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.spectral or 0) * card.ability.extra.mult_mod
    end
  end,
    add_to_deck = function(self, card, from_debuff)
      G.GAME.spectral_rate = G.GAME.spectral_rate + 2
    end,
    remove_from_deck = function(self, card, from_debuff)
      G.GAME.spectral_rate = G.GAME.spectral_rate - 2
    end,
}

local dusknoir = {
  name = "dusknoir", 
  poke_custom_prefix = "sonfive",
  pos = {x = 6, y = 6}, 
  config = {extra = {Xmult_mod = 0.25, Xmult = 1}},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"vagabond_aeon"}}
    local Xmult = card.ability.extra.Xmult
    return {vars = {Xmult, card.ability.extra.Xmult_mod}}
  end,
  rarity = "poke_safari", 
  cost = 7, 
  stage = "Two", 
  ptype = "Psychic",
  atlas = "pokedex_4",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main then
        local Xmult = 1 + card.ability.extra.Xmult * card.ability.extra.Xmult_mod
        return {
          message = localize{type = 'variable', key = 'a_xmult', vars = {Xmult}}, 
          colour = G.C.MULT,
          Xmult_mod = Xmult
        }
      end
    end
  end,
  
  update = function(self, card, dt)
    if G.STAGE == G.STAGES.RUN then
        card.ability.extra.Xmult =  1 + ((G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.spectral or 0) * card.ability.extra.Xmult_mod)
    end
  end,

    add_to_deck = function(self, card, from_debuff)
      G.GAME.spectral_rate = G.GAME.spectral_rate + 3
    end,
    remove_from_deck = function(self, card, from_debuff)
      G.GAME.spectral_rate = G.GAME.spectral_rate - 3
    end,
}

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

-- Magmar 126
local vullaby ={
  name = "vullaby", 
  poke_custom_prefix = "sonfive",
  pos = {x = 9, y = 9}, 
  config = {extra = {mult = 0, mult_mod = 3, flush = 0, evo_rqmt = 1}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {vars = {center.ability.extra.mult}}
  end,
  rarity = 3, 
  cost = 7, 
  stage = "Basic", 
  ptype = "Colorless",
  atlas = "pokedex_5",
  blueprint_compat = false,
  calculate = function(self, card, context)
    local abbr = card.ability.extra
    if context.first_hand_drawn then
      local eval = function() return G.GAME.current_round.hands_played == 0 end
      juice_card_until(card, eval, true)
    end
    if context.individual and context.cardarea == G.play and context.scoring_hand and G.GAME.current_round.hands_played == 0 then
      for i = 1, #context.scoring_hand do
        SMODS.debuff_card(context.scoring_hand[i], true, card.config.center.key)
        abbr.mult = abbr.mult + abbr.mult_mod
      end
        elseif context.joker_main then
          if context.individual and context.cardarea == G.play and #context.full_hand == 5 then
            local count = 0
            for i = 1, #context.full_hand do 
              if context.full_hand[i].debuff then 
                count = count + 1
                if count == 5 then 
                  card.ability.extra.flush = 1
                end
              end            
          end
        end
        return {
          message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
          colour = G.C.MULT,
          mult_mod = card.ability.extra.mult
        }
      end
    return scaling_evo(self, card, context, "j_sonfive_mandibuzz", card.ability.extra.flush, card.ability.extra.evo_rqmt)
  end
}

local mandibuzz ={
  name = "mandibuzz", 
  poke_custom_prefix = "sonfive",
  pos = {x = 10, y = 9}, 
  config = {extra = {mult = 0, mult_mod = 3}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {vars = {center.ability.extra.mult}}
  end,
  rarity = 3, 
  cost = 7, 
  stage = "One", 
  ptype = "Colorless",
  atlas = "pokedex_5",
  blueprint_compat = false,
  calculate = function(self, card, context)
    local abbr = card.ability.extra
    if context.first_hand_drawn then
      local eval = function() return G.GAME.current_round.hands_played == 0 end
      juice_card_until(card, eval, true)
    end
    if context.individual and context.cardarea == G.play and context.scoring_hand and G.GAME.current_round.hands_played == 0 then
      for i = 1, #context.scoring_hand do
        SMODS.debuff_card(context.scoring_hand[i], true, card.config.center.key)
        abbr.mult = abbr.mult + abbr.mult_mod

      end
      elseif context.joker_main then
          return {
            message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}, 
            colour = G.C.MULT,
            mult_mod = card.ability.extra.mult
          }
      end
  end
}

list = {}

return {name = "Testing", 
list = list
}
