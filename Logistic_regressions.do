//Logistic regression analyses
summarize tscore_diff_c, detail
local q25 = r(p25)
local q50 = r(p50)
local q75 = r(p75)

gen high_tscore_diff_c = 1 if tscore_diff_c >= `q75'
replace high_tscore_diff_c = 0 if high_tscore_diff_c == .

gen low_tscore_diff_c = 1 if tscore_diff_c <= `q25'
replace low_tscore_diff_c = 0 if low_tscore_diff_c == .

logit high_tscore_diff_c i.age_group i.visible_code i.male i.white i.bullied anx_TScore child_depression_TScore child_peer_TScore skindex_teen_total proxy_anx_TScore proxy_dep_TScore proxy_peer_rx_TScore

logit low_tscore_diff_c i.age_group i.visible_code i.male i.white i.bullied anx_TScore child_depression_TScore child_peer_TScore skindex_teen_total proxy_anx_TScore proxy_dep_TScore proxy_peer_rx_TScore