--Turtle mining
local function checkfuel()
	if turtle.getFuelLevel()<30 then
		turtle.select(1)
		turtle.refuel(1)
	end
end
local function minefwd()
	checkfuel()
	turtle.dig()
	turtle.forward()
	turtle.digUp()
	turtle.up()
	turtle.digUp()
	turtle.up()
	turtle.turnRight()
	turtle.dig()
	turtle.down()
	turtle.dig()
	turtle.down()
	turtle.dig()
	turtl.turnLeft()
end
local function torchup()
	turtle.select(16)
	turtle.placeUp()
end

print("Distance: ")
local d=tonumber(read())
local x=0

local function minedist()
local t=0
while x<d do
	minefwd()
	if t=0 then
		torchup()
		t=10
	end
	t=t-1
	x=x+1
end
torchup()
end
local function minecross()
turtle.turnRight()
for x=1,7 do
	minefwd()
end
end
turtle.turnRight()
minedist()
turtle.turnRight()
minecross()
turtle.turnRight()
minedist()
Print("Finished Mining: Tunnel is ".. d .." blocks long.")