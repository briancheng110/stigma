// PROMIS scoring tables
// Each survey set has a defined raw score to T-score conversion table
// There is no elegant way to do this. A lookup table is the only way

//PROMIS Ped SF v2.0 - Depressive Sx 8a
local promis_depression_c_8 = 35.2
local promis_depression_c_9 = 40.4
local promis_depression_c_10 = 43.2
local promis_depression_c_11 = 45.5
local promis_depression_c_12 = 47.4
local promis_depression_c_13 = 49.1
local promis_depression_c_14 = 50.6
local promis_depression_c_15 = 52
local promis_depression_c_16 = 53.3
local promis_depression_c_17 = 54.5
local promis_depression_c_18 = 55.7
local promis_depression_c_19 = 56.8
local promis_depression_c_20 = 57.9
local promis_depression_c_21 = 59
local promis_depression_c_22 = 60
local promis_depression_c_23 = 61.1
local promis_depression_c_24 = 62.1
local promis_depression_c_25 = 63.1
local promis_depression_c_26 = 64.1
local promis_depression_c_27 = 65.1
local promis_depression_c_28 = 66.1
local promis_depression_c_29 = 67.2
local promis_depression_c_30 = 68.2
local promis_depression_c_31 = 69.3
local promis_depression_c_32 = 70.3
local promis_depression_c_33 = 71.4
local promis_depression_c_34 = 72.6
local promis_depression_c_35 = 73.8
local promis_depression_c_36 = 75.1
local promis_depression_c_37 = 76.5
local promis_depression_c_38 = 78.1
local promis_depression_c_39 = 79.9
local promis_depression_c_40 = 82.4

//PROMIS Ped SF v2.0 - Anxiety 8a
local promis_anxiety_c_8 = 33.5
local promis_anxiety_c_9 = 38
local promis_anxiety_c_10 = 40.6
local promis_anxiety_c_11 = 43
local promis_anxiety_c_12 = 44.9
local promis_anxiety_c_13 = 46.7
local promis_anxiety_c_14 = 48.3
local promis_anxiety_c_15 = 49.8
local promis_anxiety_c_16 = 51.2
local promis_anxiety_c_17 = 52.5
local promis_anxiety_c_18 = 53.8
local promis_anxiety_c_19 = 55.1
local promis_anxiety_c_20 = 56.3
local promis_anxiety_c_21 = 57.5
local promis_anxiety_c_22 = 58.7
local promis_anxiety_c_23 = 59.9
local promis_anxiety_c_24 = 61
local promis_anxiety_c_25 = 62.2
local promis_anxiety_c_26 = 63.4
local promis_anxiety_c_27 = 64.5
local promis_anxiety_c_28 = 65.7
local promis_anxiety_c_29 = 66.9
local promis_anxiety_c_30 = 68.1
local promis_anxiety_c_31 = 69.3
local promis_anxiety_c_32 = 70.6
local promis_anxiety_c_33 = 71.8
local promis_anxiety_c_34 = 73.2
local promis_anxiety_c_35 = 74.6
local promis_anxiety_c_36 = 76
local promis_anxiety_c_37 = 77.6
local promis_anxiety_c_38 = 79.3
local promis_anxiety_c_39 = 81.1
local promis_anxiety_c_40 = 83.3

//PROMIS Ped SF v2.0 - Peer Relationships 8a
local promis_peer_rel_c_8 = 17.8
local promis_peer_rel_c_9 = 20
local promis_peer_rel_c_10 = 21.4
local promis_peer_rel_c_11 = 23
local promis_peer_rel_c_12 = 24.4
local promis_peer_rel_c_13 = 25.7
local promis_peer_rel_c_14 = 26.9
local promis_peer_rel_c_15 = 28.1
local promis_peer_rel_c_16 = 29.2
local promis_peer_rel_c_17 = 30.3
local promis_peer_rel_c_18 = 31.4
local promis_peer_rel_c_19 = 32.5
local promis_peer_rel_c_20 = 33.6
local promis_peer_rel_c_21 = 34.6
local promis_peer_rel_c_22 = 35.6
local promis_peer_rel_c_23 = 36.7
local promis_peer_rel_c_24 = 37.7
local promis_peer_rel_c_25 = 38.8
local promis_peer_rel_c_26 = 39.8
local promis_peer_rel_c_27 = 40.9
local promis_peer_rel_c_28 = 42
local promis_peer_rel_c_29 = 43.1
local promis_peer_rel_c_30 = 44.3
local promis_peer_rel_c_31 = 45.5
local promis_peer_rel_c_32 = 46.7
local promis_peer_rel_c_33 = 48
local promis_peer_rel_c_34 = 49.4
local promis_peer_rel_c_35 = 50.9
local promis_peer_rel_c_36 = 52.6
local promis_peer_rel_c_37 = 54.5
local promis_peer_rel_c_38 = 56.8
local promis_peer_rel_c_39 = 59.5
local promis_peer_rel_c_40 = 64.4

//PROMIS Parent Proxy SF v2.0 - Depressive Symptoms 6a
local promis_depression_p_6 = 36.2
local promis_depression_p_7 = 42.1
local promis_depression_p_8 = 45.4
local promis_depression_p_9 = 48
local promis_depression_p_10 = 50.2
local promis_depression_p_11 = 52.1
local promis_depression_p_12 = 53.9
local promis_depression_p_13 = 55.6
local promis_depression_p_14 = 57.2
local promis_depression_p_15 = 58.9
local promis_depression_p_16 = 60.5
local promis_depression_p_17 = 62.1
local promis_depression_p_18 = 63.7
local promis_depression_p_19 = 65.2
local promis_depression_p_20 = 66.8
local promis_depression_p_21 = 68.4
local promis_depression_p_22 = 70
local promis_depression_p_23 = 71.5
local promis_depression_p_24 = 73.1
local promis_depression_p_25 = 74.7
local promis_depression_p_26 = 76.3
local promis_depression_p_27 = 78.1
local promis_depression_p_28 = 80.2
local promis_depression_p_29 = 82.4
local promis_depression_p_30 = 84.6

//PROMIS Parent Proxy SF v2.0 - Anxiety 8a
local promis_anxiety_p_8 = 34.6
local promis_anxiety_p_9 = 39.7
local promis_anxiety_p_10 = 42.7
local promis_anxiety_p_11 = 45.1
local promis_anxiety_p_12 = 47.1
local promis_anxiety_p_13 = 48.8
local promis_anxiety_p_14 = 50.4
local promis_anxiety_p_15 = 51.9
local promis_anxiety_p_16 = 53.3
local promis_anxiety_p_17 = 54.7
local promis_anxiety_p_18 = 56
local promis_anxiety_p_19 = 57.4
local promis_anxiety_p_20 = 58.7
local promis_anxiety_p_21 = 60
local promis_anxiety_p_22 = 61.4
local promis_anxiety_p_23 = 62.8
local promis_anxiety_p_24 = 64.2
local promis_anxiety_p_25 = 65.5
local promis_anxiety_p_26 = 66.9
local promis_anxiety_p_27 = 68.3
local promis_anxiety_p_28 = 69.6
local promis_anxiety_p_29 = 71
local promis_anxiety_p_30 = 72.3
local promis_anxiety_p_31 = 73.6
local promis_anxiety_p_32 = 74.8
local promis_anxiety_p_33 = 76.1
local promis_anxiety_p_34 = 77.4
local promis_anxiety_p_35 = 78.8
local promis_anxiety_p_36 = 80.2
local promis_anxiety_p_37 = 81.6
local promis_anxiety_p_38 = 83.2
local promis_anxiety_p_39 = 84.7
local promis_anxiety_p_40 = 86.2

//PROMIS Parent Proxy SF v2.0 – Peer Relations 7a
local promis_peer_rel_p_7 = 17.7
local promis_peer_rel_p_8 = 20.4
local promis_peer_rel_p_9 = 22.2
local promis_peer_rel_p_10 = 23.7
local promis_peer_rel_p_11 = 25
local promis_peer_rel_p_12 = 26.2
local promis_peer_rel_p_13 = 27.3
local promis_peer_rel_p_14 = 28.4
local promis_peer_rel_p_15 = 29.5
local promis_peer_rel_p_16 = 30.7
local promis_peer_rel_p_17 = 31.9
local promis_peer_rel_p_18 = 33.2
local promis_peer_rel_p_19 = 34.7
local promis_peer_rel_p_20 = 36.2
local promis_peer_rel_p_21 = 37.8
local promis_peer_rel_p_22 = 39.5
local promis_peer_rel_p_23 = 41.2
local promis_peer_rel_p_24 = 42.8
local promis_peer_rel_p_25 = 44.4
local promis_peer_rel_p_26 = 46
local promis_peer_rel_p_27 = 47.6
local promis_peer_rel_p_28 = 49.1
local promis_peer_rel_p_29 = 50.7
local promis_peer_rel_p_30 = 52.3
local promis_peer_rel_p_31 = 53.9
local promis_peer_rel_p_32 = 55.7
local promis_peer_rel_p_33 = 57.7
local promis_peer_rel_p_34 = 60.3
local promis_peer_rel_p_35 = 65.4
