library(readr)
library(caret)
model_rf <- readRDS("~/Random_Forest.rds")
Filename<-readline("what is the name of test file?")
Test<-read.csv(Filename, row.names=1, header=TRUE)
Prediction_RF<-predict(model_rf,Test)
x_valid<-predict(model_rf,Test,type="prob")
score<-NULL
for (i in 1:length(Prediction_RF))
{
  score[i]<-max(x_valid[i,])
}

cbind(as.character(Prediction_RF), score)->Data
rownames(Data)<-rownames(Test)
colnames(Data)[1]<-"Predicted"
Data<-as.data.frame(Data)
Data$score<-as.numeric(Data$score)
x1<-list()
for( i in 1:nrow(Data))
  {
  if(Data[i,2]>0.4)
  {
    Data[i,1]->x1[[i]]
    } else 
      {
        "Inconclusive" ->x1[[i]]
      }
}
Final<-as.data.frame(do.call(rbind, x1))
rownames(Final)<-rownames(Test)
colnames(Final)[1]<-"Predicted"
write.csv(Final,"Results.csv")
