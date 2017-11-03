'Game of life
dim x
dim y
dim count
for x = 1,40
	for y = 1,40
		 count = "=R[-1]C+R[-1]C[-1]+RC[-1]+R[1]C[-1]+R[1]C+R[1]C[1]+RC[1]+R[-1]C[1]"
	next y
	
next z


With Selection.Interior
	.Pattern = xlSolid
	.PatternColorIndex = xlAutomatic
	.ThemeColor = xlThemeColorLight1
	.TintAndShade = 0
	.PatternTintAndShade = 0
End With
With Selection.Interior
	.Pattern = xlSolid
	.PatternColorIndex = xlAutomatic
	.ThemeColor = xlThemeColorDark1
	.TintAndShade = 0
	.PatternTintAndShade = 0
End With