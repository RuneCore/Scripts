local command = Command:new("item")

function command:execute(player, args)
    local item_id = tonumber(args[1]) or nil

    if item_id == nil then
        player:send_game_message("You must specify an item name or id as first argument")
        return
    end

    player:send_game_message("here is your item with id " .. item_id)
end
