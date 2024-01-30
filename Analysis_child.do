cd "C:\Users\Brian\Documents\Stigma\"
include "Header.do"
local HIGH_STIGMA = 55
matrix  result_matrix = [0,0]
//-----------------------------------

//convert to stata format for merging
import delimited using "scored_internal_child.csv", clear varnames(5)
save scored_internal_child, replace

import delimited using "scored_external_child.csv", clear varnames(5)
save scored_external_child, replace

import delimited using "scored_internal_proxy.csv", clear varnames(5)
save scored_internal_proxy, replace

import delimited using "scored_external_proxy.csv", clear varnames(5)
save scored_external_proxy, replace

//open the original file
//skin problem 1 is the primary condition that is used to categorize
import excel using "C:\Users\Brian\Documents\Stigma\raw.xlsx", sheet("All Data") firstrow clear
keep id race skindiseasebuckets skin_problem_1 skin_problem_1_visible `date_vars' gender bullied 

//clean the names of diseases
//remove white space and slashses
replace skindiseasebuckets = ustrregexra(skindiseasebuckets, " ", "")
replace skindiseasebuckets = ustrregexra(skindiseasebuckets, "/", "")
ren skin_problem_1_visible visibility

egen disease_code = group(skindiseasebuckets)

//renaming as numbers for reshape command
ren id pin
merge 1:1 pin using scored_internal_child, keepusing(tscore) keep(3)
drop _merge
ren tscore tscore_internal_c

merge 1:1 pin using scored_external_child, keepusing(tscore) keep(3)
drop _merge
ren tscore tscore_external_c

merge 1:1 pin using scored_internal_proxy, keepusing(tscore) keep(3)
drop _merge
ren tscore tscore_internal_p

merge 1:1 pin using scored_external_proxy, keepusing(tscore) keep(3)
drop _merge
ren tscore tscore_external_p

//-----------------------------------------------------------------------
// GENERATING VARIABLES
//calculate tscore derivatives
gen tscore_ratio_c = tscore_internal_c / tscore_external_c
gen tscore_diff_c = tscore_internal_c - tscore_external_c
gen tscore_ratio_p = tscore_internal_p / tscore_external_p
gen tscore_diff_p = tscore_internal_p - tscore_external_p

//age stuff
ren birthdate_year birth_year
ren birthdate birth_month
gen birthdate_full = mdy(birth_month, 1, birth_year)
replace birthdate_full = mdy(1, 1, birth_year) if birthdate_full == .

//calc age at survey
gen age = floor((survey_start_date - birthdate_full) / 365)
gen age_group = 1 if age < 13
replace age_group = 2 if age_group == .

// Assign numeric codes based on string values
// by default, will assign semi-visible = 1 and invisible = 2. swap these
egen visible_code = group(visibility)
replace visible_code = 1 if visibility == "Not visible"
replace visible_code = 2 if visibility == "Barely covered by clothing"

// Assign numberic codes for race
// Split is white v not white
gen white = 1 if race == "White"
replace white = 0 if white == .

//generate var for high stigma
gen high_stigma_c = 1 if tscore_internal_c > `HIGH_STIGMA' | tscore_external_c > `HIGH_STIGMA'
replace high_stigma_c = 0 if high_stigma_c == .
gen high_stigma_p = 1 if tscore_internal_p > `HIGH_STIGMA' | tscore_external_p > `HIGH_STIGMA'
replace high_stigma_p = 0 if high_stigma_p == .

//generate numerical code for male
gen male = 1 if gender == "male"
replace male = 0 if male == .

//generate flag variables for linear regression
gen racevar_White = (race == "White")
gen racevar_NotWhite = (race != "White")
gen racevar_Asian = (race == "Asian")
gen racevar_Other = (race == "Other")
gen racevar_Black = (race == "Black, African American, African, or Afro-Caribbean")
gen racevar_NativeAmerican = (race == "American Indian, Native American or Alaskan Native")
gen racevar_PacificIslander = (race == "Native Hawaiian or other Pacific Islander")

gen visibilityvar_NotVisible = (visibility == "Not visible")
gen visibilityvar_VeryVisible = (visibility == "Very visible")
gen visibilityvar_BarelyCovered = (visibility == "Barely covered by clothing")

ren pin id
merge m:1 id using tscores, keep(3)
drop _merge

//-----------------------------------------------------------------------
//STATS
//logit high_stigma i.age_group i.visible_code i.male i.white if type == "External_c"
//logit high_stigma i.age_group i.visible_code i.male i.white if type == "Internal_c"

include "Logistic_regressions.do"
include "Linear_regression.do"

foreach survey_var of local survey_list {
	spearman `survey_var' tscore if type == "`stigma'"
	matrix result_matrix = result_matrix \ r(rho) , r(p)
}



save child, replace

