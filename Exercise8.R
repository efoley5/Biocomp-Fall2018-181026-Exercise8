#read document as a tables
game=read.table("UWvMSU_1-22-13.txt",stringsAsFactors = F, header = T)
head(game)
both_teams_total=data.frame(UW=rep(NA,50), MSU=rep(NA, 50))
totalScoreUW<-0
totalScoreMSU<-0
for (i in 1:nrow(game)) {
  if (game[i,2] =="UW") {
    totalScoreUW = totalScoreUW + game[i,3]
    both_teams_total[i,1]=totalScoreUW
    both_teams_total[i,2]=totalScoreMSU
  }else{
    totalScoreMSU = totalScoreMSU + game[i,3]
    both_teams_total[i,1]=totalScoreUW
    both_teams_total[i,2]=totalScoreMSU
  }
}
plot(x=game$time, y=both_teams_total$UW, type = "l", xlab = "Time (minutes)", ylab = "Total points", col="black")
lines(game$time, both_teams_total$MSU, type = "l", col="green")
