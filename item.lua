local item = Item:new(123)

item.some_cool_lua_variable = 69
item.other_cool_lua_variable = "nice"

function item:option1(player)
    print("called option1 on item!!111111")
    print(self.some_cool_lua_variable)
end
