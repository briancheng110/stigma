//reformat data to be friendly to t-test and ranksum
reshape long tscore, i(pin) j(type)
gen type_label = ""
replace type_label = "Internal_c" if type == 1
replace type_label = "External_c" if type == 2
ren type tscore_type
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

// stats by age
quietly ranksum tscore if age_group == 1, by(type)
disp r(p)
quietly ranksum tscore if age_group == 2, by(type)
disp r(p)

// stats by sex
ranksum tscore if gender == "female", by(type)
ranksum tscore if gender == "male", by(type)

local stigma_type = "Internal_c External_c"
foreach stigma of local stigma_type {
	foreach survey_var of local survey_list {
		spearman `survey_var' tscore if type == "`stigma'"
		matrix result_matrix = result_matrix \ r(rho) , r(p)
	}
}

matrix list result_matrix