#read document as a tables
game=read.table("UWvMSU_1-22-13.txt",stringsAsFactors = F, header = T)
head(game)
#make a new data frame with the cumulative scores 
both_teams_total=data.frame(UW=rep(NA,50), MSU=rep(NA, 50))
totalScoreUW<-0
totalScoreMSU<-0
#Get the cumulative scores for UW and add it to the new dataframe 
for (i in 1:nrow(game)) {
  if (game[i,2] =="UW") {
    totalScoreUW = totalScoreUW + game[i,3]
    both_teams_total[i,1]=totalScoreUW
    both_teams_total[i,2]=totalScoreMSU
#Get the cumulative scores for MSU and add it to the new dataframe 
  }else{
    totalScoreMSU = totalScoreMSU + game[i,3]
    both_teams_total[i,1]=totalScoreUW
    both_teams_total[i,2]=totalScoreMSU
  }
}
#Make a plot of MSU in green and UW in black 
plot(x=game$time, y=both_teams_total$UW, type = "l", xlab = "Time (minutes)", ylab = "Total points", col="black")
lines(game$time, both_teams_total$MSU, type = "l", col="green")


#Question 2 

# generates a random numer from 1 to 100
number_guess <- sample(1:100, 1) 
#prints prompt
print("I'm thinking of a numer 1-100. Input(#) to guess")
#make a function to guess number 
input <- function(input){
  if (input > number_guess){
    print("Lower")
  }else{ 
    if (input < number_guess){
      print("Higher")
    }else{ 
      if (input == number_guess)
        print( "Correct!")
      
    }
  }
}
input(7)
input(81)
