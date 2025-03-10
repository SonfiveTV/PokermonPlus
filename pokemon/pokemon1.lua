local shuckle = {
    name = "shuckle",
    poke_custom_prefix = "sonfive",
    pos = {x =  1,  y = 6},
    config = {},
    loc_vars =  function(self, info_queue, center)
        type_tooltip(self, info_queue, center)
        info_queue[#info_queue+1] = G.P_CENTERS.c_sonfive_berryjuice
        info_queue[#info_queue+1] = {set = 'Other', key = 'designed_by', vars = {"Sonfive"}}
        return
    end,
    rarity = 2,
    cost = 4,
    ptype = "Grass",
    stage = "Basic",
    atlas = "pokedex_2",
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.setting_blind then
            if not from_debuff and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                local _card = create_card('Item', G.consumeables, nil, nil, nil, nil, 'c_sonfive_berryjuice')
                _card:add_to_deck()
                G.consumeables:emplace(_card)
                card_eval_status_text(_card, 'extra', nil, nil, nil, {message = localize('poke_plus_pokeitem'), colour = G.C.FILTER})
                return true
            end
        end
    end,
}

local duskull = {
  name = "duskull", 
  poke_custom_prefix = "sonfive",
  pos = {x = 6, y = 10}, 
  config = {extra = {mult_mod = 5, mult = 0}, evo_rqmt = 25},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
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
}

local dusclops = {
  name = "dusclops", 
  poke_custom_prefix = "sonfive",
  pos = {x = 7, y = 10}, 
  config = {extra = {mult_mod = 10, mult = 0}, evo_rqmt = 150},
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    local mult = card.ability.extra.mult
    return {vars = {mult, card.ability.extra.mult_mod}}
  end,
  rarity = 3, 
  cost = 7, 
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
    return scaling_evo(self, card, context, "j_sonfive_dusknoir", card.ability.extra.mult, self.config.evo_rqmt)
  end,
  update = function(self, card, dt)
    if G.STAGE == G.STAGES.RUN then
        card.ability.extra.mult = (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.spectral or 0) * card.ability.extra.mult_mod
    end
  end,
    add_to_deck = function(self, card, from_debuff)
      G.E_MANAGER:add_event(Event({func = function()
        for k, v in pairs(G.I.CARD) do
            if v.set_cost then v:set_cost() end
        end
        return true end }))
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({func = function()
        for k, v in pairs(G.I.CARD) do
            if v.set_cost then v:set_cost() end
        end
        return true end }))
    end,
}

local dusknoir = {
    name = "dusknoir", 
    poke_custom_prefix = "sonfive",
    pos = {x = 6, y = 6}, 
    config = {extra = {Xmult_mod = 0.25, Xmult = 1}},
    loc_vars = function(self, info_queue, card)
      type_tooltip(self, info_queue, card)
      local Xmult = 1 + (card.ability.extra.Xmult + card.ability.extra.Xmult_mod)
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
          card.ability.extra.Xmult =  (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.spectral or 0)
      end
    end,

      add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({func = function()
          for k, v in pairs(G.I.CARD) do
              if v.set_cost then v:set_cost() end
          end
          return true end }))
      end,
      remove_from_deck = function(self, card, from_debuff)
          G.E_MANAGER:add_event(Event({func = function()
          for k, v in pairs(G.I.CARD) do
              if v.set_cost then v:set_cost() end
          end
          return true end }))
      end,
  }


list = {shuckle}

return {name = "PokermonPlus1", 
list = list
}