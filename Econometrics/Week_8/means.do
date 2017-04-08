clear
cd C:\Users\sz029836\Downloads
log using question710.log,text replace
use means.dta
describe
summarize

summarize lnprice lnunits if d==1&izlaw==1
summarize lnprice lnunits if d==1&izlaw==0

bysort izlaw d: summarize lnprice lnunits
reg lnprice izlaw d izlaw_d
estimates store did11
lincom (_cons + izlaw + d + izlaw_d)-(_cons + d)-((_cons + izlaw)-_cons)
reg lnunits izlaw d izlaw_d
estimates store did21
lincom (_cons + izlaw + d + izlaw_d)-(_cons + d)-((_cons + izlaw)-_cons)

reg lnprice izlaw d izlaw_d lmedhhinc
estimates store did12
reg lnunits izlaw d izlaw_d lmedhhinc
estimates store did22

reg lnprice izlaw d izlaw_d lmedhhinc educattain proppoverty lpop
estimates store did13
reg lnunits izlaw d izlaw_d lmedhhinc educattain proppoverty lpop
estimates store did23

log close
clear
