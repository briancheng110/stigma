//Linear regression analysis
//One category from each categorical variable is omitted -- this is on purpose
local analysis_vars = "anx_TScore child_depression_TScore child_peer_TScore skindex_teen_total proxy_anx_TScore proxy_dep_TScore proxy_peer_rx_TScore racevar_NotWhite visibilityvar_VeryVisible visibilityvar_BarelyCovered male bullied age"


* Perform linear regression for children
regress tscore_internal_c `analysis_vars'
regress tscore_external_c `analysis_vars'
regress tscore_diff_c `analysis_vars'
regress tscore_ratio_c `analysis_vars'

* Perform linear regression for children
regress tscore_internal_p `analysis_vars'
regress tscore_external_p `analysis_vars'
regress tscore_diff_p `analysis_vars'
regress tscore_ratio_p `analysis_vars'