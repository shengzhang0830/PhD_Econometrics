clear
cd C:\Users\sz029836\Downloads
log using question412.log,text replace
use newbroiler.dta
describe
summarize

generate invprice = 1/p
reg q invprice
predict q_hat1
twoway (scatter q p) (line q_hat1 p, sort)
scalar define b1 = _b[_cons]
scalar define b2 = _b[invprice]
summarize invprice,detail
scalar define x1 = r(p50)
scalar define y1 = 48.36496*x1-6.024364
scalar define elas = (-b2*(1/x1^2))*(x1/y1)
display elas

generate lnprice = ln(p)
reg q lnprice
predict q_hat2
twoway (scatter q p) (line q_hat2 p, sort)
scalar define c1 = _b[_cons]
scalar define c2 = _b[lnprice]
scalar define x2 = 1.31
scalar define y2 = -31.9078*ln(x2)+41.21114
scalar define elas = (c2/y2)
display elas

log close
clear
