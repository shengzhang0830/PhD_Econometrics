
log using cellphone

insheet using Cellphone_Panel_homework.csv
describe

// a)
reg deathsperbillionmiles text_ban

// The coefficient of text_ban is about -1.589, indicating that having text message banned while driving is associated with a decrease in death rate by about 1.589 percent.

// The pooled regression may suffer from omitted variable bias. Specifically, unobserved factors that are state specific can influence both death per billion miles and the ban on text messages, causing endogeneity problems. For example, a more culturally conservative state might have text messages while driving banned first and have a lower death rate because people drive more carefully.

// b)
reg deathsperbillionmiles text_ban state_dum*

// The coefficient of text_ban is now about -0.694, indicating that having text message banned while driving is associated with a decrease in death rate by about 0.694 percent. This estimate is lower than the one obtained from part a).

// c)
testparm state_dum*

// The F-test statistics is 19.55 with a p-value smaller than 0.01. This indicates that we should reject the null hypothesis that coefficients for all state fixed effects are zero and conclude that state fixed effects are significant in explaining death rates at 0.01 level.

translate cell_phone.smcl cell_phone.pdf

