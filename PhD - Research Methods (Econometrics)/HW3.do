
log using HW3

// Assignment #3

use mf2hf_phd2016.dta
describe

// Question 1

// a)
ttest performance, by(treated)
ttest stdv, by(treated)
ttest start_date, by(treated)
ttest log_age, by(treated)
ttest log_aum, by(treated)
ttest missing_aum, by(treated)
ttest year_aum, by(treated)

// b)
twoway (kdensity pscore if treated==1) || (kdensity pscore if treated==0), legend(label(1 treated) label(2 nontreated))


// Question 2

// a)
probit treated performance stdv start_date log_age log_aum missing_aum year_aum
predict prop_score

// b)
margins dydx(*) atmeans


// Question 3

// a)
count

// b)


// Question 4

// a)

// b)

// c)
twoway (kdensity pscore if treated==1) || (kdensity pscore if treated==0), legend(label(1 treated) label(2 nontreated))

// d)
ttest performance by(treated)
ttest stdv by(treated)
ttest start_date by(treated)
ttest log_age by(treated)
ttest log_aum by(treated)
ttest missing_aum by(treated)
ttest year_aum by(treated)


translate HW3.smcl HW3.pdf

