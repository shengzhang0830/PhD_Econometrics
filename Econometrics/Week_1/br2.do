clear
cd C:\Users\sz029836\Downloads
use br2.dta
describe
summarize
summarize price, detail
summarize sqft, detail
histogram (price)
twoway(scatter price sqft)
reg price sqft
twoway(scatter price sqft) if traditional==1
reg price sqft if traditional==1
twoway(scatter sqft price) if traditional==1
reg sqft price if traditional==1
twoway(scatter sqft price) if traditional==1
twoway(scatter sqft price) (lfit sqft price) if traditional==1
