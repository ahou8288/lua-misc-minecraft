--Build a progress bar.
--Simple Go 40
local pg=0
local dist=0
local dest=40
local x=0
turtle.select(1)
turtle.refuel()
local function progress()
	pg=math.ceil(dist/dest*100)
	term.clear()
	print("____________"..pg.."%____________")
end
while dist<dest do
	progress()
	if turtle.detect() then
		turtle.dig()
		x=x+1
	end
	turtle.forward()
	dist=dist+1
end
progress()
print("I had to mine through "..x.." blocks to get here!")