*Econ 103 HW4 Solution
*If you find any mistake, please contact yujingxu@ucla.edu. Thanks!

log using HW4, replace

*Q5.13

use br2, clear

*(a)
reg price sqft age
lincom _b[age]+1000

*(b)
gen sqft2=sqft^2
gen age2=age^2
reg price sqft sqft2 age age2
*(i)
summarize sqft
return list
scalar ME_small=_b[sqft]+2*_b[sqft2]*r(min)
scalar ME_large=_b[sqft]+2*_b[sqft2]*r(max)
scalar ME_2300=_b[sqft]+2*_b[sqft2]*2300
di ME_small, ME_large, ME_2300
*(ii)
summarize age
return list
scalar ME_young=_b[age]+2*_b[age2]*r(min)
scalar ME_old=_b[age]+2*_b[age2]*r(max)
scalar ME_20=_b[age]+2*_b[age2]*20
di ME_young, ME_old, ME_20
*(iii)
lincom _b[sqft]+2*_b[sqft2]*2300
*(iv)
lincom _b[age]+2*_b[age2]*20+1000

*(c)
reg price sqft sqft2 age age2 c.sqft#c.age
*(i)
summarize sqft
return list
scalar ME_small_1=_b[sqft]+2*_b[sqft2]*r(min)+_b[c.sqft#c.age]*20
scalar ME_large_1=_b[sqft]+2*_b[sqft2]*r(max)+_b[c.sqft#c.age]*20
scalar ME_2300_1=_b[sqft]+2*_b[sqft2]*2300+_b[c.sqft#c.age]*20
di ME_small_1, ME_large_1, ME_2300_1
*(ii)
summarize age
return list
scalar ME_young_1=_b[age]+2*_b[age2]*r(min)+_b[c.sqft#c.age]*2300
scalar ME_old_1=_b[age]+2*_b[age2]*r(max)+_b[c.sqft#c.age]*2300
scalar ME_20_1=_b[age]+2*_b[age2]*20+_b[c.sqft#c.age]*2300
di ME_young_1, ME_old_1, ME_20_1
*(iii)
lincom _b[sqft]+2*_b[sqft2]*2300+_b[c.sqft#c.age]*20
*(iv)
lincom _b[age]+2*_b[age2]*20+_b[c.sqft#c.age]*2300+1000

*Q5.23
use golf, clear

*(a)
gen age_sq=age^2
gen age_cu=age^3
reg score age age_sq age_cu

*(b)
predict score_p
gen age10=age*10
preserve
collapse score_p, by(age10)
list
restore

*(c)
set obs 151
replace age=7 in 151
replace age_sq=49 in 151
replace age_cu=343 in 151
drop score_p
predict score_p
list in 151

*Q5.24

use rice, clear

*(a)(c)
gen ln_prod=log(prod)
gen ln_area=log(area)
gen ln_labor=log(labor)
gen ln_fert=log(fert)
reg ln_prod ln_area ln_labor ln_fert

*(b)
lincom _b[ln_area]-0.5
di invttail(348,0.005)

*(d)
lincom _b[ln_labor]-0.3
di invttail(348,0.05)
