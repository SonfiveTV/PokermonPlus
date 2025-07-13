local metallurgy = {
    object_type = "Challenge",
    key = "metallurgy",
    jokers = {
        {id = "j_sonfive_meltan"},
    },
    consumeables = {
        {id = "c_poke_metalcoat"},
        {id = "c_poke_metalcoat"},
    },
    
}


if sonfive_config.customJokers and sonfive_config.Meltan then
  list = {metallurgy}
else list = {}
end

return {name = "Challenges", 
list = list
}