--Branch Mine
local function icheck()
if turtle.getItemCount(1)<5 then
	print("Fuel required soon")
	print(turtle.getItemCount(1)" fuel left.")
end
if turtle.getFuelLevel()==0 then
	turtle.select(1)
	turtle.refuel(1)
end
end

local it=0
local function blow()
	turtle.select(2)
	turtle.placeDown()
for it=3,16 do
	turtle.select(it)
	turtle.dropDown()
end
turtle.select(3)
end

local d=0
local n=0
local n1=0
local function fwd(n)
n1=0
repeat
turtle.dig()
icheck()
turtle.forward() d=d+1
turtle.digDown()
turtle.digUp()
n1=n1+1
until n1==n
end

local function branch()
d=0
	while turtle.getItemCount(16)==0 do
	fwd(1)
	end
end

local function return1()
branch()
blow()
print("Branch mined; items deposited")
turtle.turnRight()
fwd(1) fwd(1) fwd(1) fwd(1) fwd(1) fwd(1) fwd(1)
turtle.turnRight()
fwd(d)
blow()
print("Branch mined; items deposited")
end

print("Branch mining")
print("")
print("Slot 1: Fuel")
print("Slot 2: Chests")
print("")
print("Will mine until full then place chest and return.")
print("There are 6 blocks between branches.")
print("Profit?")
fwd(4)
while turtle.getItemCount(1) and turtle.getItemCount(2) do
turtle.turnLeft()
return1()
return1()
turtle.turnRight()
fwd(14)
end