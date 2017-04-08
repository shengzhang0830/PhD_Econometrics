*Econ 103 HW5
*If you find any mistake, please contact yujingxu@ucla.edu. Thanks!

log using HW4, replace

*6.13
use toodyay, clear
*(a)
reg y t rg rd rf

*(b)(c)
scalar sse_u=e(rss)
scalar df_unrest=e(df_r)

gen rg_rd_rf=rg+rd+rf
reg y t rg_rd_rf
scalar sse_r=e(rss)
scalar df_rest=e(df_r)
scalar j=df_rest-df_unrest

scalar fstat=((sse_r-sse_u)/j)/(sse_u/df_unrest)
scalar crit=invFtail(j,df_unrest,.05)
scalar pvalue=Ftail(j,df_unrest,fstat)

scalar list sse_u sse_r j df_unrest fstat pvalue crit

*6.15
use stockton4, clear
*(a)
reg sprice livarea age beds baths
scalar sse_r=e(rss)
scalar df_rest=e(df_r)

*(b)
lincom -8*age

*(c)
lincom 2*livarea
lincom 2*livarea-20000

*(d)
lincom 2*livarea+beds

*(e)
predict sprice_hat
gen sprice_hat2=sprice_hat^2
gen sprice_hat3=sprice_hat^3
*reset with one term
reg sprice livarea age beds baths sprice_hat2
scalar sse_u1=e(rss)
scalar df_u1=e(df_r)
scalar j1=df_rest-df_u1
scalar fstat1=((sse_r-sse_u1)/j1)/(sse_u1/df_u1)
scalar crit1=invFtail(j1,df_u1,.05)
scalar pvalue1=Ftail(j1,df_u1,fstat1)
scalar list df_u1 fstat1 pvalue1 crit1
*reset with two terms
reg sprice livarea age beds baths sprice_hat2 sprice_hat3
scalar sse_u2=e(rss)
scalar df_u2=e(df_r)
scalar j2=df_rest-df_u2
scalar fstat2=((sse_r-sse_u2)/j2)/(sse_u2/df_u2)
scalar crit2=invFtail(j2,df_u2,.05)
scalar pvalue2=Ftail(j2,df_u2,fstat2)
scalar list df_u2 fstat2 pvalue2 crit2

*6.18
use stockton4, clear

*(a)
gen ln_sprice=log(sprice)
gen livarea2=livarea^2
gen age2=age^2
reg ln_sprice livarea livarea2 age age2 beds c.livarea#c.beds c.livarea2#c.beds c.age#c.beds c.age2#c.beds

*(b)
reg ln_sprice livarea livarea2 age age2 beds c.livarea#c.beds c.livarea2#c.beds c.age#c.beds c.age2#c.beds
scalar sseu=e(rss)
scalar df_unrest=e(df_r)
reg ln_sprice livarea livarea2 age age2 c.livarea#c.beds
scalar sser=e(rss)
scalar df_rest=e(df_r)
scalar J=df_rest-df_unrest
scalar fstat=((sser-sseu)/J)/(sseu/(df_unrest))
scalar crit1=invFtail(J,df_unrest,0.05)
scalar pvalue=Ftail(J,df_unrest,fstat)
scalar list sseu sser J df_unrest df_rest fstat crit1 pvalue

*(c)
reg  ln_sprice livarea livarea2 age age2 c.livarea#c.beds 

log close
