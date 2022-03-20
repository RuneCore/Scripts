local command = Command:new("delitem")

function command:execute(player, args)
    -- Get the item as first parameter
    local item = args[1]

    -- Validate if the first argument was passed
    if item == nil then
        player:send_game_message("You must specify an item id as first argument")
        return
    end

    -- Get the second argument which is the item amount; this is optional, and defaults to 1
    local amount = tonumber(args[2]) or 1

    local item_id = tonumber(item)

    player:delete_inventory_item(INVENTORY.INVENTORY, item_id, amount)
end
