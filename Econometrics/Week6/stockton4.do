clear
cd C:\Users\sz029836\Downloads
log using question615.log,text replace
use stockton4.dta
describe
summarize

reg sprice livarea age beds baths

lincom 8*age

lincom 2*livarea
scalar t = (r(estimate)-20000)/r(se)
scalar crit = invttail(e(df_r),.05)
scalar pval = ttail(e(df_r),t)
scalar list crit t pval
return list

lincom 2*livarea+1*beds
