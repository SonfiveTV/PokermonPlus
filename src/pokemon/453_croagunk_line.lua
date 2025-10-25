local croagunk = {
  name = "croagunk",
  config = {
    extra = {
      reset = true,
      retriggers = 0,
      previous_tarot = "Not set!",
      evo_rqmt = 5
    }
  },
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    local a = card.ability.extra
    local retriggers, evo_rqmt, last_tarot = a.retriggers, a.evo_rqmt

    -- Display last used Tarot name if available
    if type(a.previous_tarot) == "string" and G.P_CARDS[a.previous_tarot] then
      local prev = G.P_CARDS[a.previous_tarot]
      last_tarot = localize { type = 'name_text', key = prev.key, set = prev.set }
    else
      last_tarot = localize('poke_none')
    end

    return {vars = {retriggers, last_tarot, evo_rqmt}}
  end,

  designer = "Sonfive",
  rarity = 2,
  cost = 5,
  stage = "Basic",
  ptype = "Dark",
  blueprint_compat = true,
  poke_custom_values_to_keep = {"retriggers", "previous_tarot"},

  calculate = function(self, card, context)
    local a = card.ability.extra

    -- When a Tarot consumable is used
    if context.using_consumeable and not context.blueprint and context.consumeable and context.consumeable.ability then
      if a.previous_tarot == context.consumeable.config.center_key then
        a.retriggers = (a.retriggers or 0) + 1
      else
        a.retriggers = 1
        a.previous_tarot = context.consumeable.config.center_key
      end
      a.reset = false
    end

    -- When a Purple-sealed card is played, retrigger it
    if context.repetition and context.cardarea == G.play and not context.other_card.debuff then
      if context.other_card.seal == "Purple" then
        return {
          message = localize('k_again_ex'),
          repetitions = a.retriggers,
          card = card
        }
      end
    end

    -- Reset retrigger counter at end of round
    if context.end_of_round and not context.blueprint then
      if a.reset then
        a.retriggers = 0
        a.previous_tarot = "Not set!"
      else
        a.reset = true
      end
    end

    -- Handle evolution scaling logic
    return scaling_evo(self, card, context, "j_sonfive_toxicroak", a.retriggers, a.evo_rqmt)
  end
}


local toxicroak = {
  name = "toxicroak",
  config = {
    extra = {
      reset = true,
      card_limit = 1,
      retriggers = 0, 
      previous_tarot = "None", 
    }
  },
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    local a = card.ability.extra
    local retriggers, card_limit, last_tarot = a.retriggers, a.card_limit
    if type(a.previous_tarot) == "table" and a.previous_tarot.key and a.previous_tarot.set then
      last_tarot = localize { type = 'name_text', key = a.previous_tarot.key, set = a.previous_tarot.set }
    else
      last_tarot = localize('poke_none')
    end
    return {vars = {
      retriggers, 
      last_tarot,
    }}
  end,
  designer = "Sonfive",
  rarity = "poke_safari",
  cost = 8,
  stage = "One",
  ptype = "Dark",
  blueprint_compat = true,
  calculate = function(self, card, context)
    local a = card.ability.extra
    if context.using_consumeable and not context.blueprint then
      if context.consumeable.ability.key == a.previous_tarot then
        a.retriggers = (a.retriggers or 0) + 1
      else
        a.retriggers = 1
        a.previous_tarot = context.consumeable.ability.key
      end
      a.reset = false
    elseif context.repetition and context.cardarea == G.play and not context.other_card.debuff then
      if context.other_card.seal == "Purple" then
          return {
            message = localize('k_again_ex'),
            repetitions = a.retriggers,
            card = card
          }
      end
    elseif (context.end_of_round and G.GAME.blind.boss) and not context.repetition and not context.individual and not context.blueprint then
      a.retriggers = a.reset and 0 or a.retriggers
    end
  end
}

list = {croagunk, toxicroak}

return {name = "Croagunk", 
list = list
}