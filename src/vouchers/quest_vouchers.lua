local heatran = {
	key = "heatran",
	atlas = "questbook",
    order = 37,
    set = "Voucher",
    pos = { x = 1, y = 1 },
    config = {extra = {}},
    discovered = true,
    unlocked = true,
    available = true,
    no_collection = true,
    cost = 10,
    in_pool = function(self)
        return false
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] =
        create_badge('Quest', HEX('582312'), G.C.WHITE, 1)
    end,
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.name } }
	end,
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
        func = function()
            sonfive_set_next_boss('bl_sonfive_heatran_boss')
            G.GAME.active_quest = 'heatran'
            return true
        end
        }))
    end,
    unredeem = function(self, card)
        G.E_MANAGER:add_event(Event({
        func = function()
            G.GAME.active_quest = nil
            return true
        end
        }))
    end,
}

local darkrai = {
	key = "darkrai",
	atlas = "questbook",
    order = 38,
    set = "Voucher",
    pos = { x = 2, y = 1 },
    config = {extra = {}},
    discovered = true,
    unlocked = true,
    available = true,
    no_collection = true,
    cost = 10,
    in_pool = function(self)
        return false
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] =
        create_badge('Quest', HEX('582312'), G.C.WHITE, 1)
    end,
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.name } }
	end,
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
        func = function()
            sonfive_set_next_boss('bl_sonfive_darkrai_boss')
            G.GAME.active_quest = 'darkrai'
            return true
        end
        }))
    end,
    unredeem = function(self, card)
        G.E_MANAGER:add_event(Event({
        func = function()
            G.GAME.active_quest = nil
            return true
        end
        }))
    end,
}

local meltan = {
	key = "meltan",
	atlas = "questbook",
    order = 39,
    set = "Voucher",
    pos = { x = 3, y = 1 },
    config = {extra = {}},
    discovered = true,
    unlocked = true,
    available = true,
    no_collection = true,
    cost = 10,
    in_pool = function(self)
        return false
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] =
        create_badge('Quest', HEX('582312'), G.C.WHITE, 1)
    end,
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.name } }
	end,
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
        func = function()
            sonfive_set_next_boss('bl_sonfive_meltan_boss')
            G.GAME.active_quest = 'meltan'
            return true
        end
        }))
    end,
    unredeem = function(self, card)
        G.E_MANAGER:add_event(Event({
        func = function()
            G.GAME.active_quest = nil
            return true
        end
        }))
    end,
}


return {name = "Quest Vouchers",
        list = {heatran, darkrai, meltan}
}