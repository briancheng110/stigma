cd "C:\Users\Brian\Documents\Stigma\"

// Will either attempt to score in house using PROMIS_score_tables or generate csv for upload to the HealthMeasures scoring service
// PIN = patient ID
// Assmnt = time point (will always be 1)

include "Header.do"
local random_num = floor(uniform()*10000)
//-----------------------------------
import excel using "C:\Users\Brian\Documents\Stigma\raw.xlsx", sheet("All Data") firstrow clear
capture mkdir "Upload"
cd "Upload"
capture mkdir `random_num'
cd `random_num'

/*
egen code = group(skindiseasebuckets)
sort code id
ren code Assmnt
*/
ren id PIN
gen Assmnt = 1

foreach survey_questions of local survey_list {
	outsheet PIN Assmnt ``survey_questions'' using "Stigma_`survey_questions'_`random_num'.csv", comma replace
}

di "The number for this session is: `random_num'!"
