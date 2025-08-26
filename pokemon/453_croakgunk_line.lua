local croagunk={
  name = "croagunk", 
  pos = {x = 10, y = 4}, 
  config = {extra = {odds = 5}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {vars = {(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds}}
  end,
  rarity = 1, 
  cost = 4,
  stage = "Basic", 
  ptype = "Dark",
  atlas = "Pokedex4",
  gen = 4,
  blueprint_compat = true,
  calculate = function(self, card, context)
    local a = card.ability.extra

    if context.individual and context.cardarea == G.play and context.scoring_hand and not context.blueprint and
    pseudorandom('croagunk') < G.GAME.probabilities.normal/a.odds then
      local card_to_copy = nil
      for k, v in ipairs(context.scoring_hand) do
          G.E_MANAGER:add_event(Event({
              func = function()
                  local copy = copy_card(v, nil, nil, G.playing_card)
                  copy:set_ability(G.P_CENTERS.m_poke_hazard, true)
                  poke_add_card(copy, card)
                  return true
              end
          }))
        end
      if card_to_copy then
        return {
          message = localize('k_copied_ex'),
          colour = G.C.CHIPS,
          card = card,
          playing_cards_created = {true}
        }
      end
    end
  end
}

list = {}
return {name = "Croagunk", 
list = list

}