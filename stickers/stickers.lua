local rocket = { 
    key = 'rocket',
    apply = function(self, card, val)
        card.ability[self.key] = val
    end,

    badge_colour = HEX('2b2b2b'),
        order = 5,
    pos = {x = 0, y = 0},
    atlas = 'stickers',
    calculate = function(self,card,context)
        if (context.post_joker--[[post_joker]] and card.ability.set == "Joker") or (context.main_scoring and context.cardarea == G.play and (card.ability.set == 'Enhanced' or card.ability.set == 'Default')) then
			return {
                Xmult_mod = 2,
                message = localize { type = 'variable', key = 'a_xmult', vars = { 2 } }
            }
		end


	end,
}

local ex = { 
    key = 'ex',
    apply = function(self, card, val)
        card.ability[self.key] = val
        if card.ability.extra then
        card.ability.extra.energy_count = (energy_max + (G.GAME.energy_plus or 0))
        if type(card.ability.extra) == "table" then
            energy_shift(card, (energy_max + (G.GAME.energy_plus or 0)), card.ability.extra.ptype, false, true)
        end
    end
    end,

    badge_colour = HEX('0097a7'),
        order = 5,
    pos = {x = 1, y = 0},
    atlas = 'stickers',
    calculate = function(self,card,context)
        if not context.end_of_round and card.ability.extra.energy_count == 0 then 
            card.debuff = true
        else
            card.debuff = false
            if context.setting_blind and not context.individual and not context.repetition then
                energy_shift(card, -1, card.ability.extra.ptype, false, true)
                card.ability.extra.energy_count = (card.ability.extra.energy_count - 1)
            end
		end
	end,
}

local perfect = { 
    key = 'perfect',
    apply = function(self, card, val)
        card.ability[self.key] = val
        if card.ability.extra then
        card.ability.extra.energy_count = (energy_max + (G.GAME.energy_plus or 0))
        if type(card.ability.extra) == "table" then
            energy_shift(card, (energy_max + (G.GAME.energy_plus or 0)), card.ability.extra.ptype, false, true)
        end
        card.ability.extra.energy_count = 0
    end
    end,

    badge_colour = HEX('0097a7'),
        order = 5,
    pos = {x = 1, y = 0},
    atlas = 'stickers',
}

return {name = "Stickers",
      list = {ex}
}