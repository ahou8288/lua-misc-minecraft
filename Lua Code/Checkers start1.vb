'Checkers
dim turn
dim board(32)



'list adjacent squares
for n=1,32 do
	if board(n) = king then
	ActiveCell.Offset(-1, -1).Range("A1").Select
	ActiveCell.FormulaR1C1 = "b"
	end if
next n

'look at the board
Range("B2").Select
for n=1,32
board(n) = 	Activecell
	if n/4 = integer(n/4) then
		if n/8 = integer(n/8) then 
		ActiveCell.Offset(-7, -1)
		else
		ActiveCell.Offset(-5, -1)
		end if
	else
	ActiveCell.Offset(2, 0)
	end if
next n

'first move
for n=1,32 do
	if board(n) = "o" then
		
	end if
next n