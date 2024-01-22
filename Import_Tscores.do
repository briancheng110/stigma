capture cd "C:\Users\Brian\Documents\Stigma\"
capture cd "C:\Users\vboxusr\Documents\Stigma\"


import excel using "C:\Users\Brian\Documents\Stigma\tscores.xlsx", sheet("All raw data T scores") firstrow clear
keep id anx_TScore child_depression_TScore child_peer_TScore skindex_teen_total proxy_anx_TScore proxy_dep_TScore proxy_peer_rx_TScore

drop if id == ""

save tscores.dta, replace