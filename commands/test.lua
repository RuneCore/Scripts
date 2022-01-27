local command = Command:new("test")

function command:execute(player, args)
    print("my cool command!!111")

    print("Hey we got an argument: " .. args[1])

    player:send_game_message("Here's my msg from arguments: " .. args[1])
end
