clear
cd C:\Users\sz029836\Downloads
log using question625.log,text replace
use tuna.dta
describe
summarize

gen sales = sal1/1000
gen pr1 = apr1*100
gen pr2 = apr2*100
gen pr3 = apr3*100

reg sal1 apr1 apr2 apr3
reg sal1 pr1 pr2 pr3
reg sales pr1 pr2 pr3

gen lnsal1 = ln(sal1)
gen lnsales = ln(sales)
reg lnsal1 apr1 apr2 apr3
reg lnsal1 pr1 pr2 pr3
reg lnsales pr1 pr2 pr3

gen lnapr1 = ln(apr1)
gen lnapr2 = ln(apr2)
gen lnapr3 = ln(apr3)
gen lnpr1 = ln(pr1)
gen lnpr2 = ln(pr2)
gen lnpr3 = ln(pr3)
reg lnsal1 lnapr1 lnapr2 lnapr3
reg lnsal1 lnpr1 lnpr2 lnpr3
reg lnsales lnpr1 lnpr2 lnpr3
