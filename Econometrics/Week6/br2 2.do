clear
cd C:\Users\sz029836\Downloads
log using question513.log,text replace
use br2.dta
describe
summarize

reg price sqft age

scalar t1 = (_b[age]+1000)/_se[age]
scalar list t1

generate sqft2 = sqft^2
generate age2 = age^2
reg price sqft age sqft2 age2

lincom sqft+4600*sqft2

lincom age+40*age2
scalar t = (r(estimate)+1000)/r(se)
scalar crit = invttail(e(df_r),.95)
scalar pval = ttail(e(df_r),t)
scalar list crit t pval
return list

reg price sqft age sqft2 age2 c.age#c.sqft

lincom sqft+2*662*sqft2+20*c.age#c.sqft
lincom sqft+4600*sqft2+20*c.age#c.sqft
lincom sqft+2*7897*sqft2+20*c.age#c.sqft

lincom age+2*1*age2+2300*c.age#c.sqft
lincom age+2*20*age2+2300*c.age#c.sqft
lincom age+2*80*age2+2300*c.age#c.sqft

di crit = invttail(1074,.95)

log close
clear
