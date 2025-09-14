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
        if not context.repetition and not context.individual and context.end_of_round and G.GAME.last_blind and G.GAME.last_blind.boss then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                local _card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, 'c_poke_nightmare')
                _card:add_to_deck()
                G.consumeables:emplace(_card)
                card_eval_status_text(_card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
            end
        end

        local a = card.ability.extra
        local energies = {"grass", "fire", "water", "lightning", "psychic", "fighting", "colorless", "darkness", "metal", "fairy", "dragon", "earth"}
        local types    = {"Grass", "Fire", "Water", "Lightning", "Psychic", "Fighting", "Colorless", "Dark", "Metal", "Fairy", "Dragon", "Earth"}

        if not context.blueprint then
            local darkrai_count = #find_joker("darkrai")
            local target_energy = {}
            for j = 1, #G.jokers.cards do
                target_energy[j] = {}
            end

            for i = 1, #energies do
                local energy_key = energies[i]
                local type_key   = types[i]
                local energy_amount = #find_joker(energy_key .. "_energy") * darkrai_count
                a[energy_key] = energy_amount

                for j = 1, #G.jokers.cards do
                    local joker = G.jokers.cards[j]
                    if is_type(joker, type_key) then
                        target_energy[j][energy_key] = energy_amount
                    end
                end
            end

            for j = 1, #G.jokers.cards do
                local joker = G.jokers.cards[j]
                for i = 1, #energies do
                    local energy_key = energies[i]
                    local type_key   = types[i]
                    local desired = target_energy[j][energy_key] or 0
                    local current = joker[energy_key] or 0
                    if current ~= desired then
                        local diff = desired - current
                        joker[energy_key] = desired
                        energy_shift(joker, diff, type_key, false, true, false)
                    end
                end
            end
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        local a = card.ability.extra
        local energies = {"grass", "fire", "water", "lightning", "psychic", "fighting", "colorless", "darkness", "metal", "fairy", "dragon", "earth"}
        local types    = {"Grass", "Fire", "Water", "Lightning", "Psychic", "Fighting", "Colorless", "Dark", "Metal", "Fairy", "Dragon", "Earth"}


        local target_energy = {}
        for j = 1, #G.jokers.cards do
            target_energy[j] = {}
            for i = 1, #energies do
                target_energy[j][energies[i]] = 0
            end
        end

        for j = 1, #G.jokers.cards do
            local joker = G.jokers.cards[j]
            for i = 1, #energies do
                local energy_key = energies[i]
                local type_key   = types[i]
                local current = joker[energy_key] or 0
                local desired = target_energy[j][energy_key]
                if current ~= desired then
                    local diff = desired - current
                    joker[energy_key] = desired
                    energy_shift(joker, diff, type_key, false, true, false)
                end
            end
        end

        for i = 1, #energies do
            a[energies[i]] = 0
        end
    end
}

if sonfive_config.Darkrai then
  list = {darkrai}
else list = {}
end

return {name = "Darkrai", 
list = list
}