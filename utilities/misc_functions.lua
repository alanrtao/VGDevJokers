---Returns the number of jokers owned
---@return number
function VGDEV_UTIL.get_num_jokers()
    local res = 0

    if G.jokers then
        for _, v in ipairs(G.jokers.cards) do
            res = res + 1
        end
    end

    return res
end
