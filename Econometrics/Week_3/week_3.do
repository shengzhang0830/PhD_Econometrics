clear 
cd "F:\Dropbox\Courses\TA Lecture Notes\103L-Introduction to Econometrics\Slides\Week 3" // set up directory
log using week3.log,text replace // set up log file

use br2.dta,clear // load data
describe
summarize

*replicate SSE
regress price sqft if traditional==1 // SSE = 1.375e+12
generate log_price = log(price)
regress log_price sqft if traditional==1 // SSE = 50.36

*replicate SSE of linear model
regress price sqft if traditional==1
predict price_hat1
generate residual1_sq = (price-price_hat1)^2
summarize residual1_sq if traditional==1
display r(mean)*r(N)

*true SSE for log-linear model
regress log_price sqft if traditional==1
predict log_price_hat
generate price_hat2 = exp(log_price_hat)
generate residual2_sq = (price-price_hat2)^2
summarize residual2_sq if traditional==1
display r(mean)*r(N)

*Part (a)
regress price sqft if traditional==1
display _b[sqft]
display _se[sqft]
*method 1
scalar define t_value = (_b[sqft]-0)/_se[sqft]
display t_value
display ttail(580,t_value)
*method 2
display invttail(580,0.01)

*Part (b)
scalar define y_hat = _b[_cons] + _b[sqft]*2000
matrix list e(V)
matrix V = e(V)
scalar define cov = V[2,1]
scalar define var_price = _se[_cons]^2 + 2*cov*2000 + _se[sqft]^2*2000^2
scalar define se_price = sqrt(var_price)
scalar define t_value = (y_hat - 120000)/se_price
display t_value
display ttail(580,t_value)

*Part (c)
display y_hat - invttail(580,0.025)*se_price 
display y_hat + invttail(580,0.025)*se_price 

*a simpler method
lincom _b[_cons] + _b[sqft]*2000
display y_hat  // compare to previous method
display se_price

*Part (d)
generate sqft2 = sqft*sqft
regress price sqft2 if traditional == 1
scalar define marginal_effect = 2*_b[sqft2]*2000
scalar define se_marginal = 2*2000*_se[sqft2]
scalar define t_value = (marginal_effect-75)/se_marginal
display t_value
display 1-ttail(580,t_value)
*a simpler method
lincom 2*_b[sqft2]*2000

*Part (e)
regress log_price sqft if traditional == 1
nlcom _b[sqft]*exp(_b[_cons]+2000*_b[sqft])

log close
clear
