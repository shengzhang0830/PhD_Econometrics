clear
cd C:\Users\sz029836\Downloads
log using question211.log,text replace
use br2.dta
describe
summarize
summarize price, detail
summarize sqft, detail
histogram (price)

twoway(scatter price sqft) if traditional==1
reg price sqft if traditional==1
twoway (scatter price sqft) (lfit price sqft) if traditional==1

generate sqft2 =sqft^2 if traditional==1
reg price sqft2 if traditional==1
predict priceq, xb
twoway(scatter price sqft) (line priceq sqft, sort lwidth(medthick)) if traditional==1
di "slope at 2000 = " 2*_b[sqft2]*2000
di "elasticity at 2000 = "2*_b[sqft2]*2000^2/(_b[_cons]+_b[sqft2]*2000^2)

generate residual = price - (-28407.56) - 73.77*sqft
reg residual sqft if traditional==1
twoway scatter residual sqft if traditional==1
generate residual2 = price - (55776.56) - 0.0154*sqft^2
reg residual2 sqft if traditional==1
twoway scatter residual2 sqft if traditional==1

generate log_price = log(price)
regress log_price sqft if traditional==1
predict log_price_hat if traditional==1
generate price_hat = exp(log_price_hat) if traditional==1
twoway(scatter price sqft) (line price_hat sqft, sort) if traditional==1
margins, expression(exp(predict(xb))) dydx(sqft) at(sqft==2000)

generate residual3 = price-price_hat
reg residual3 sqft

log close
clear
