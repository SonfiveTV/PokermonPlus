local actual_energy_use = energy_use
energy_use = function(center, card, area, copier)
    local saved_energy_values = {}
    if card.edition.negative then
        for _,joker in pairs(G.jokers.cards) do
            saved_energy_values[joker] = {normal = joker.ability.extra.energy_count, colorless = joker.ability.extra.c_energy_count}
        end
    end
    actual_energy_use(center, card, area, copier)
    for joker, energy in pairs(saved_energy_values) do
        joker.ability.extra.energy_count = energy.normal
        joker.ability.extra.c_energy_count = energy.colorless
    end
end

local actual_highlighted_energy_use = highlighted_energy_use
highlighted_energy_use = function(center, card, area, copier)
    local choice = G.jokers.highlighted[1]
    local energy_values = {normal = choice.ability.extra.energy_count, colorless = choice.ability.extra.c_energy_count}
    
    actual_highlighted_energy_use(center, card, area, copier)
    if card.edition.negative then
        choice.ability.extra.energy_count = energy.normal
        choice.ability.extra.c_energy_count =  energy.colorless
    end
end