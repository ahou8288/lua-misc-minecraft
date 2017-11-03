print("Mob tower under construction.")
print("Please stand clear.")
local x=0

local function turnr()
	turtle.turnRight()
	turtle.back()
	turtle.turnRight()
	turtle.back()
end

local i=1
local function icheck()
	if turtle.getItemCount(i) ==0 then
		i=i+1
		turtle.select(i)
		print("stack used")
	end
end

local function backplc()
	turtle.back()
	icheck()
	turtle.place()
end

local function turnl()
	turtle.turnLeft()
	turtle.back()
	turtle.turnLeft()
	turtle.back()
end

local n=0
local function backplace(n)
	x=0
	repeat
		backplc()
		x=x+1
	until x==n
end

local function fwd(n)
x=0
	repeat
		turtle.forward()
		x=x+1
	until x==n
end

local i2=0
local function lyr1()
i2=i2+1
turtle.back()
	if i2==1 then
		turtle.turnRight()
		turtle.turnRight()
		fwd(10)
		turtle.turnRight()
		turtle.turnRight()
	else
		backplace(10)
	end
turnr()
turtle.back()
backplace(9)
turnl()
backplace(8)
turnr()
backplace(8)
turnl()
backplace(7)
turnr()
turtle.back()
turtle.back()
turtle.back()
backplace(4)
turnl()
backplace(4)
turnr()
backplace(4)
turnl()
backplace(3)
turnr()
turtle.back()
turtle.back()
backplace(1)
	if i2==4 then
		turtle.turnRight()
		turtle.forward()
		backplace(10)
	else
		turtle.turnLeft()
		fwd(9)
	end
print("Checkpoint Reached")
end

local function lyr23()
fwd(9)
turtle.place()
turtle.turnRight()
turtle.forward()
turtle.turnLeft()
backplace(5)
turtle.back()
backplace(3)
turnl()
backplace(3)
turtle.back()
backplace(4)
turnr()
backplace(4)
turtle.back()
backplace(3)
turnl()
backplace(3)
turtle.back()
backplace(4)
turnr()
turtle.back()
backplace(3)
turtle.turnRight()
turtle.forward()
turtle.turnLeft()
backplace(4)
turnl()
backplace(4)
turnr()
backplace(4)
turnl()
backplace(3)
turnr()
turtle.back()
turtle.back()
backplace(1)
turtle.turnLeft()
fwd(9)
print("Checkpoint Reached")
end

local function layercake()
lyr1()
lyr1()
lyr1()
lyr1()
turtle.up()
print("Winning!")
end

lyr23()
lyr23()
lyr23()
lyr23()
turtle.up()