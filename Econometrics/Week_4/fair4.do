clear
cd C:\Users\sz029836\Downloads
log using question411.log,text replace
use fair4.dta
describe
summarize

reg vote growth if year>=1916 & year<=2008
predict vote_hat if year>=1916 & year<=2008
twoway (scatter vote growth) (line vote_hat growth, sort) if year>=1916 & year<=2008
list growth
list vote

reg vote growth if year>=1916 & year<=2004

log close
clear
