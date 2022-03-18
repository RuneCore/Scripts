local command = Command:new("setitem")

function command:execute(player, args)
    player:set_inventory_slot(INVENTORY.INVENTORY, 20, 12345, 1)
end
