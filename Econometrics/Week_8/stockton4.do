clear
cd C:\Users\sz029836\Downloads
log using question716.log,text replace
use stockton4.dta
describe
summarize

histogram sprice
gen lnprice = ln(sprice)
histogram lnprice

gen lnprice1000 = ln(sprice/1000)
reg lnprice1000 livarea beds baths lgelot age pool
reg lnprice1000 beds baths age pool c.livarea##i.lgelot

reg lnprice i.lgelot##(c.beds c.baths c.age i.pool c.livarea)
test 1.lgelot 1.lgelot#c.beds 1.lgelot#c.baths 1.lgelot#c.age 1.lgelot#1.pool 1.lgelot#c.livarea

log close
clear
