cd "C:\Users\Brian\Documents\Stigma\"
include "Header.do"
//-----------------------------------

//convert to stata format for merging
import delimited using "scored_internal.csv", clear varnames(5)
save scored_internal, replace

import delimited using "scored_external.csv", clear varnames(5)
save scored_external, replace

//open the original file
import excel using "C:\Users\Brian\Documents\Stigma\raw.xlsx", sheet("All Data") firstrow clear
keep id skindiseasebuckets `internal_stigma' `external_stigma' `date_vars'

//clean the names of diseases
//remove white space and slashses
replace skindiseasebuckets = ustrregexra(skindiseasebuckets, " ", "")
replace skindiseasebuckets = ustrregexra(skindiseasebuckets, "/", "")

egen disease_code = group(skindiseasebuckets)

//renaming as numbers for reshape command
ren id pin
merge 1:1 pin using scored_internal, keepusing(tscore) keep(3)
drop _merge
ren tscore tscore1

merge 1:1 pin using scored_external, keepusing(tscore) keep(3)
drop _merge
ren tscore tscore2

//reformat data to be friendly to t-test and ranksum
reshape long tscore, i(pin) j(type)
gen type_label = ""
replace type_label = "Internal" if type == 1
replace type_label = "External" if type == 2
drop type
ren type_label type

//DROP_--------------------
//keep if age_group 

//iterate over all diseases and do testing
matrix results = J(22, 2, .)

forval i = 1 / 22 {
    capture quietly ranksum tscore if disease_code == `i', by(type)
	matrix results[`i', 1] = `i'
	matrix results[`i', 2] = r(p)
}

// Output results in the format "Disease - p value"
forval i = 1 / 22 {
    local disease = results[`i', 1]
    display "`disease' - " matrix(results[`i', 2])
}

//age stuff
ren birthdate_year birth_year
ren birthdate birth_month
gen birthdate_full = mdy(birth_month, 1, birth_year)
replace birthdate_full = mdy(1, 1, birth_year) if birthdate_full == .

//calc age at survey
gen age = floor((survey_start_date - birthdate_full) / 365)
gen age_group = 1 if age < 13
replace age_group = 2 if age_group == .