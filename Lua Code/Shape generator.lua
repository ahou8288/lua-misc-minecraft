--Fill in the arrays
local length, length1, width, width1, height = 10,10,10,10,5
local vertdist = 0
local x,y,z=0,0,0 -- the current co-ord
local i3 = 0 --the distance in the forward code
local curslot = 1
local side = 1

--Read the args
local args = { ... }
n=tonumber(args[1])
side=tonumber(args[2])

--defining the corners
local cornerx = {}
local cornery = {}
local i1 = 0
local angle = 0
cornerx[0]=0 cornery[0]=0
for i1=1,n do
	angle=360/n*(i1-1)
	cornerx[i1]=cornerx[i1-1]+side*math.sin(angle)
	cornery[i1]=cornery[i1-1]+side*math.cos(angle)
end

--defining the matrix
local mt = {}
for x=0,length-1 do
	mt[x] = {}
	for y=0,height-1 do
		mt[x][y] = {}
		for z=0,width-1 do
			--use the corners to define the matrix here
			--cone
			horzdist = ((x-length/2)^2 + (z-width/2)^2)^0.5
			if horzdist+y <= length then
			mt[x][y][z]=1
			end
		end
	end
end


--turtle print pattern
x,y,z=0,0,0
local dir=0

local function pdown()
	if turtle.getItemCount(curslot)==0 then
		curslot=curslot+1
	end
	turtle.select(curslot)
	turtle.placeDown()
end

local function fwd(i3)
if mt[x][y][z] == 1 then
pdown()
end
for i2=1,i3 do
	turtle.forward()
		if dir==0 then x=x+1 end
		if dir==2 then x=x-1 end
		if dir==1 then z=z+1 end
		if dir==3 then z=z-1 end
		if mt[x][y][z] == 1 then
		pdown()
		end
	end
end

local function rt()
turtle.turnRight()
dir = dir+1
if dir == 4 then dir=0 end
end

local function spiral()
width=width1-1
length=length1-1
	while length>1 do
	fwd(length)
	rt()
	fwd(width)
	rt()
if a==1 then length = length-1 width=width-1 a=0 else a=1 end
	end
end

local function reset()
repeat
	rt()
until dir == 2
fwd(x)
rt()
fwd(z)
length = length1
width = width1
rt()
print(x..y..z)
end

while y<height do
spiral()
reset()
turtle.up()
y=y+1
print("Level Up!")
end
print("Finished Construction")
turtle.back()
repeat
turtle.down()
y=y-1
until y==0
for i1=0,n do
	print(i1.." : "..cornerx[i1].."  }-{ "..cornery[i1])
end