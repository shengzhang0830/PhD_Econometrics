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
