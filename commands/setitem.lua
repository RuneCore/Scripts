local command = Command:new("setitem")

function command:execute(player, args)
    local slot = tonumber(args[1])
    local item = tonumber(args[2])
    local amount = tonumber(args[3])

    player:set_inventory_slot(INVENTORY.INVENTORY, slot, item, amount)
end
