SMODS.Joker {
    key = 'network',
    loc_txt = {
        name = 'Network is Networth',
        text = {
            "Earn {C:money}$#1#{} at end",
            "of round for each",
            "{C:attention}Joker{} card owned",
            "{C:inactive}(Currently{} {C:money}$#2#{}{C:inactive}){}"
        }
    },
    atlas = 'Jokers',
    rarity = 1,
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pos = { x = 0, y = 0 },
    config = { extra = {
        money_per_joker = 1,
    } },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.money_per_joker,
                math.max(0, VGDEV_UTIL.get_num_jokers() * card.ability.extra.money_per_joker)
            }
        }
    end,

    calc_dollar_bonus = function(self, card)
        return math.max(0, VGDEV_UTIL.get_num_jokers() * card.ability.extra.money_per_joker)
    end
}
