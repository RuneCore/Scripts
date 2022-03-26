INTERFACES.LOGOUT = Interface:new(182)
INTERFACES.LOGOUT.inventory = 93
print(INTERFACES.LOGOUT.inventory)

local button_logout = INTERFACES.LOGOUT:new_button(8)
local button_world_switch = INTERFACES.LOGOUT:new_button(3)

function button_logout.option_1(player)
    player:send_game_message("Let's logout.")
    player:logout()
end

function button_world_switch.option_1(player)
    player:send_game_message("Switch world!")
end
