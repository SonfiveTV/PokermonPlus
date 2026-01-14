local status_test = {
    object_type = "Challenge",
    key = "status_test",
    rules = {
        custom = {
            {id = 'enable_sonfive_statuscondition'},
        },
    restrictions = {
        banned_cards = {}
    },
    }
}

list = {status_test}

return {name = "Challenges", 
list = list
}