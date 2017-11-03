--Quarry
--fuel check
local dir --0 to 3
local width
local length
local itmcount --total items mined
local slot --slot being dumped in blow()
local rownum --counter for progress across in rows()
local downok -- test if mining works. (failure ends program)

turtle.select(1)
print("Put fuel in slot 1.")
print("Place the turtle next to a chest facing away from it")
print("What is the width of the quarry?")
width=read()
print("What is the length of the quarry?")
length=read()
print("Mining")
local function fuelcheck()
	if turtle.getItemCount(1)<5 then
		print("Fuel required soon")
		print(turtle.getItemCount(1).." fuel left.")
	end
	if turtle.getFuelLevel()==0 then
		turtle.select(1)
		turtle.refuel(1)
	end
end
local function blow()
	for slot=2,16 do
		turtle.select(slot)
		turtle.drop()
	end
end
local function fwd1()
	fuelcheck()
	turtle.forward()
	if dir == 0 then
		x=x+1
	end
	if dir == 1 then
		z=z+1
	end
	if dir == 2 then
		x=x-1
	end
	if dir == 3 then
		z=z-1
	end
end
local function forward(dist3)
local dist3 --distance to travel
local dist4 --distance travelled
	for dist4=1,dist3 do
		fwd1()
		dist4=dist4+1
	end
end
local function goup(up1)
local up1
local up2
	repeat
		fuelcheck()
		turtle.up()
		y=y+1
		up2=up2+1
	until up2=up1
end
local function godown(down1)
local down1
local down2
repeat
	fuelcheck()
	turtle.down()
	y=y-1
	down2=down2+1
until down2=down1
end
local function dropoff()
local dir1 --temporary data
local x1
local z1
local y1
	if turtle.getItemCount(16) > 0 then
		x1=x
		y1=y
		z1=z
		dir1=dir
		turtle.turnRight(3-dir)
		dir = 3
		forward(z)
		turtle.turnLeft()
		dir = 2
		forward(x)
		goup(y)
		blow()
		godown(y1)
		turtle.turnRight(2)
		dir=0
		forward(x1)
		turtle.turnRight()
		dir=1
		forward(z1)
		turtle.turnRight(dir1)
	end
print("Program complete. "..itmcount.." blocks have been successfully mined.")
end
local function idig()
	if turtle.dig() then
		turtle.dig()
		itmcount = itmcount +1
		dropoff()
	else
		downok = 1
	end
end
local function idigup()
	if turtle.digup() then
		turtle.digup()
		itmcount = itmcount +1
		dropoff()
	else
		downok = 1
	end
end
local function idigdown()
	if turtle.digdown() then
		turtle.digdown()
		itmcount = itmcount +1
		dropoff()
	else
		downok = 1
	end
end
local function digfwd(dist1)
local dist2 --counter
local dist1 --parameter
	repeat
		if downok==0 then
			idig()
			fwd1()
			idigup()
			idigdown()
			n2=n2+1
		end
	until dist2=dist1
end
local function rows(width,length)
	for rownum=0,math.floor(width/2) do
		digfwd(length)
		turtle.turnRight()
		dir=dir+1
		digfwd(1)
		turtle.turnRight()
		dir=dir+1
		digfwd(length)
		if rownum < math.floor(width/2)
			turtle.turnLeft()
			dir=dir-1
			digfwd(1)
			turtle.turnLeft()
			dir=dir-1
		else
			digfwd(width)
		end
	end
end
local function layers()
	while downok == 0 do
		rows(width,length)
		turtle.turnRight()
		dir = 0
		idigdown()	fuelcheck()	turtle.down()	y=y-1
		idigdown()	fuelcheck()	turtle.down()	y=y-1
		idigdown()	fuelcheck()	turtle.down()	y=y-1
	end
end
layers()