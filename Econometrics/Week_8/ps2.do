* Problem Set 2
* Exercises 3.2, 3.5, 3.10, 3.11 and 3.14
* ps2.do

clear all
set more off

log using "./ps2.log", replace


* Exercise 3.2

* Part B
scalar beta2 = 0.076
scalar se = 0.044
scalar dof = 24 - 2
scalar alpha = .05
scalar cval = invttail(dof,alpha/2)
scalar lb = beta2 - cval * se
scalar ub = beta2 + cval * se
disp "A " (1-alpha) * 100 " percent confidence interval for beta2 is [" lb ", " ub "]"

* Part C
disp "For a two-tailed test at the " alpha " significance level, the appropriate critical value is " cval
scalar Ho = 0
scalar tstat = (beta2 - Ho) / se
disp "Under the null hypothesis that beta2 = " Ho ", our test statistic is " tstat

* Part D
scalar cval = invttail(dof,alpha)
disp "For a positive one-tailed test at the " alpha " significance level, the appropriate critical value is " cval
disp "Under the null hypothesis that beta2 = " Ho ", our test statistic is " tstat

clear all


* Exercise 3.5

* Part A
use insur
reg insurance income
matrix coefs = e(b)
matrix cov = e(V)
scalar dof = e(df_r)
predict insurance_hat, xb

local newobs = _N + 1
set obs `newobs'

mean insurance income
matrix avgs = e(b)
replace insurance = avgs[1,1] if _n == `newobs'
replace income = avgs[1,2] if _n == `newobs'

graph twoway (scatter insurance income if _n < `newobs') (line insurance_hat income, sort) (scatter insurance income if _n == `newobs'), legend(label(1 "Actual Insurance") label(2 "Predicted") label(3 "Means"))
graph export ps2_3_5_A.png, replace

drop if _n == `newobs'

* Part C
scalar alpha = .05
scalar cval = invttail(dof,1-alpha)
disp "For a negative one-tailed test at the " alpha " significance level, the appropriate critical value is " cval
scalar Ho = 5
scalar tstat = (coefs[1,1] - Ho) / sqrt(cov[1,1])
disp "Under the null hypothesis that beta2 = " Ho ", our test statistic is " tstat

* Part D
scalar alpha = .05
scalar cval = invttail(dof,alpha)
disp "For a positive one-tailed test at the " alpha " significance level, the appropriate critical value is " cval
scalar Ho = 1
scalar tstat = (coefs[1,1] - Ho) / sqrt(cov[1,1])
disp "Under the null hypothesis that beta2 = " Ho ", our test statistic is " tstat

clear all


* Exercise 3.10

* Part A
use star
reg totalscore small if !aide
matrix coefs = e(b)
matrix cov = e(V)
scalar dof = e(df_r)

scalar alpha = .05
scalar cval = invttail(dof,alpha)
disp "For a positive one-tailed test at the " alpha " significance level, the appropriate critical value is " cval
scalar Ho = 0
scalar tstat = (coefs[1,1] - Ho) / sqrt(cov[1,1])
disp "Under the null hypothesis that beta2 = " Ho ", our test statistic is " tstat
disp "Therefore, the corresponding p-value is " ttail(dof,tstat)

* Part B
scalar cval = invttail(dof,alpha/2)
scalar lb = coefs[1,1] - cval * sqrt(cov[1,1])
scalar ub = coefs[1,1] + cval * sqrt(cov[1,1])
disp "A " (1-alpha) * 100 " percent confidence interval for beta2 is [" lb ", " ub "]"

* Part C
reg readscore small if !aide
matrix coefs = e(b)
matrix cov = e(V)
scalar dof = e(df_r)

scalar alpha = .05
scalar cval = invttail(dof,alpha)
disp "For a positive one-tailed test at the " alpha " significance level, the appropriate critical value is " cval
scalar Ho = 0
scalar tstat = (coefs[1,1] - Ho) / sqrt(cov[1,1])
disp "Under the null hypothesis that beta2 = " Ho ", our test statistic is " tstat
disp "Therefore, the corresponding p-value is " ttail(dof,tstat)

reg mathscore small if !aide
matrix coefs = e(b)
matrix cov = e(V)
scalar dof = e(df_r)

scalar alpha = .05
scalar cval = invttail(dof,alpha)
disp "For a positive one-tailed test at the " alpha " significance level, the appropriate critical value is " cval
scalar Ho = 0
scalar tstat = (coefs[1,1] - Ho) / sqrt(cov[1,1])
disp "Under the null hypothesis that beta2 = " Ho ", our test statistic is " tstat
disp "Therefore, the corresponding p-value is " ttail(dof,tstat)

* Part D
reg totalscore aide if !small
matrix coefs = e(b)
matrix cov = e(V)
scalar dof = e(df_r)

scalar alpha = .05
scalar cval = invttail(dof,alpha)
disp "For a positive one-tailed test at the " alpha " significance level, the appropriate critical value is " cval
scalar Ho = 0
scalar tstat = (coefs[1,1] - Ho) / sqrt(cov[1,1])
disp "Under the null hypothesis that gamma2 = " Ho ", our test statistic is " tstat
disp "Therefore, the corresponding p-value is " ttail(dof,tstat)

* Part E
scalar cval = invttail(dof,alpha/2)
scalar lb = coefs[1,1] - cval * sqrt(cov[1,1])
scalar ub = coefs[1,1] + cval * sqrt(cov[1,1])
disp "A " (1-alpha) * 100 " percent confidence interval for gamma2 is [" lb ", " ub "]"

* Part F
reg readscore aide if !small
matrix coefs = e(b)
matrix cov = e(V)
scalar dof = e(df_r)

scalar alpha = .05
scalar cval = invttail(dof,alpha)
disp "For a positive one-tailed test at the " alpha " significance level, the appropriate critical value is " cval
scalar Ho = 0
scalar tstat = (coefs[1,1] - Ho) / sqrt(cov[1,1])
disp "Under the null hypothesis that gamma2 = " Ho ", our test statistic is " tstat
disp "Therefore, the corresponding p-value is " ttail(dof,tstat)

reg mathscore aide if !small
matrix coefs = e(b)
matrix cov = e(V)
scalar dof = e(df_r)

scalar alpha = .05
scalar cval = invttail(dof,alpha)
disp "For a positive one-tailed test at the " alpha " significance level, the appropriate critical value is " cval
scalar Ho = 0
scalar tstat = (coefs[1,1] - Ho) / sqrt(cov[1,1])
disp "Under the null hypothesis that gamma2 = " Ho ", our test statistic is " tstat
disp "Therefore, the corresponding p-value is " ttail(dof,tstat)

clear all


* Exercise 3.11

* Part A
use cps4_small
reg wage exper
matrix coefs = e(b)
matrix cov = e(V)
scalar dof = e(df_r)
predict wage_hat, xb

graph twoway (scatter wage exper) (line wage_hat exper, sort)
graph export ps2_3_11_A.png, replace

* Part B
scalar alpha = .05
scalar cval = invttail(dof,alpha)
disp "For a positive one-tailed test at the " alpha " significance level, the appropriate critical value is " cval
scalar Ho = 0
scalar tstat = (coefs[1,1] - Ho) / sqrt(cov[1,1])
disp "Under the null hypothesis that beta2 = " Ho ", our test statistic is " tstat
disp "Therefore, the corresponding p-value is " ttail(dof,tstat)

* Part C
reg wage exper if female
predict wage_hat_female, xb
graph twoway (scatter wage exper) (line wage_hat_female exper, sort) if female
graph export ps2_3_11_C1.png, replace

reg wage exper if !female
predict wage_hat_male, xb
graph twoway (scatter wage exper) (line wage_hat_male exper, sort) if !female
graph export ps2_3_11_C2.png, replace

reg wage exper if black
predict wage_hat_black, xb
graph twoway (scatter wage exper) (line wage_hat_black exper, sort) if black
graph export ps2_3_11_C3.png, replace

reg wage exper if !black & !asian & !female
predict wage_hat_wm, xb
graph twoway (scatter wage exper) (line wage_hat_wm exper, sort) if !black & !asian & !female
graph export ps2_3_11_C4.png, replace

* Part D
gen resid = wage - wage_hat
graph twoway scatter resid exper
graph export ps2_3_11_D1.png, replace

gen resid_female = wage - wage_hat_female
graph twoway scatter resid_female exper if female
graph export ps2_3_11_D2.png, replace

gen resid_male = wage - wage_hat_male
graph twoway scatter resid_male exper if !female
graph export ps2_3_11_D3.png, replace

gen resid_black = wage - wage_hat_black
graph twoway scatter resid_black exper if black
graph export ps2_3_11_D4.png, replace

gen resid_wm = wage - wage_hat_wm
graph twoway scatter resid_wm exper if !black & !asian & !female
graph export ps2_3_11_D5.png, replace

clear all


* Exercise 3.14

* Part A
use tuna
gen rprice2 = apr1 / apr2
gen rprice3 = apr1 / apr3

* Part B
gen ln_sal1 = log(sal1)
reg ln_sal1 rprice2
matrix coefs = e(b)
matrix cov = e(V)
scalar dof = e(df_r)

scalar alpha = .05
scalar cval = invttail(dof,alpha/2)
scalar lb = coefs[1,1] - cval * sqrt(cov[1,1])
scalar ub = coefs[1,1] + cval * sqrt(cov[1,1])
disp "A " (1-alpha) * 100 " percent confidence interval for beta2 is [" lb ", " ub "]"

* Part C
scalar alpha = .01
scalar cval = invttail(dof,1-alpha)
disp "For a negative one-tailed test at the " alpha " significance level, the appropriate critical value is " cval
scalar Ho = 0
scalar tstat = (coefs[1,1] - Ho) / sqrt(cov[1,1])
disp "Under the null hypothesis that beta2 = " Ho ", our test statistic is " tstat

* Part D
reg ln_sal1 rprice3
matrix coefs = e(b)
matrix cov = e(V)
scalar dof = e(df_r)

scalar alpha = .05
scalar cval = invttail(dof,alpha/2)
scalar lb = coefs[1,1] - cval * sqrt(cov[1,1])
scalar ub = coefs[1,1] + cval * sqrt(cov[1,1])
disp "A " (1-alpha) * 100 " percent confidence interval for gamma2 is [" lb ", " ub "]"

* Part E
scalar alpha = .01
scalar cval = invttail(dof,1-alpha)
disp "For a negative one-tailed test at the " alpha " significance level, the appropriate critical value is " cval
scalar Ho = 0
scalar tstat = (coefs[1,1] - Ho) / sqrt(cov[1,1])
disp "Under the null hypothesis that gamma2 = " Ho ", our test statistic is " tstat

clear all


log close
