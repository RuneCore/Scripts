local command = Command:new("item")

function command:execute(player, args)
    local id = tonumber(args[1]) or nil
    local amount = tonumber(args[2]) or 1

    if id == nil then
        player:send_game_message("You must specify an item name or id as first argument")
        return
    end

    player:send_game_message("here is your item with id " .. id)
    player:give_item(id, amount)
end
