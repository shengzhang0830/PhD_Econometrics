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

generate price = sprice/10000
reg price livarea age beds baths
predict yhat
gen yhat2 = yhat^2
gen yhat3 = yhat^3
summarize price sprice livarea age beds baths yhat yhat2 yhat3
reg price livarea age beds baths yhat2
test yhat2
reg price livarea age beds baths yhat2 yhat3
test yhat3
