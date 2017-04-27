clear
cd C:\Users\sz029836\Downloads
log using question613.log,text replace
use toodyay.dta
describe
summarize

reg y t rg rd rf
scalar sseu = e(rss)
scalar df_unrest = e(df_r)

reg y t
scalar sser = e(rss)
scalar df_rest = e(df_r)
scalar J = df_rest - df_unrest
scalar fstat = ((sser -sseu)/J)/(sseu/(df_unrest))
scalar crit1 = invFtail(J,df_unrest,.05)
scalar pvalue = Ftail(J,df_unrest,fstat)
scalar list sseu sser J df_unrest fstat pvalue crit1

gen r = rg+rd+rf
reg y t r

log close
clear
