local command = Command:new("item")

function command:execute(player, args)
    local function find_item_id_by_name(item_name)
        local item_names = {}
        item_names["blue_partyhat"] = 1042

        return item_names[item_name]
    end

    -- Get the item as first parameter
    -- This can be a name or an id
    local item = args[1]

    -- Validate if the first argument was passed
    if item == nil then
        player:send_game_message("You must specify an item name or id as first argument")
        return
    end

    -- Get the second argument which is the item amount; this is optional, and defaults to 1
    local amount = tonumber(args[2]) or 1

    local item_id = tonumber(item)
    -- If the item id is nil, it was a name and should be retrieved
    if item_id == nil then
        item_id = find_item_id_by_name(item)

        -- Check if we succeeded in grabbing an item id
        if item_id == nil then
            player:send_game_message("Unable to find an item with the specified name: " .. item)
            return
        end
    end

    -- Give the player their item
    if (player:add_inventory_item(INVENTORY.INVENTORY, item_id, amount)) then
        player:send_game_message("Succesfully added item with id " .. item_id .. " to your inventory. ")
    else
        player:send_game_message("Failed adding item with id " .. item_id .. " to your inventory. ")
    end
end
