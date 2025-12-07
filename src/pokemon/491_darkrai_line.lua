local darkrai = {
    name = "darkrai",
    config = {extra = {}},
    loc_vars = function(self, info_queue, card)
        type_tooltip(self, info_queue, card)
    end,
    designer = "Sonfive",
    rarity = 4,
    cost = 20,
    stage = "Legendary",
    ptype = "Dark",
    gen = 4,
    blueprint_compat = false,

    calculate = function(self, card, context)
        -- Spawn Spectral card if conditions are met
        if not context.repetition and not context.individual and context.end_of_round 
           and G.GAME.last_blind and G.GAME.last_blind.boss then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                local _card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, 'c_poke_nightmare')
                _card:add_to_deck()
                G.consumeables:emplace(_card)
                card_eval_status_text(_card, 'extra', nil, nil, nil, 
                    {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
            end
        end

        local a = card.ability.extra
        local energies = {"grass", "fire", "water", "lightning", "psychic", 
                          "fighting", "colorless", "darkness", "metal", "fairy", 
                          "dragon", "earth"}
        local types    = {"Grass", "Fire", "Water", "Lightning", "Psychic", 
                          "Fighting", "Colorless", "Dark", "Metal", "Fairy", 
                          "Dragon", "Earth"}

        if not context.blueprint then
            local darkrai_count = #find_joker("darkrai")

            -- Initialize Darkrai's snapshot
            if not a.darkrai_applied_energy then
                a.darkrai_applied_energy = {}
            end

            -- Step 1: Calculate desired energy per type
            for i = 1, #energies do
                local energy_key = energies[i]
                local desired = #find_joker(energy_key .. "_energy") * darkrai_count
                
                a[energy_key] = desired
                a.darkrai_applied_energy[energy_key] = desired
            end

            -- Step 2: Apply to jokers
            for j = 1, #G.jokers.cards do
                local joker = G.jokers.cards[j]

                joker.ability.extra = joker.ability.extra or {}
                if not joker.ability.extra.darkrai_applied then
                    joker.ability.extra.darkrai_applied = {}
                end

                for i = 1, #energies do
                    local energy_key = energies[i]
                    local type_key   = types[i]

                    local desired = a.darkrai_applied_energy[energy_key] or 0
                    local last_applied = joker.ability.extra.darkrai_applied[energy_key] or 0
                    local current = joker.ability.extra[energy_key] or 0

                    if is_type(joker, type_key) then
                        -- Joker matches this type → sync energies
                        if desired ~= last_applied then
                            local diff = desired - last_applied
                            if diff ~= 0 then
                                joker.ability.extra[energy_key] = current + diff
                                energize(joker, type_key, false, true, diff)
                            end
                            joker.ability.extra.darkrai_applied[energy_key] = desired
                        end
                    else
                        -- Joker no longer this type → remove old Darkrai-applied energy
                        if last_applied > 0 then
                            joker.ability.extra[energy_key] = current - last_applied
                            energize(joker, type_key, false, true, -last_applied)
                            joker.ability.extra.darkrai_applied[energy_key] = 0
                        end
                    end
                end
            end
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        local a = card.ability.extra
        local energies = {"grass", "fire", "water", "lightning", "psychic", 
                          "fighting", "colorless", "darkness", "metal", "fairy", 
                          "dragon", "earth"}

        for j = 1, #G.jokers.cards do
            local joker = G.jokers.cards[j]
            joker.ability.extra = joker.ability.extra or {}
            local applied = joker.ability.extra.darkrai_applied or {}

            for i = 1, #energies do
                local energy_key = energies[i]
                local last_applied = applied[energy_key] or 0
                if last_applied > 0 then
                    local current = joker.ability.extra[energy_key] or 0
                    joker.ability.extra[energy_key] = current - last_applied
                    energize(joker, energy_key, false, true, -last_applied)
                    applied[energy_key] = 0
                end
            end
        end

        -- Clear Darkrai's own stored snapshot
        a.darkrai_applied_energy = {}
    end
}


list = {darkrai}

return {name = "Darkrai", 
list = list
}