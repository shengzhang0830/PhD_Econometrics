clear
cd C:\Users\sz029836\Downloads
log using question706.log,text replace
use tuna.dta
describe
summarize

gen lnsal1 = ln(sal1)
reg lnsal1 apr1 apr2 apr3 disp dispad

test disp dispad
lincom dispad-disp

log close
clear
