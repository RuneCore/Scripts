local npc = NPC:new(123, 456, 789)

function npc:option1(player)
    self:Dialogue(EMOTE.HAPPY, "How do you do?")
end
