local canari_plush = {
  name = "canari_plush",
  config = {extra = {
    red = 0,
    red_current = 0,
    gold = 0,
    gold_current = 0,
    purple = 0,
    purple_current = 0,
    blue = 0,
    blue_current = 0,
    pink = 0,
    pink_current = 0,
    silver = 0,
    silver_current = 0,
  }},
  loc_vars = function(self, info_queue, card)
        type_tooltip(self, info_queue, card)
        local a = card.ability.extra
        local vars = {}
        vars[1] = a.red_current
        vars[2] = (canari_level(a.red) == 3 and "MAXED") or tostring(math.min((a.red or 0), 8) .. "/" .. canari_goal(a.red_current))
        vars[3] = a.blue_current
        vars[4] = (canari_level(a.blue) == 3 and "MAXED") or tostring(math.min((a.blue or 0), 8) .. "/" .. canari_goal(a.blue_current))
        vars[5] = a.gold_current
        vars[6] = (canari_level(a.gold) == 3 and "MAXED") or tostring(math.min((a.gold or 0), 8) .. "/" .. canari_goal(a.gold_current))
        vars[7] = a.purple_current
        vars[8] = (canari_level(a.purple) == 3 and "MAXED") or tostring(math.min((a.purple or 0), 8) .. "/" .. canari_goal(a.purple_current))
        vars[9] = a.pink_current
        vars[10] = (canari_level(a.pink) == 3 and "MAXED") or tostring(math.min((a.pink or 0), 8) .. "/" .. canari_goal(a.pink_current))
        vars[11] = a.silver_current
        vars[12] = (canari_level(a.silver) == 3 and "MAXED") or tostring(math.min((a.silver or 0), 8) .. "/" .. canari_goal(a.silver_current))
        return {vars = vars}
    
  end,
  designer = "Sonfive",
  rarity = 3,
  cost = 8,
  stage = "Other",
  atlas = "sonfive_mega",
  pos = {x = 2, y = 0},
  blueprint_compat = false,
  calculate = function(self, card, context)
    local a = card.ability.extra
    local message_card = context.blueprint_card or card

    if context.remove_playing_cards  then
        for k, v in ipairs(context.removed) do

            if v.seal == "Red" then
                a.red = a.red + 1
                if canari_level(a.red) > a.red_current then
                    G.GAME.round_resets.discards = G.GAME.round_resets.discards + (canari_level(a.red) - a.red_current)
                    a.red_current = canari_level(a.red)
                    if not (canari_level(a.red) == 3) then a.red = 0 end
                end
                card:juice_up()
            end

            if v.seal == "Blue" then
                a.blue = a.blue + 1
                if canari_level(a.blue) > a.blue_current then
                    G.GAME.round_resets.hands = G.GAME.round_resets.hands + (canari_level(a.blue) - a.blue_current)
                    a.blue_current = canari_level(a.blue)
                    if not (canari_level(a.blue) == 3) then a.blue = 0 end
                end
                card:juice_up()
            end

            if v.seal == "Gold" then 
                a.gold = a.gold + 1
                if canari_level(a.gold) > a.gold_current then
                    G.GAME.interest_cap = G.GAME.interest_cap + (5 * (canari_level(a.gold) - a.gold_current))
                    a.gold_current = canari_level(a.gold )
                    if not (canari_level(a.gold) == 3) then a.gold = 0 end
                end
                card:juice_up()
            end

            if v.seal == "Purple" then
                a.purple = a.purple + 1
                if canari_level(a.purple) > a.purple_current then
                    G.GAME.scry_amount = (G.GAME.scry_amount or 0) + (canari_level(a.purple) - a.purple_current)
                    a.purple_current = canari_level(a.purple)
                    if not (canari_level(a.purple) == 3) then a.purple = 0 end
                end
                card:juice_up()
            end

            if v.seal == "poke_pink_seal" then
                a.pink = a.pink + 1
                if canari_level(a.pink) > a.pink_current then
                    if not G.GAME.energy_plus then
                        G.GAME.energy_plus = (canari_level(a.pink) - a.pink_current)
                    else
                        G.GAME.energy_plus = G.GAME.energy_plus + (canari_level(a.pink) - a.pink_current)
                    end
                    a.pink_current = canari_level(a.pink)
                    if not (canari_level(a.pink) == 3) then a.pink = 0 end
                end
                card:juice_up()
            end
            
            if v.seal == "poke_silver" then
                a.silver = a.silver + 1
                if canari_level(a.silver) > a.silver_current then
                    G.consumeables.config.card_limit = G.consumeables.config.card_limit + (canari_level(a.silver) - a.silver_current)
                    a.silver_current = canari_level(a.silver)
                    if not (canari_level(a.silver) == 3) then a.silver = 0 end

                end
                card:juice_up()
            end
            
        end
      
    end
  end,

  remove_from_deck = function(self, card, from_debuff)
    local a = card.ability.extra
    G.E_MANAGER:add_event(Event({func = function()
            G.consumeables.config.card_limit = G.consumeables.config.card_limit - canari_level(a.silver)
            return true end }))
    G.GAME.round_resets.discards = G.GAME.round_resets.discards - a.red_current
    G.GAME.interest_cap = G.GAME.interest_cap - (5 * a.gold_current)
    G.GAME.scry_amount = (G.GAME.scry_amount or 0) - a.purple_current
    G.GAME.round_resets.hands = G.GAME.round_resets.hands - a.blue_current
    if not G.GAME.energy_plus then
        G.GAME.energy_plus = - a.pink_current
    else
        G.GAME.energy_plus = G.GAME.energy_plus - a.pink_current
    end
  end,

}

local list = {canari_plush}

return {name = "Canari Plush",
list = list
}