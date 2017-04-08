clear
cd C:\Users\sz029836\Downloads
log using question310.log,text replace
use star.dta
describe
summarize

reg totalscore small if small==1 | regular==1
scalar define t_value = (_b[small]-0)/_se[small]
display t_value
display ttail(3741,t_value)

scalar define tc975 = invttail(3741, 0.025)
di "t-critical value for 97.5 percentile = " tc975
scalar ub2 = _b[small] + tc975*_se[small]
scalar lb2 = _b[small] - tc975*_se[small]
di"The 95% inteval estimate for beta_2 is "lb2 "," ub2

reg readscore small if small==1 | regular==1
scalar define t_value = (_b[small]-0)/_se[small]
display t_value
display ttail(3741,t_value)

reg mathscore small if small==1 | regular==1
scalar define t_value = (_b[small]-0)/_se[small]
display t_value
display ttail(3741,t_value)

reg totalscore aide if regular==1 | aide==1
scalar define t_value = (_b[aide]-0)/_se[aide]
display t_value
display ttail(4046,t_value)

scalar define tc975 = invttail(4046, 0.025)
di "t-critical value for 97.5 percentile = " tc975
scalar ub3 = _b[aide] + tc975*_se[aide]
scalar lb3 = _b[aide] - tc975*_se[aide]
di"The 95% inteval estimate for gamma_2 is "lb3 "," ub3

reg readscore aide if regular==1 | aide==1
scalar define t_value = (_b[aide]-0)/_se[aide]
display t_value
display ttail(4046,t_value)


reg mathscore aide if regular==1 | aide==1
scalar define t_value = (_b[aide]-0)/_se[aide]
display t_value
display ttail(4046,t_value)

log close
clear
