# install.packages("pROC")
install.packages("C:/Users/jrash/Downloads/chemmodlab_0.0.0.9000.tar.gz", repos = NULL, type = "source")

library(chemmodlab)
?ModelTrain
?plot.chemmodlab
?chemmodlab
?CombineSplits

bin <- rbinom(50, 1, .1)
cml <- ModelTrain(cbind(bin, USArrests), nsplits = 3)
cml
plot(cml)
CombineSplits(cml)

cml <- ModelTrain(USArrests, nsplits = 3)
cml
plot(cml)
CombineSplits(cml)
