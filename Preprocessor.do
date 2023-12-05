cd "C:\Users\Brian\Documents\Stigma\"

local internal_stigma_c = "NQSTGped04c NQSTGped07c NQSTGped17c NQSTGped19c NQSTGped09c NQSTGped11c NQSTGped14c NQSTGped15c QDermSTGped03 QDermSTGped04 QDermSTGped08"
local external_stigma_c = "NQSTGped01c NQSTGped02c NQSTGped03c NQSTGped05c NQSTGped06c NQSTGped08c  NQSTGped10c NQSTGped20c QDermSTGped01 QDermSTGped02  QNQSTGped07"
local internal_stigma_p = "QNQSTGprox17 QNQSTGprox19 QNQSTGprox09 QNQSTGprox11 QNQSTGprox14 QNQSTGprox15 QDermSTGprox03 QDermSTGprox04 QDermSTGprox08 QNQSTGprox07"
local external_stigma_p = "QNQSTGprox01 QNQSTGprox02 QNQSTGprox05 QNQSTGprox08 QDermSTGprox01 QDermSTGprox02 QNQSTGprox20 QNQSTGprox03 QNQSTGprox04 QNQSTGprox06 QNQSTGprox10 QDermSTGprox07"
local random_num = floor(uniform()*10000)  // Change 10000 to your desired range

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

