clear
cd C:\Users\sz029836\Downloads
log using question214.log,text replace
use fair4.dta
describe
summarize
twoway(scatter vote growth) if year>=1916
reg vote growth if year>=1916
twoway (scatter vote growth) (lfit vote growth) if year>=1916
twoway(scatter vote growth) if year>=1916
twoway(scatter vote growth) if year<=2004&year>=1916
reg vote growth if year<=2004&year>=1916
twoway (scatter vote growth) (lfit vote growth) if year<=2004&year>=1916
summarize growth if year==2008
summarize vote if year==2008
twoway(scatter vote inflation) if year>=1916
reg vote inflation if year>=1916
twoway (scatter vote inflation) (lfit vote inflation) if year>=1916
log close
clear
