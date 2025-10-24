SMODS.current_mod.config_tab = function() 
    local nodes = {}

    for i = 1, #sonfive_evo_lines do
        table.insert(nodes, create_toggle({
            label = localize(sonfive_evo_lines[i].."_line"),
            ref_table = sonfive_config,
            ref_value = sonfive_evo_lines[i]
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