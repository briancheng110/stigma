cd "C:\Users\Brian\Documents\Stigma\"

include "Header.do"
local random_num = floor(uniform()*10000)
//-----------------------------------


import excel using "C:\Users\Brian\Documents\Stigma\raw.xlsx", sheet("All Data") firstrow clear

keep id skindiseasebuckets `internal_stigma_c' `external_stigma_c' `internal_stigma_p' `external_stigma_p'

egen code = group(skindiseasebuckets)
sort code id
order id code
drop skindiseasebuckets
ren code Assmnt
ren id PIN

outsheet PIN Assmnt `internal_stigma_c' using "Stigma_internal_c_`random_num'.csv", comma replace
outsheet PIN Assmnt `external_stigma_c' using "Stigma_external_c_`random_num'.csv", comma replace
outsheet PIN Assmnt `internal_stigma_p' using "Stigma_internal_p_`random_num'.csv", comma replace
outsheet PIN Assmnt `external_stigma_p' using "Stigma_external_p_`random_num'.csv", comma replace

