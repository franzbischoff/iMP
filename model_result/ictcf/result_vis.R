rm(list = ls())
setwd("~/Desktop/projects/iMP/ictcf/model_result")

mp_train<-read.table("mp_DenseNet.txt",sep = ",")
colnames(mp_train)<-c("epoch","recall","precision","F1","accuracy","AUC")
mp_train$epoch<-unlist(strsplit(as.character(mp_train$epoch), " ", fixed = FALSE))[seq(5,50,5)]
mp_train$recall<-unlist(strsplit(as.character(mp_train$recall), " ", fixed = FALSE))[seq(4,40,4)]
mp_train$precision<-unlist(strsplit(as.character(mp_train$precision), " ", fixed = FALSE))[seq(4,40,4)]
mp_train$F1<-unlist(strsplit(as.character(mp_train$F1), " ", fixed = FALSE))[seq(3,30,3)]
mp_train$accuracy<-unlist(strsplit(as.character(mp_train$accuracy), " ", fixed = FALSE))[seq(4,40,4)]
mp_train$AUC<-unlist(strsplit(as.character(mp_train$AUC), " ", fixed = FALSE))[seq(4,40,4)]

train<-read.table("DenseNet.txt",sep = ",")
colnames(train)<-c("epoch","recall","precision","F1","accuracy","AUC")
train$epoch<-unlist(strsplit(as.character(train$epoch), " ", fixed = FALSE))[seq(5,50,5)]
train$recall<-unlist(strsplit(as.character(train$recall), " ", fixed = FALSE))[seq(4,40,4)]
train$precision<-unlist(strsplit(as.character(train$precision), " ", fixed = FALSE))[seq(4,40,4)]
train$F1<-unlist(strsplit(as.character(train$F1), " ", fixed = FALSE))[seq(3,30,3)]
train$accuracy<-unlist(strsplit(as.character(train$accuracy), " ", fixed = FALSE))[seq(4,40,4)]
train$AUC<-unlist(strsplit(as.character(train$AUC), " ", fixed = FALSE))[seq(4,40,4)]


plot(mp_train$epoch,mp_train$recall,type="l",col = "dark red",ylim = c(0.7,1),
     ylab = "Value", xlab = "Epoch", main = "Classification performance on validation dataset")
lines(mp_train$epoch,mp_train$precision,col = "dark blue")
lines(mp_train$epoch,mp_train$F1,col = "dark green")
lines(mp_train$epoch,mp_train$accuracy,col = "yellow")
lines(mp_train$epoch,mp_train$AUC,col = "dark orange")
legend("bottomright", c("recall","precision","F1","accuracy","AUC"),
       fill = c("dark red","dark blue","dark green","yellow","dark orange"),cex = 0.6)


lines(train$epoch,train$recall,type="l",col = "dark red",lty = 2)
lines(train$epoch,train$precision,col = "dark blue",lty = 2)
lines(train$epoch,train$F1,col = "dark green",lty = 2)
lines(train$epoch,train$accuracy,col = "yellow",lty = 2)
lines(train$epoch,train$AUC,col = "dark orange",lty = 2)
legend("bottomleft", c("With anomaly detection","Without anomaly detection"),cex = 0.65,lty = 1:2)

