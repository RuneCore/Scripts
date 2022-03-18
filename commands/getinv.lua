local command = Command:new("getinv")

function command:execute(player, args)
    local inv = tonumber(args[1])
    if inv == nil then
        player:send_game_message("Argument specified was not an integer")
        return
    end

    local found_inv = player:get_inventory_size(inv)
    if found_inv ~= nil then
        player:send_game_message("Inventory size is: " .. found_inv)
    else
        player:send_game_message("Inventory was not found_inv for id " .. inv)
    end
end
