cd "C:\Users\Brian\Documents\Stigma\"
include "Header.do"
local HIGH_STIGMA = 50
//-----------------------------------

//convert to stata format for merging
import delimited using "scored_internal_child.csv", clear varnames(5)
save scored_internal_child, replace

import delimited using "scored_external_child.csv", clear varnames(5)
save scored_external_child, replace

//open the original file
//skin problem 1 is the primary condition that is used to categorize
import excel using "C:\Users\Brian\Documents\Stigma\raw.xlsx", sheet("All Data") firstrow clear
keep id skindiseasebuckets skin_problem_1 skin_problem_1_visible `date_vars' gender 

//clean the names of diseases
//remove white space and slashses
replace skindiseasebuckets = ustrregexra(skindiseasebuckets, " ", "")
replace skindiseasebuckets = ustrregexra(skindiseasebuckets, "/", "")

egen disease_code = group(skindiseasebuckets)

//renaming as numbers for reshape command
ren id pin
merge 1:1 pin using scored_internal_child, keepusing(tscore) keep(3)
drop _merge
ren tscore tscore1

merge 1:1 pin using scored_external_child, keepusing(tscore) keep(3)
drop _merge
ren tscore tscore2

//reformat data to be friendly to t-test and ranksum
reshape long tscore, i(pin) j(type)
gen type_label = ""
replace type_label = "Internal_c" if type == 1
replace type_label = "External_c" if type == 2
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

// stats by age
quietly ranksum tscore if age_group == 1, by(type)
disp r(p)
quietly ranksum tscore if age_group == 2, by(type)
disp r(p)

// stats by sex
ranksum tscore if gender == "female", by(type)
ranksum tscore if gender == "male", by(type)

// Assign numeric codes based on string values
// by default, will assign semi-visible = 1 and invisible = 2. swap these
egen visible_code = group(skin_problem_1_visible)
replace visible_code = 1 if skin_problem_1_visible == "Not visible"
replace visible_code = 2 if skin_problem_1_visible == "Barely covered by clothing"

//generate var for high stigma
gen high_stigma = 1 if tscore > `HIGH_STIGMA'
replace high_stigma = 0 if high_stigma == .

//generate numberical code for male
gen male = 1 if gender == "male"
replace male = 0 if male == .

logit high_stigma i.age_group i.visible_code i.male if type == "External_c"
logit high_stigma i.age_group i.visible_code i.male if type == "Internal_c"


save child, replace

