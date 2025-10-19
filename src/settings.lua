SMODS.current_mod.config_tab = function() 
    local evo_lines = {
        "nincada", 
        "darkrai", 
        "vullaby", 
        "meltan", 
        "stonjourner", 
        "lechonk", 
        "nacli", 
        "cetoddle"
    }

    local nodes = {}

    for i = 1, #evo_lines do
        table.insert(nodes, create_toggle({
            label = localize(evo_lines[i].."_line"),
            ref_table = sonfive_config,
            ref_value = evo_lines[i]
        }))
    end

    table.insert(nodes, create_toggle({
        label = localize("custom_consumeables"),
        ref_table = sonfive_config,
        ref_value = "customItems",
    }))

    return {
        n = G.UIT.ROOT,
        config = {
            align = "cm",
            padding = 0.05,
            colour = G.C.CLEAR,
        },
        nodes = nodes,
    }
end