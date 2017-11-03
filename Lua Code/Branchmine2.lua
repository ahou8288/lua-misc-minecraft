--Branch Mine v1
local function icheck()
if turtle.getItemCount(1)<5 then
	print("Fuel required soon")
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
local x=0
local function fwd(n)
n1=0
	if x==0 then
		d=0
	end
repeat
turtle.dig()
icheck()
turtle.forward()
	if x==0 then
	d=d+1
	end
turtle.digDown()
turtle.digUp()
n1=n1+1
until n1==n
end

local function branch()
	while turtle.getItemCount(16)==0 do
	fwd(1)
	end
end

local function return1()
x=0
branch()
blow()
print("Branch mined; items deposited")
print(d)
turtle.turnRight()
fwd(1) fwd(1) fwd(1) fwd(1) fwd(1) fwd(1) fwd(1)
turtle.turnRight()
x=1
fwd(d)
blow()
print("Branch mined; items deposited")
end

print("Branch Mine Program") print("")
print("Slot 1: Fuel") print("Slot 2: Chests") print("")
print("Will mine until full then place chest.") print("There are 6 blocks between branches.")
print("Mine begins in") print("5") sleep(1) print("4") sleep(1) print("3") sleep(1) print("2") sleep(1) print("1")

fwd(4)
while turtle.getItemCount(1)>0 and turtle.getItemCount(2)>2 do
turtle.turnLeft()
return1()
return1()
turtle.turnRight()
fwd(14)
end
print("Program terminated")