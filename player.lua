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
    -- Test for negative amount
    if amount < 0 then
        self:send_game_message('Please use "Player:delete_inventory_item(...)" for deleting inventory items.')
        return false
    end

    -- Grab the size of the inventory
    local inv_size = self:get_inventory_size(inv)
    if inv_size == nil then
        return
    end

    -- Create a variable for storing a free slot
    local free_slot = -1

    -- Iterate over the inventory's slots
    for i = 0, inv_size - 1 do
        local slot = self:get_inventory_slot(inv, i)

        -- If the slot is nil, it means that it is free
        if slot ~= nil then
            -- Get the slot fields
            local slot_item_id = slot[1]
            local slot_item_amount = slot[2]

            -- If the item ids are equivalent, the stack should possibly be modified (TODO: Test if it is a stackable item)
            if item == slot_item_id then
                -- Test for overflow
                if amount + slot_item_amount <= 2147483647 then
                    return self:set_inventory_slot(inv, i, item, amount + slot_item_amount)
                end
            end
        else
            if free_slot == -1 then
                free_slot = i
            end
        end
    end

    -- Check whether a free slot was found
    if free_slot ~= -1 then
        -- Slot was found, add the item to the inventory
        return self:set_inventory_slot(inv, free_slot, item, amount)
    else
        -- TODO: Drop the item to the ground
    end
end

function Player:delete_inventory_item(inv, item, amount)
    -- Test for negative amount
    if amount < 0 then
        self:send_game_message("Negative amounts should not be specified here.")
        return false
    end

    -- Grab the size of the inventory
    local inv_size = self:get_inventory_size(inv)
    if inv_size == nil then
        return false
    end

    -- Iterate over the inventory's slots
    for i = 0, inv_size - 1 do
        local slot = self:get_inventory_slot(inv, i)

        -- If the slot is nil, it means that it is free
        if slot ~= nil then
            -- Get the slot fields
            local slot_item_id = slot[1]
            local slot_item_amount = slot[2]

            -- Test for item
            if item == slot_item_id then
                local new_amount = slot_item_amount - amount

                -- If the new amount greater than 0, set it on the slot. Else remove the item
                if new_amount > 0 then
                    return self:set_inventory_slot(inv, i, item, new_amount)
                else
                    return self:set_inventory_slot(inv, i, -1, 0)
                end
            end
        end
    end

    return 10.5
end
