VGDEV_UTIL = {}
SMODS.Atlas {
    key = "Jokers",
    path = "jokers.png",
    px = 71,
    py = 95,
}
SMODS.Atlas {
    key = "Chase",
    path = "Chase.png",
    px = 71,
    py = 95,
}
SMODS.load_file("utilities/misc_functions.lua")()

-- load all individual jokers
local subdir = "jokers"
local cards = NFS.getDirectoryItems(SMODS.current_mod.path .. subdir)
for _, filename in pairs(cards) do
    assert(SMODS.load_file(subdir .. "/" .. filename))()
end
