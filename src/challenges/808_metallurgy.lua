local metallurgy = {
    object_type = "Challenge",
    key = "metallurgy",
    rules = {
        custom = {
            { id = 'no' },
        },
    },
    jokers = {
        {id = "j_sonfive_meltan"},
    },
    consumeables = {
        {id = "c_poke_metalcoat"},
        {id = "c_poke_metalcoat"},
    },
    
}


list = {metallurgy}

return {name = "Challenges", 
list = list
}