// Define the questions for each survey

// List of all survey set names
//local survey_list = "promis_peer_rel_p promis_anxiety_p promis_depression_p external_stigma_p internal_stigma_p skindex_c promis_peer_rel_c promis_anxiety_c promis_depression_c external_stigma_c internal_stigma_c"
local survey_list = "anx_TScore child_depression_TScore child_peer_TScore skindex_teen_total proxy_anx_TScore proxy_dep_TScore proxy_peer_rx_TScore"

// Child surveys
//--------------------------------------

local internal_stigma_c = "NQSTGped04c NQSTGped07c NQSTGped17c NQSTGped19c NQSTGped09c NQSTGped11c NQSTGped14c NQSTGped15c QDermSTGped03 QDermSTGped04 QDermSTGped08"
local external_stigma_c = "NQSTGped01c NQSTGped02c NQSTGped03c NQSTGped05c NQSTGped06c NQSTGped08c  NQSTGped10c NQSTGped20c QDermSTGped01 QDermSTGped02  QNQSTGped07"

//PROMIS Ped SF v2.0 - Depressive Sx 8a
local promis_depression_c = "promis_depr_symp_child_1 promis_depr_symp_child_2 promis_depr_symp_child_3 promis_depr_symp_child_4 promis_depr_symp_child_5 promis_depr_symp_child_6 promis_depr_symp_child_7 promis_depr_symp_child_8"

//PROMIS Ped SF v2.0 - Anxiety 8a
local promis_anxiety_c = "promis_anxiety_child_1 promis_anxiety_child_2 promis_anxiety_child_3 promis_anxiety_child_4 promis_anxiety_child_5 promis_anxiety_child_6 promis_anxiety_child_7 promis_anxiety_child_8"

//PROMIS Ped SF v2.0 - Peer Relationships 8a
local promis_peer_rel_c = "promis_child_peer_rel_1 promis_child_peer_rel_2 promis_child_peer_rel_3 promis_child_peer_rel_4 promis_child_peer_rel_5 promis_child_peer_rel_6 promis_child_peer_rel_7 promis_child_peer_rel_8"

//Skindex (not a PROMIS measure)
local skindex_c = "skindex_teen_1 skindex_teen_2 skindex_teen_3 skindex_teen_4 skindex_teen_5 skindex_teen_6 skindex_teen_7 skindex_teen_8 skindex_teen_9 skindex_teen_10 skindex_teen_11 skindex_teen_12 skindex_teen_13 skindex_teen_14 skindex_teen_15 skindex_teen_16 skindex_teen_17 skindex_teen_18 skindex_teen_19 skindex_teen_20 skindex_teen_21"

// Proxy surveys
//--------------------------------------
local internal_stigma_p = "QNQSTGprox17 QNQSTGprox19 QNQSTGprox09 QNQSTGprox11 QNQSTGprox14 QNQSTGprox15 QDermSTGprox03 QDermSTGprox04 QDermSTGprox08 QNQSTGprox07"
local external_stigma_p = "QNQSTGprox01 QNQSTGprox02 QNQSTGprox05 QNQSTGprox08 QDermSTGprox01 QDermSTGprox02 QNQSTGprox20 QNQSTGprox03 QNQSTGprox04 QNQSTGprox06 QNQSTGprox10 QDermSTGprox07"

//PROMIS Parent Proxy SF v2.0 - Depressive Symptoms 6a
local promis_depression_p = "promis_depr_child_1proxy promis_depr_child_2proxy promis_depr_child_3proxy promis_depr_child_4proxy promis_depr_child_5proxy promis_depr_child_6proxy"

//PROMIS Parent Proxy SF v2.0 - Anxiety 8a
local promis_anxiety_p = "promis_anxiety_1proxy promis_anxiety_2proxy promis_anxiety_3proxy promis_anxiety_4proxy promis_anxiety_5proxy promis_anxiety_6proxy promis_anxiety_7proxy promis_anxiety_8proxy"

//PROMIS Parent Proxy SF v2.0 – Peer Relations 7a
local promis_peer_rel_p = "promis_child_peer_1_proxy promis_child_peer_2_proxy promis_child_peer_3_proxy promis_child_peer_4_proxy promis_child_peer_5_proxy promis_child_peer_6_proxy promis_child_peer_7_proxy"


local date_vars = "survey_start_date birthdate birthdate_year"

local diseases = "Acne AlopeciaHairLoss AtopicDermatitisEczemaDermatitis BirthmarkHemangioma DermatomyositisLupus EpidermolysisBullosa HidradenitisSuppurativa Hyperhidrosis Ichthyosis Impetigo KeloidBurnScarOtherWound Keratosispilaris Lichensclerosus Molluscum MorpheaScleroderma Nevusandotherbenignskintumorsgrowths Otherskincondition Pityrosporumfolliculitis Psoriasis Vascularmalformation VitiligoPigmentationDisorder Warts"

