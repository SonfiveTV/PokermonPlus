local wonder_guard = {
    object_type = "Challenge",
    key = "wonder_guard",
    rules = {
        custom = {
            {id = 'sonfive_wonderguard'},
        },
        modifiers = {
            {id = 'hand_size', value = 8}
        }
    },
    restrictions = {
        banned_cards = {}
    },
    jokers = {
        {id = "j_sonfive_shedinja", eternal = true},
    }
}

if sonfive_config.customJokers and sonfive_config.Nincada then
  list = {wonder_guard}
else list = {}
end

return {name = "Challenges", 
list = list
}