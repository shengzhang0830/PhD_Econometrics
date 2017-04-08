clear
cd C:\Users\sz029836\Downloads
log using question714.log,text replace
use fair4.dta
describe
summarize

reg vote growth inflation goodnews person duration party war if year>=1916&year<=2004
predict vote_hat
predict vote_hatstdv, stdf
list in 1/33
lincom _b[_cons]+0.22*_b[growth]+2.88*_b[inflation]+3*_b[goodnews]+1*_b[duration]-1*_b[party]

lincom _b[_cons]+1*_b[growth]+2*_b[inflation]+0*_b[goodnews]+1*_b[duration]+1*_b[party]+1*_b[person]

log close
clear
