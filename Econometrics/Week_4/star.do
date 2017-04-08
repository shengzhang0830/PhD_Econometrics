clear
cd C:\Users\sz029836\Downloads
log using question213.log,text replace
use star.dta
describe
summarize
histogram totalscore if small==1
histogram totalscore if small==0
summarize totalscore if small==1
summarize totalscore if small==0
reg totalscore small
ttest totalscore, by(small)
summarize readscore if small==1
summarize readscore if small==0
reg readscore small
ttest readscore, by(small)
summarize mathscore if small==1
summarize mathscore if small==0
reg mathscore small
ttest mathscore, by(small)
summarize totalscore if aide==1
summarize totalscore if regular==1
reg totalscore aide if small==0
summarize mathscore if aide==1
summarize mathscore if regular==1
reg mathscore aide if small==0
summarize readscore if aide==1
summarize readscore if regular==1
reg readscore aide if small==0
log close
clear
