-- Quarry
-- author: cocu
--
-- Usage: Place turtle one block down, and set some cobblestones in first slot.
--        This cobblestones use for sign and player safety.
--        When finished successful, turtle stop on the cobblestone.
--        If turtle did not stop on the cobblestone, it maybe failed.
--
-- TODO: move next place
-- TODO: when slot full, drop cobblestone or back

function dig(d)
    if d == "forward" then
        turtle.dig()
    elseif d == "up" then
        turtle.digUp()
    elseif d == "down" then
        turtle.digDown()
    end
end

function down(f)
    if not turtle.down() then
        dig("down")
        return turtle.down()
    end
    return true
end

function up(f)
    if not turtle.up() then
        dig("up")
        return turtle.up()
    end
    return true
end

function logging(s)
    if fs.exists("log")then
        fs.delete("log")
    end
    fp=fs.open("log","w")
    fp.write(tostring(s))
    fp.close()
end

for x=1,4 do
    -- sign "now digging" for player
    turtle.dig()
    turtle.place()
    turtle.turnRight()
end

depth = 0
flag = true
while flag do 
    flag = down()
    if depth == 0 then
        turtle.placeUp() -- for player safe
    end
    if flag then
        depth = depth + 1
        logging(depth)
    end
end

i=depth
while i>0 do
    for x=1,4 do
        --digging cross by turning
        dig("forward")
        turtle.turnRight()
    end
    up()
    i = i - 1
    logging(i)
end


up()
turtle.placeDown() --for player safe

if fs.exists("log")then
    fs.delete("log")
end
