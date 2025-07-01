local wonder_guard = {
    object_type = "Challenge",
    key = "wonder_guard",
    rules = {
        custom = {
            {id = 'sonfive_wonderguard'},
        },
        modifiers = {
            {id = 'joker_slots', value = 6}
        }
    },
    restrictions = {
        banned_cards = {}
    },
    jokers = {
        {id = "j_sonfive_shedinja", eternal = true},
    }
}

if sonfive_config.Nincada then
  list = {wonder_guard}
else list = {}
end

return {name = "Challenges", 
list = list
}