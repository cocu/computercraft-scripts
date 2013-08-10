-- Quarry
-- author: cocu
--
-- TODO: up and down to function
-- TODO: move next place

for x=1,4 do
    turtle.dig()
    turtle.place()
    turtle.turnRight()
end

depth = 0
flag = true
while flag do 
    flag = turtle.down()
    if not flag then
        turtle.digDown()
        flag = turtle.down()
    end
    if depth == 0 then
        turtle.placeUp()
    end
    if flag then
        depth = depth + 1
        if fs.exists("log")then
            fs.delete("log")
        end
        fp=fs.open("log","w")
	fp.write(depth)
    end
end

i=depth
while i>0 do
    for x=1,4 do
        turtle.dig()
        turtle.turnRight()
    end
    flag = turtle.up()
    if not flag then
        turtle.digUp()
        turtle.up()
    end
    i = i - 1
    if fs.exists("log")then
        fs.delete("log")
    end
    fp=fs.open("log","w")
    fp.write(i)
end


flag = turtle.up()
if not flag then
    turtle.digUp()
    turtle.up()
end
turtle.placeDown()
if fs.exists("log")then
    fs.delete("log")
end

