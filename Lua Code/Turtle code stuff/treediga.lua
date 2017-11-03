print("Slot 1: Fuel")
print("Slot 2: Saplings")
print("Slot 3: Bonemeal")
local function icheck()
if turtle.getFuelLevel()==0 then
	turtle.select(1)
	turtle.refuel(1)
end
end

local function treedig()
	turtle.dig()
	icheck()
	turtle.forward()
	while not(turtle.up()) do
		icheck()
	  turtle.digUp()
	  turtle.up()
	end
	while turtle.down() do
	icheck()
	turtle.down()
	end
	icheck()
	turtle.back()
end

local function grow()
turtle.select(2)
turtle.place()
	if turtle.getItemCount(3)==0 then
	print("I have no bonemeal.")
	else
		while turtle.compare() do
		turtle.select(3)
		turtle.place()
		turtle.select(2)
		end
	end
end

while turtle.getItemCount(1) and turtle.getItemCount(2) and turtle.getItemCount(3) do
grow()
treedig()
print("tree dug")
if turtle.getItemCount(6)>0 then
turtle.turnLeft()
turtle.select(5) turtle.drop() turtle.select(6) turtle.drop()
turtle.turnRight()
end
end