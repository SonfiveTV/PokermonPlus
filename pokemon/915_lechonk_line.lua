local lechonk = {
    name = "lechonk",
    config = {
        extra = {
            starting_money = 0,
            percentage = 1.25,
            selling = false, -- internal flag to block siphon while selling
            rounds = 5,
        }
    },

    loc_vars = function(self, info_queue, card)
        type_tooltip(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.rounds,             -- built-up sell value
                (card.ability.extra.percentage * 100)       -- % multiplier
            }
        }
    end,

    designer = "Sonfive",
    rarity = 1,
    cost = 6,
    stage = "Basic",
    ptype = "Colorless",
    gen = 9,
    blueprint_compat = false,
    poke_custom_values_to_keep = {"starting_money", "selling"},
    add_to_deck = function(self, card, from_debuff)
        if G.STAGE == G.STAGES.RUN then
            card.ability.extra.starting_money = G.GAME.dollars
            card.ability.extra.selling = false
            card:set_cost()
        end
    end,

    update = function(self, card, dt)
        if G.STAGE == G.STAGES.RUN and not card.ability.extra.selling then
            self:calculate(card, {selling_self = false})
        end
    end,

    calculate = function(self, card, context)
        if context.blueprint then return end

        -- block siphon during actual selling
        if context.selling_self or (context.cardarea ~= G.jokers) then
            card.ability.extra.selling = true
            return
        end


        local a = card.ability.extra
        local current_money = G.GAME.dollars

        if context.cardarea == G.jokers then 

            if current_money > a.starting_money then
                local earned = current_money - a.starting_money

                -- siphon the earned money away from player
                G.GAME.dollars = a.starting_money

                -- store as Lechonk’s sell value (with multiplier)
                card.ability.extra_value = (card.ability.extra_value or 0) + (earned * a.percentage)

                -- reset baseline
                a.starting_money = G.GAME.dollars  

                card:set_cost()

                G.E_MANAGER:add_event(Event({
                    func = function()
                        card_eval_status_text(card, 'extra', nil, nil, nil,
                            {message = localize('k_val_up')})
                        return true
                    end
                }))
            elseif current_money < a.starting_money then
                -- adjust baseline down when money is spent
                a.starting_money = current_money
            end
        end
        return level_evo(self, card, context, "j_sonfive_oinkologne")
    end,
}


local oinkologne = {
    name = "oinkologne",
    config = {
        extra = {
            starting_money = 0,
            percentage = 1.25,
            selling = false, -- internal flag to block siphon while selling
            interest = 1.01,
            rounds = 5,
        }
    },

    loc_vars = function(self, info_queue, card)
        type_tooltip(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.interest,          
                (card.ability.extra.percentage * 100),     -- % multiplier
                
            }
        }
    end,
    atlas = "AtlasJokersBasicGen09",
    pos = {x = 0, y = 0},
    designer = "Sonfive",
    rarity = "poke_safari",
    cost = 8,
    stage = "One",
    ptype = "Colorless",
    gen = 9,
    blueprint_compat = false,

    add_to_deck = function(self, card, from_debuff)
        if G.STAGE == G.STAGES.RUN then
            card.ability.extra.starting_money = G.GAME.dollars
            card.ability.extra.selling = false
            card:set_cost()
        end
    end,

    update = function(self, card, dt)
        if G.STAGE == G.STAGES.RUN and not card.ability.extra.selling then
            self:calculate(card, {selling_self = false})
        end
    end,

    calculate = function(self, card, context)
        if context.blueprint then return end

        -- block siphon during actual selling
        if context.selling_self or (context.cardarea ~= G.jokers) then
            card.ability.extra.selling = true
            return
        end  
        if not context.repetition and not context.individual and context.end_of_round and not context.blueprint then
            local a = card.ability.extra
            local fixed = card.sell_cost or 0
            local extra = card.ability.extra_value or 0
            local interest = a.interest or 0  -- fallback to 0 if not set

            -- increase extra_value so total sell grows by interest %
            card.ability.extra_value = (fixed + extra) * (interest) - fixed

            -- refresh card cost to update visuals
            card:set_cost()

            -- optional feedback
            G.E_MANAGER:add_event(Event({
                func = function()
                    card_eval_status_text(card, 'extra', nil, nil, nil,
                        {message = localize('k_val_up')})
                    return true
                end
            }))
        end



        local a = card.ability.extra
        local current_money = G.GAME.dollars

        if context.cardarea == G.jokers then 

            if current_money > a.starting_money then
                local earned = current_money - a.starting_money

                -- siphon the earned money away from player
                G.GAME.dollars = a.starting_money

                -- store as oinkologne’s sell value (with multiplier)
                card.ability.extra_value = (card.ability.extra_value or 0) + (earned * a.percentage)

                -- reset baseline
                a.starting_money = G.GAME.dollars  

                card:set_cost()

                G.E_MANAGER:add_event(Event({
                    func = function()
                        card_eval_status_text(card, 'extra', nil, nil, nil,
                            {message = localize('k_val_up')})
                        return true
                    end
                }))
            elseif current_money < a.starting_money then
                -- adjust baseline down when money is spent
                a.starting_money = current_money
            end
        end
    end,
}

if sonfive_config.Lechonk then
  list = {lechonk, oinkologne}
else list = {}
end

return {name = "Lechonk", 
list = list
}