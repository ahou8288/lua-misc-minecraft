--Tree Grower
if turtle.getItemCount(1)<16 then
	print("Put at least 16 saplings in slot 1.")
end
print("This algorithm works with a 4 by 4 grid of trees")
print("Place turtle above the first sapling.")

local function forward(n)
	for i=1,n do --Go forward n times
		while (not turtle.forward()) do --Move forward
			turtle.dig()
			turtle.attack()
		end
	end
end

local function digtree()
	turtle.select(1) --Select sapling blocks
	while turtle.detectUp() do--Dig out all the wood blocks
		turtle.digUp()
		turtle.up()
	end
	while turtle.down() do end --Go to base of tree
	turtle.digDown() --Dig out bottom block
	turtle.placeDown() --Put a sapling back
end

local function treeforward(n) --move forward and dig a tree
	for i1=1,n do
		forward(4)
		if turtle.detectUp() then digtree() end
	end
end

local function driver()
	treeforward(3)
	turtle.turnLeft()
	treeforward(1)
	turtle.turnLeft()
	treeforward(2)
	turtle.turnRight()
	treeforward(1)
	turtle.turnRight()
	treeforward(2)
	turtle.turnLeft()
	treeforward(1)
	turtle.turnLeft()
	treeforward(3)
	turtle.turnLeft()
	treeforward(3)
end

local function refuelling()
	i2=0
	forward(1)
	for i1=2,16 do
		turtle.select(i1)
		turtle.drop()
	end
	for i2=1,6 do
		turtle.down()
	end
	turtle.select(1)
	turtle.suckDown()
	for i3=1,6 do
		turtle.up()
	end
	turtle.turnLeft()
	turtle.turnLeft()
	forward(1)
	turtle.turnRight()
end

print("Press 'y' to continue")
while read()=="y" do
	driver()
	refuelling()
	print("Press 'y' to continue")
end