cd "C:\Users\Brian\Documents\Stigma\"
local internal_stigma = "NQSTGped04c NQSTGped07c NQSTGped17c NQSTGped19c NQSTGped09c NQSTGped11c NQSTGped14c NQSTGped15c QDermSTGped03 QDermSTGped04 QDermSTGped08"
local external_stigma = "NQSTGped01c NQSTGped02c NQSTGped03c NQSTGped05c NQSTGped06c NQSTGped08c  NQSTGped10c NQSTGped20c QDermSTGped01 QDermSTGped02  QNQSTGped07"

//convert to stata format for merging
import delimited using "scored_internal.csv", clear varnames(5)
save scored_internal, replace

import delimited using "scored_external.csv", clear varnames(5)
save scored_external, replace

//open the original file
import excel using "C:\Users\Brian\Documents\Stigma\raw.xlsx", sheet("All Data") firstrow clear
keep id skindiseasebuckets `internal_stigma' `external_stigma'
egen disease_code = group(skindiseasebuckets)

ren id pin
merge 1:1 pin using scored_internal, keepusing(tscore) keep(3)
drop _merge
ren tscore tscore_internal

merge 1:1 pin using scored_external, keepusing(tscore) keep(3)
drop _merge
ren tscore tscore_external