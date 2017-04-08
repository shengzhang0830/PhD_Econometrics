describe
summarize
twoway(scatter wage educ)
reg wage educ
twoway (scatter wage educ) (lfit wage educ)
reg wage educ, nocons
generate residual = wage + 6.71 - 1.98*educ
twoway(scatter residual educ)
replace residual = wage - wage_hat
twoway(scatter residual educ)
generate educ2 = educ*educ
reg wage educ
predict wage_hat
twoway (scatter wage educ) (line wage_hat educ, sort)
reg wage educ2
predict wage_hat2
twoway (scatter wage educ) (line wage_hat educ, sort) (line wage_hat2 educ, sort)
generate log_wage = log(wage)
histogram log_wage
