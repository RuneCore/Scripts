INVENTORY = {}
INVENTORY.INVENTORY = 93

function Player:on_login()
    print("Player:on_login")
    print("My name is: " .. self:get_name())

    --wait(5)
    --wait(2)
    --wait(10)

    self:send_interface_top(165)

    self:send_interface_sub(162, 165, 1, 1)
    self:send_interface_sub(651, 165, 2, 1) -- health bar, prayer etc

    self:send_interface_sub(163, 165, 25, 1)
    self:send_interface_sub(160, 165, 26, 1)
    self:send_interface_sub(378, 165, 29, 0)

    self:send_interface_sub(320, 165, 11, 1)
    self:send_interface_sub(629, 165, 12, 1)

    self:send_interface_sub(399, 629, 33, 1) -- Extra parent for the sub above

    self:send_interface_sub(149, 165, 13, 1)
    self:send_interface_sub(387, 165, 14, 1)
    self:send_interface_sub(541, 165, 15, 1)
    self:send_interface_sub(218, 165, 16, 1)
    self:send_interface_sub(429, 165, 19, 1)
    self:send_interface_sub(109, 165, 18, 1)
    self:send_interface_sub(182, 165, 20, 1)
    self:send_interface_sub(261, 165, 21, 1)
    self:send_interface_sub(216, 165, 22, 1)
    self:send_interface_sub(239, 165, 23, 1)
    self:send_interface_sub(7, 165, 17, 1)
    self:send_interface_sub(593, 165, 10, 1)

    -- TOOD: SIMPLY SEND THIS OVER ENGINE, AT LEAST THE INITIAL STATE
    self:update_run_energy(100)

    self:send_inventory(INVENTORY.INVENTORY, Interface(149, 0))

    for i = 0, 22 do
        self:update_stat(99, i, 13034431)
    end

    self:weak_queue(
        3,
        function(player)
            print(player:get_name())
        end
    )
end

-- Set the single inventory slot using the multiple slots engine call
function Player:set_inventory_slot(inv, slot, item, amount)
    return self:set_inventory_slots(inv, {{slot, item, amount}})
end

function Player:add_inventory_item(inv, item, amount)
end
