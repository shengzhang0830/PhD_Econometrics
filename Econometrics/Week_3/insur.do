clear
cd C:\Users\sz029836\Downloads
log using question305.log,text replace
use insur.dta
describe
summarize

twoway(scatter insurance income)
reg insurance income
twoway (scatter insurance income) (lfit insurance income)

scalar define t_value = (_b[income]-5)/_se[income]
display t_value
display invttail(18,0.95)

scalar define t_value2 = (_b[income]-1)/_se[income]
display t_value2
display invttail(18,0.05)

log close
clear
