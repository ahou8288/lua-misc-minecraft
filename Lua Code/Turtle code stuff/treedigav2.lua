--Tree digger V2
print("Slot 1: Fuel")
print("Slot 2: Saplings")
print("Slot 3: Bonemeal")
print("Slot 4: Wood")
local x=1
local function icheck()
if turtle.getItemCount(1)<5 then
	print("Fuel required soon")
end
if turtle.getFuelLevel()==0 then
	turtle.select(1)
	turtle.refuel(1)
end
end

local function plantaround()
turtle.select(2)
for i=1,4 do
turtle.place()
	while turtle.compare() do
		turtle.select(3)
		turtle.place()
		turtle.select(2)
	end
turtle.dig()
turtle.turnLeft()
end
end

local function diground()
x=0
	for i=1,4 do
	turtle.select(4)
	if turtle.compare() then
		x=x+1
	end
	turtle.dig()
	turtle.turnLeft()
	end
end

local function digtree()
while x>0 do
	turtle.digUp()
	icheck()
	turtle.up()
	diground()
end
while turtle.down() do
icheck()
turtle.down()
end
x=1
end

local function chest()
for i=5,16 do
	turtle.select(i)
	turtle.dropDown()
end
end

local s=0
while turtle.getItemCount(2)>4 and turtle.getItemCount(3)>4 do
plantaround()
digtree()
chest()
s=s+1
print(s)
end