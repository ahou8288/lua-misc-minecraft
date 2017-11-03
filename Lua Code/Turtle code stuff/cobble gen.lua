--Cobble farm

local function blow
local itemsum=0
for x=1,16 do
	itemsum=itemsum+turtle.getItemSpace()
end
if itemsum=0 then
	turtle.turnLeft()
	for x=1.16
		turtle.select(x)
		turtle.drop(63)
	end
Print"Items placed in chest"
end	

		
while turtle.detect() do
blow
turtle.dig()
wait(1)
end