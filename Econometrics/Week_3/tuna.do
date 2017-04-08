clear
cd C:\Users\sz029836\Downloads
log using question314.log,text replace
use tuna.dta
describe
summarize

generate rprice2 = apr1/apr2
generate rprice3 = apr1/apr3
reg sal1 rprice2
reg sal1 rprice3

generate ln_sal1 = ln(sal1)
reg ln_sal1 rprice2
scalar define tc975 = invttail(50, 0.025)
di "t-critical value for 97.5 percentile = " tc975
scalar ub2 = _b[rprice2] + tc975*_se[rprice2]
scalar lb2 = _b[rprice2] - tc975*_se[rprice2]
di"The 95% inteval estimate for beta_2 is "lb2 "," ub2

scalar define t_value = (_b[rprice2]-0)/_se[rprice2]
display t_value
display invttail(50,0.99)

reg ln_sal1 rprice3
scalar define tc975 = invttail(50, 0.025)
di "t-critical value for 97.5 percentile = " tc975
scalar ub3 = _b[rprice3] + tc975*_se[rprice3]
scalar lb3 = _b[rprice3] - tc975*_se[rprice3]
di"The 95% inteval estimate for beta_2 is "lb3 "," ub3

scalar define t_value = (_b[rprice3]-0)/_se[rprice3]
display t_value
display invttail(50,0.99)

log close
clear
