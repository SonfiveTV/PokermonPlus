local croagunk = {
  name = "croagunk",
  config = {
    extra = {
      reset = true,
      retriggers = 0,
      evo_rqmt = 5
    }
  },
  loc_vars = function(self, info_queue, card)
    type_tooltip(self, info_queue, card)
    local a = card.ability.extra
    local retriggers, evo_rqmt = (a.retriggers or 0), a.evo_rqmt
    return {vars = {retriggers, evo_rqmt}}
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

    if context.discard and context.full_hand and #context.full_hand == 5 then
      if not a.handled then
        local all_purple = true
        for i = 1, #context.full_hand do
          if context.full_hand[i].seal ~= "Purple" then
            all_purple = false
            break
          end
        end

        if all_purple then
          a.retriggers = (a.retriggers or 0) + 1
        end
        a.handled = true
      end
    end

    -- or when you detect the discard phase isn't active:
    if not context.discard then
      a.handled = false
    end

    if context.repetition and not context.end_of_round and context.cardarea == G.play then
      if context.other_card.seal == "Purple" then
        local total = a.retriggers
        local cards = #context.scoring_hand
        local pos

        for i = 1, cards do
          if context.scoring_hand[i] == context.other_card then
            pos = i
            break
          end
        end

        local retriggers = math.floor(total / cards)
        local remainder = total % cards
        if pos <= remainder then retriggers = retriggers + 1 end

        return {
          message = localize('k_again_ex'),
          repetitions = retriggers,
          card = card
        }
      end
    end

    if context.after then
      a.retriggers = 0
    end

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