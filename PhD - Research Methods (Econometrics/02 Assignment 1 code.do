
Assignment #1

Question 2

logit evercmptr logtaxis logtaxisq logdensity south midwest northeast medianinc89 worktransit, robust cluster(fips)
mfx compute

Question 3

a. 
reg downrt evercmptr logtaxis logtaxisq

b. i. 
reg downrt evercmptr logtaxis logtaxisq

b. ii. 
reg downrt evercmptr logtaxis logtaxisq, robust cluster(msa)

b. iii. 
xtreg downrt evercmptr logtaxis logtaxisq, fe i(msa) robust cluster(msa)
xtreg downrt evercmptr logtaxis logtaxisq, fe i(fips) robust cluster(fips)

Question 4 

ivreg2 downrt (evercmptr = south northeast worktransit) logtaxis logtaxisq, robust first


Assignment #2

Question 1

g d_taxis = taxis2 - taxis1
g d_cmptr = evercmptr2 - evercmptr1
g d_down = downrt2 - downrt1

reg d_down d_cmptr d_taxis, cluster(msa)


Question 2

ivreg d_down (d_cmptr = south northeast worktransit) d_taxis, robust first


Question 3

reshape long downrt taxis evercmptr, i(id)

rename _j year_count

g year_dum1 = 0
replace year_dum1=1 if year_count==1
g year2_dum = 0
replace year2_dum=1 if year_count==2

xtreg downrt evercmptr taxis year_dum*, fe i(id) cluster(msa)


