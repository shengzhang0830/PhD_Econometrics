clear
cd C:\Users\sz029836\Downloads
log using question618.log,text replace
use stockton4.dta
describe
summarize

generate lnprice = ln(sprice)
reg lnprice livarea c.livarea#c.livarea age c.age#c.age beds c.livarea#c.beds c.livarea#c.livarea#c.beds c.age#c.beds c.age#c.age#c.beds
scalar sseu = e(rss)
scalar df_unrest = e(df_r)

reg lnprice livarea c.livarea#c.livarea age c.age#c.age c.livarea#c.beds
scalar sser = e(rss)
scalar df_rest = e(df_r)
scalar J = df_rest - df_unrest
scalar fstat = ((sser -sseu)/J)/(sseu/(df_unrest))
scalar crit1 = invFtail(J,df_unrest,.05)
scalar pvalue = Ftail(J,df_unrest,fstat)
scalar list sseu sser J df_unrest fstat pvalue crit1

scalar aic1 = ln(sseu/df_unrest)+(20/df_unrest)
scalar aic2 = ln(sser/df_rest)+(12/df_rest)
scalar list aic1 aic2

scalar sc1 = ln(sseu/df_unrest)+(10*ln(df_unrest)/df_unrest)
scalar sc2 = ln(sser/df_rest)+(6*ln(df_rest)/df_rest)
scalar list sc1 sc2
