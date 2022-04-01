add_item_on_item(
    123,
    123,
    function(player, from_item, from_interface, from_slot, to_item, to_interface, to_slot)
        print("itemonitem works")

        print(player:get_name())
        print(from_item)
        print(from_interface)
        print(from_slot)
        print(to_item)
        print(to_interface)
        print(to_slot)
    end
)

local item = Item:new(123)

item.some_cool_lua_variable = 69
item.other_cool_lua_variable = "nice"

function item:option1(player, interface, slot)
    print("called option1 on item!!111111")
    print(self.some_cool_lua_variable)
    print(interface)
    print(slot)

    print("The interface is: " .. interface)

    if slot == 5 then
        print("slot is " .. slot)
    end

    if slot == 8 then
        print("slot issss " .. slot)
    end

    player:chat(123, "Testy")
end
