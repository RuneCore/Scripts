local command = Command:new("getitem")

function command:execute(player, args)
    local item_slot = args[1]

    -- validate if the first argument was passed
    if item_slot == nil then
        player:send_game_message("You must specify an item slot as first argument")
        return
    end

    -- get the item from the inventory slot
    local item = player:get_inventory_slot(INTERFACES.PLAYER_INVENTORY, item_slot)
    if item == nil then
        player:send_game_message("Item in slot " .. item_slot .. " was not found")
        return
    end

    -- send the item's details to the player
    player:send_game_message(
        "Item in slot " .. item_slot .. " was found, its id is " .. item[1] .. " and its amount is " .. item[2]
    )
end
