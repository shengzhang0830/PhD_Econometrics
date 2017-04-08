clear
cd C:\Users\sz029836\Downloads
log using question311.log,text replace
use cps4_small.dta
describe
summarize

twoway(scatter wage exper)
reg wage exper
twoway (scatter wage exper) (lfit wage exper)

scalar define t_value = (_b[exper]-0)/_se[exper]
display t_value
display invttail(998,0.05)

twoway(scatter wage exper) if female==1
reg wage exper if female==1
twoway (scatter wage exper) (lfit wage exper) if female==1

twoway(scatter wage exper) if female==0
reg wage exper if female==0
twoway (scatter wage exper) (lfit wage exper) if female==0

twoway(scatter wage exper) if black==1
reg wage exper if black==1
twoway (scatter wage exper) (lfit wage exper) if black==1

twoway(scatter wage exper) if black==0&asian==0&female==0
reg wage exper if black==0&asian==0&female==0
twoway (scatter wage exper) (lfit wage exper) if black==0&asian==0&female==0

generate residual = wage - (18.25768) - 0.0889534*exper
reg residual exper
twoway scatter residual exper

generate residual2 = wage - (17.84125) - 0.0497149*exper if female==1
reg residual2 exper if female==1
twoway scatter residual2 exper if female==1

generate residual3 = wage - (18.45112) - 0.1407156*exper if female==0
reg residual3 exper if female==0
twoway scatter residual3 exper if female==0

generate residual4 = wage - (15.78931) - 0.073835*exper if black==1
reg residual4 exper if black==1
twoway scatter residual4 exper if black==1

generate residual5 = wage - (18.65555) - 0.145527*exper if black==0&asian==0&female==0
reg residual5 exper if black==0&asian==0&female==0
twoway scatter residual5 exper if black==0&asian==0&female==0

log close
clear
