// merged data

use proxy, clear
append using child

gen internal = 1 if regexm(type, "Internal")
replace internal = 0 if internal  == .

gen proxy = 1 if regexm(type, "_p")
replace proxy = 0 if proxy  == .