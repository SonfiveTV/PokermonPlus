local salt_cured = {
    object_type = "Challenge",
    key = "salt_cured",
    jokers = {
        {id = "j_sonfive_nacli", eternal = true},
        {id = "j_poke_corsola", eternal = true, edition = "poke_shiny"},
    },
    consumeables = {
        {id = "c_poke_metalcoat"},
        {id = "c_poke_waterstone"},
    },
}

list = {salt_cured}

return {name = "Challenges", 
list = list
}