--Branch mine v2
local args = { ... }
local length=0
length=tonumber(args[1])
local function icheck()
if turtle.getFuelLevel()==0 then
	turtle.select(1)
	turtle.refuel(1)
end
end

local function blow()
local it=0 --current slot being dropped
icheck()
turtle.down()
turtle.digDown()
	turtle.select(2)
	turtle.placeDown()
for it=3,16 do
	turtle.select(it)
	turtle.dropDown()
end
turtle.select(3)
icheck()
turtle.up()
end

local function fwd100()
	for n=1,length do
	turtle.dig()
	icheck()
	turtle.forward()
	turtle.digDown()
	turtle.digUp()
	end
end

local function fwd1()
turtle.dig()
icheck()
turtle.forward()
turtle.digDown()
turtle.digUp()
end

local function return1()
fwd100()
blow()
print("Outward branch mined; items deposited")
turtle.turnRight()
fwd1() fwd1() fwd1() fwd1() fwd1() fwd1() fwd1()
turtle.turnRight()
fwd100()
blow()
print("Branch mined; items deposited")
end

print("Branch Mine Program") print("")
print("Slot 1: Fuel") print("Slot 2: Chests") print("")
print("Will mine until full then place chest.") print("Branches are 100 blocks long.") print("There are 6 blocks between branches.")

fwd1() fwd1() fwd1() fwd1()
while turtle.getItemCount(1)>0 and turtle.getItemCount(2)>2 do
turtle.turnLeft()
return1()
return1()
turtle.turnRight()
	for n=1,14 do
		fwd1()
	end
end
print("Program terminated")