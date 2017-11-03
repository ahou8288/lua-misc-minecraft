local itotal=0
for i=2,16 do
	itotal=itotal+turtle.getItemCount(i)
end
local length
length=math.floor(math.sqrt(itotal))


local currentslot=2
local function iplaced()
turtle.select(currentslot)
	if turtle.getItemCount(currentslot)==0 then
		currentslot=currentslot+1
		turtle.select(currentslot)
	end
turtle.placeDown()
end

local function icheck()
if turtle.getItemCount(1)<5 then
	print("Fuel required soon")
	print(turtle.getItemCount(1)" fuel left.")
end
if turtle.getFuelLevel()==0 then
	turtle.select(1)
	turtle.refuel(1)
	turtle.select(currentslot)
end
end

local function row()
	for i=1,length do
		icheck()
		iplaced()
		turtle.forward()
		end
end

icheck()
turtle.forward()

if length/2==math.floor(length) then
	for i=1,(length/2) do
	row()
	icheck() turtle.turnRight() turtle.forward() turtle.turnRight()
	row()
	icheck() turtle.turnLeft() turtle.forward() turtle.turnLeft()
	end
	turtle.turnRight()
else
	row()
	icheck() turtle.turnRight() turtle.forward() turtle.turnRight()
	for i=1,(length/2) do
	row()
	icheck() turtle.turnLeft() turtle.forward() turtle.turnLeft()
	row()
	icheck() turtle.turnRight() turtle.forward() turtle.turnRight()
	end
end

