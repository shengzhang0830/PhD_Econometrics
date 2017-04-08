* 2.11
use "br2.dta"
* (a)
twoway (scatter price sqft) if traditional==1
* (b)
reg price sqft if traditional==1
predict price_hat_linear if traditional==1
twoway (scatter price sqft) (line price_hat_linear sqft, sort) if traditional==1
* (c)
* Method 1:
reg price c.sqft#c.sqft if traditional==1
predict price_hat_quadratic if traditional==1
twoway (scatter price sqft) (line price_hat_quadratic sqft, sort) if traditional==1
margins, dydx(sqft) at(sqft=2000)
margins, eyex(sqft) at(sqft=2000)
* Method 2:
gen sqft2=sqft^2
reg price sqft2 if traditional==1
predict price_hat_quadratic2 if traditional==1
twoway (scatter price sqft) (line price_hat_quadratic2 sqft, sort) if traditional==1
* Marginal effect = 2*b1*2000
di 2*_b[sqft2]*2000
* Elasticity = (marginal effect)*(sqft/pricehat) = (2*b1*2000)*(2000/(b1+b2*2000^2)
di (2*_b[sqft2]*2000)*2000/(_b[_cons]+_b[sqft2]*2000^2)
* (d)
* Linear:
reg price sqft if traditional==1
predict resid_linear if traditional==1,r
twoway (scatter resid_linear sqft) if traditional==1
* Quadratic:
reg price c.sqft#c.sqft if traditional==1
predict resid_quadratic if traditional==1,r
twoway (scatter resid_quadratic sqft) if traditional==1
* (f)
gen lnprice=ln(price)
reg lnprice sqft if traditional==1
predict lnprice_hat if traditional==1
gen price_hat_log=exp(lnprice_hat)
twoway (scatter price sqft) (line price_hat_log sqft, sort) if traditional==1
* (g)
gen resid=price-price_hat_log
gen residsq=resid^2
egen sse=total(residsq)
list sse
clear

* 2.13
use "star.dta"
* (a)
reg totalscore small if small==1 | regular==1
* (b)
reg readscore small if small==1 | regular==1
reg mathscore small if small==1 | regular==1
* (c)
reg totalscore aide if regular==1 | aide==1
* (d)
reg readscore aide if regular==1 | aide==1
reg mathscore aide if regular==1 | aide==1
clear

* 2.14
use "fair4.dta"
* (a)
twoway (scatter vote growth) if year>=1916 & year<=2008
* (b)
reg vote growth if year>=1916 & year<=2008
predict vote_hat if year>=1916 & year<=2008
twoway (scatter vote growth) (line vote_hat growth, sort) if year>=1916 & year<=2008
* (c)
reg vote growth if year>=1916 & year<=2004
* Growth value for 2008
list growth if year==2008
* Predicted vote share for 2008
di _b[_cons]+_b[growth]*.22
* Actual vote share for 2008
list vote if year==2008
* (d)
twoway (scatter vote inflation) if year>=1916 & year<=2008
reg vote inflation if year>=1916 & year<=2008
predict vote_hat_infl if year>=1916 & year<=2008
twoway (scatter vote inflation) (line vote_hat_infl inflation, sort) if year>=1916 & year<=2008
