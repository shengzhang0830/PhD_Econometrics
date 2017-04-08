clear
cd C:\Users\sz029836\Downloads
log using question408.log,text replace
use wa_wheat.dta
describe
summarize

reg chapman time if time<=47
twoway (scatter chapman time) (lfit chapman time) if time<=47

gen ltime = ln(time) if time<=47
twoway (scatter chapman ltime) if time<=47
reg chapman ltime if time<=47
predict chapman_hat if time<=47
twoway (scatter chapman time) (line chapman_hat time, sort) if time<=47


gen time2 = (time)^2 if time<=47
twoway (scatter chapman time2) if time<=47
reg chapman time2 if time<=47
predict chapman_hat2 if time<=47
twoway (scatter chapman time) (line chapman_hat time, sort) if time<=47

generate residual1 = chapman - (0.695384) - 0.0150248*time if time<=47
reg residual time if time<=47
twoway scatter residual time if time<=47
predict chapmanhat1 if time<=47
predict ehat, residuals
predict sef, stdf
ereturn list
scalar sig2 = e(rss)/e(df_r)
di "sigma-hat squared = " sig2
histogram ehat, percent
summarize ehat, detail
scalar jb = (r(N)/6)*( (r(skewness)^2) + ((r(kurtosis)-3)^2)/4 )
di "Jarque-Bera Statistic = " jb
scalar pvalue = chi2tail(2,jb)
di "Jarque-Bera p-value = " pvalue

generate residual2 = chapman - (0.5623055) - 0.1696066*ltime if time<=47
reg residual2 time if time<=47
twoway scatter residual2 time if time<=47
predict chapmanhat2 if time<=47
predict ehat2, residuals
predict sef2, stdf
ereturn list
scalar sig22 = e(rss)/e(df_r)
di "sigma-hat squared = " sig22
histogram ehat2, percent
summarize ehat2, detail
scalar jb2 = (r(N)/6)*( (r(skewness)^2) + ((r(kurtosis)-3)^2)/4 )
di "Jarque-Bera Statistic = " jb2
scalar pvalue = chi2tail(2,jb2)
di "Jarque-Bera p-value = " pvalue

generate residual3 = chapman - (0.799446) - 0.0003375*time2 if time<=47
reg residual3 time if time<=47
twoway scatter residual3 time if time<=47
predict chapmanhat3 if time<=47
predict ehat3, residuals
predict sef3, stdf
ereturn list
scalar sig23 = e(rss)/e(df_r)
di "sigma-hat squared = " sig23
histogram ehat3, percent
summarize ehat3, detail
scalar jb3 = (r(N)/6)*( (r(skewness)^2) + ((r(kurtosis)-3)^2)/4 )
di "Jarque-Bera Statistic = " jb3
scalar pvalue = chi2tail(2,jb3)
di "Jarque-Bera p-value = " pvalue

log close
clear
