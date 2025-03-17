SMODS.Joker {
    key = "delonic",
    loc_txt = {
        ['name'] = 'Delonic Award',
        ['text'] = {
            "Retrigger all played {C:attention}Bonus Cards{}"
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Chase',

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_bonus
        return
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and not context.repetition_only and context.other_card.config.center.key == "m_bonus" then
            return {
                message = localize('k_again_ex'),
                repetitions = 1,
                card = card
            }
        end
    end

}
