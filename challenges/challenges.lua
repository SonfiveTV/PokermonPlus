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

local balls_of_steel = {
    object_type = "Challenge",
    key = "balls_of_steel",
    rules = {
        custom = {
            { id = 'no_shop_jokers' },
        },
    },
    jokers = {
        {id = "j_sonfive_meltan"},
    },
    consumeables = {
        {id = "c_sonfive_timerball"},
        {id = "c_sonfive_timerball"},
    },
    vouchers = {
        {id = "v_overstock_norm"},
        {id = "v_overstock_plus"},
        {id = "v_crystal_ball"},

    },
    restrictions = {
        banned_cards = {
            { id = 'c_poke_pokeball' },
            { id = 'c_poke_greatball' },
            { id = 'c_poke_ultraball' },
            { id = 'c_poke_masterball' },
            { id = 'c_judgement' },
            { id = 'c_wraith' },
            { id = 'c_soul' },
            { id = 'p_buffoon_normal_1', ids = {
                'p_buffoon_normal_1', 'p_buffoon_normal_2',
                'p_buffoon_normal_3', 'p_buffoon_normal_4',
                'p_buffoon_jumbo_1', 'p_buffoon_jumbo_2',
                'p_buffoon_mega_1', 'p_buffoon_mega_2' }
        }
    },
    banned_tags = {
            { id = 'tag_uncommon' },
            { id = 'tag_rare' },
            { id = 'tag_foil' },
            { id = 'tag_holographic' },
            { id = 'tag_negative' },
            { id = 'tag_polychrome' },
            { id = 'tag_buffoon' },
            { id = 'tag_top_up' },
            { id = 'tag_poke_shiny_tag' },
            { id = 'tag_poke_safari_tag' },
            { id = 'tag_poke_stage_one_tag' },
        }
    },
}


return {name = "Challenges",
        list = {
            salt_cured,
            balls_of_steel,
        }
}
