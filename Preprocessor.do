cd "C:\Users\Brian\Documents\Stigma\"

include "Header.do"
local random_num = floor(uniform()*10000)
//-----------------------------------


import excel using "C:\Users\Brian\Documents\Stigma\raw.xlsx", sheet("All Data") firstrow clear

local survey_list = "internal_stigma_c external_stigma_c internal_stigma_p external_stigma_p promis_depression_c promis_anxiety_c promis_peer_rel_c skindex_c"
//keep id skindiseasebuckets `internal_stigma_c' `external_stigma_c' `internal_stigma_p' `external_stigma_p' `promis_depression_c' `promis_anxiety_c' `promis_peer_rel_c' `skindex_c'

egen code = group(skindiseasebuckets)
sort code id
order id code
drop skindiseasebuckets
ren code Assmnt
ren id PIN

foreach survey_questions of local survey_list {
	di "``survey_questions''"


outsheet PIN Assmnt ``survey_questions'' using "Stigma_`survey_questions'_`random_num'.csv", comma replace
}
/*
outsheet PIN Assmnt `external_stigma_c' using "Stigma_external_c_`random_num'.csv", comma replace
outsheet PIN Assmnt `internal_stigma_p' using "Stigma_internal_p_`random_num'.csv", comma replace
outsheet PIN Assmnt `external_stigma_p' using "Stigma_external_p_`random_num'.csv", comma replace

}