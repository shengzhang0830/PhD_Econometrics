cd "C:\Users\Seth\Documents\Teaching\Econometrics\Econ 103 (Rojas)\Data"

capture log close
log using hw3.log, replace


*4.8
use wa_wheat.dta, clear
drop if time==48
gen log_time = ln(time)
gen time_sq = time^2

*Linear Model
reg chapman time
predict yhat_lin
predict ehat_lin, residuals
twoway (scatter chapman time) (line yhat_lin time), title("Linear Fitted Values") saving(fitplot_4.8_lin.gph, replace)
twoway (scatter ehat_lin time), title("Linear Residual Plot") saving(resid_plot_4.8_lin.gph, replace)
hist ehat_lin, title("Linear Residual Histogram") saving(resid_hist_4.8_lin.gph, replace)
summ ehat_lin, detail
scalar jb_lin = (r(N)/6)*(r(skewness)^2+((r(kurtosis)-3)^2)/4)
scalar pvalue_lin = chi2tail(2,jb_lin)
di "Jarque-Bera Statistic for Linear Model = " jb_lin
di "Jarque-Bera p-value for Linear Model = " pvalue_lin

*Linear-Log Model
reg chapman log_time
predict yhat_log
predict ehat_log, residuals
twoway (scatter chapman time) (line yhat_log time), title("Linear-Log Fitted Values") saving(fitplot_4.8_log.gph, replace)
twoway (scatter ehat_log time), title("Linear-Log Residual Plot") saving(resid_plot_4.8_log.gph, replace)
hist ehat_log, title("Linear-Log Residual Histogram") saving(resid_hist_4.8_log.gph, replace)
summ ehat_log, detail
scalar jb_log = (r(N)/6)*(r(skewness)^2+((r(kurtosis)-3)^2)/4)
scalar pvalue_log = chi2tail(2,jb_log)
di "Jarque-Bera Statistic for Linear-Log Model = " jb_log
di "Jarque-Bera p-value for Linear-Log Model = " pvalue_log

*Quadratic Model
reg chapman time_sq
predict yhat_q
predict ehat_q, residuals
twoway (scatter chapman time) (line yhat_q time), title("Quadratic Fitted Values") saving(fitplot_4.8_q.gph, replace)
twoway (scatter ehat_q time), title("Quadratic Residual Plot") saving(resid_plot_4.8_q.gph, replace)
hist ehat_q, title("Quadratic Residual Histogram") saving(resid_hist_4.8_q.gph, replace)
summ ehat_q, detail
scalar jb_q = (r(N)/6)*(r(skewness)^2+((r(kurtosis)-3)^2)/4)
scalar pvalue_q = chi2tail(2,jb_q)
di "Jarque-Bera Statistic for Quadratic Model = " jb_q
di "Jarque-Bera p-value for Quadratic Model = " pvalue_q


*4.11(a)
use fair4.dta, clear
keep if year>=1916 & year<=2008
reg vote growth
predict vote_hat_a
predict e_hat_a, residuals
list vote_hat_a e_hat_a if year==2008

*4.11(b)
reg vote growth if year>=1916 & year<=2004
predict vote_hat_b
list vote_hat_b if year==2008

*4.11(c)
reg vote growth if year>=1916 & year<=2004
scalar sig2 = e(rss)/e(df_r)
summ growth if year>=1916 & year<=2004
scalar growth_bar = r(mean)
scalar sampsize = r(N)
gen sqdev = (growth-growth_bar)^2
egen sumsqdev = sum(sqdev)
gen sef = sqrt(sig2*(1+1/sampsize+sqdev/sumsqdev))
di sig2
di sampsize
list sqdev sumsqdev sef if year==2008


*4.12(a)
use newbroiler.dta, clear
gen rec_p = 1/p
reg q rec_p
predict qhat_rec
twoway (scatter q p) (line qhat_rec p, sort), title("Reciprocal Fitted Values") saving(fitplot_4.12_rec.gph, replace)

*4.12(c)
gen log_p = ln(p)
reg q log_p
predict qhat_log
twoway (scatter q p) (line qhat_log p, sort), title("Linear-Log Fitted Values") saving(fitplot_4.12_log.gph, replace)

log close
