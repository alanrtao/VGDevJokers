SMODS.Joker {
    key = 'barkane',
    loc_txt = {
        name = 'Marmalade',
        text = {
            "When hand is played with",
            "no {C:mult}discards{} remaining,",
            "Generate a {C:tarot}Magician{} card",
            "{C:inactive}(Must have room)"
        }
    },
    atlas = 'Barkane',
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = { x = 0, y = 0 },
    config = { extra = {
    } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['c_magician']
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main and G.GAME.current_round.discards_left == 0 then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                        local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_magician')
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                        G.GAME.consumeable_buffer = 0
                        card:juice_up(0.5, 0.5)
                        return true
                    end)
                }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                    { message = localize('k_plus_tarot'), colour = G.C.PURPLE })
            end
        end
    end
}
