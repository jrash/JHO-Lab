# remove.packages("chemmodlab")
# ##This is the package sent by Jeremy on 2/14/2017 at 12:33pm
# install.packages("C:/Users/hughesol/Documents/RESEARCH/JeremyAsh/ChemModLab/Build2017-02-14/chemmodlab_0.0.0.9001.tar.gz",
#                  repos = NULL, type = "source")
# library(chemmodlab)

# this should generate a page with links to all help pages

help(package = chemmodlab)
vignette("chemmodlab_quickstart")

##from vignette ...
data=read.csv("C:/Users/hughesol/Documents/RESEARCH/JeremyAsh/ChemModLab/Build2017-02-14/AID364data/AID_364_response.csv")
head(data)
desc.lengths <- c()
d <- read.csv("C:/Users/hughesol/Documents/RESEARCH/JeremyAsh/ChemModLab/Build2017-02-14/AID364data/BurdenNumbers.csv")
head(d[, 1:5])
data <- cbind(data, d[-1])
desc.lengths <- c(desc.lengths, ncol(d[-1]))
d <- read.csv("C:/Users/hughesol/Documents/RESEARCH/JeremyAsh/ChemModLab/Build2017-02-14/AID364data/Pharmacophores.csv")
head(d[, 1:6])
data <- cbind(data, d[-1])
desc.lengths <- c(desc.lengths, ncol(d[-1]))
dim(data)
aid364 <- data[1:500,]
library(chemmodlab)
cml <- ModelTrain(aid364, ids = T, xcol.lengths = desc.lengths,
                  des.names = c("BurdenNumbers", "Pharmacophores"))
plot(cml, splits = 1, models = c("NNet", "KNN"))
CombineSplits(cml)
CombineSplits(cml, metric = "error rate")
CombineSplits(cml, metric = "sensitivity")
CombineSplits(cml, metric = "specificity")
CombineSplits(cml, metric = "auc")

##now simulated data ...
simu1 <- read.csv("C:/Users/Vestige/Google Drive/JeremyAsh/Lab_Meetings/2017/2-16/SimulatedData_Study1.csv", header=TRUE)
simu1a <- simu1; simu1a[,2] <- 1*(simu1a[,2] > 0)
head(simu1a[1:6])
cml_jackie <- ModelTrain(simu1a, ids=T, nfolds = 10, nsplits = 3, xcol.lengths=c(250,250) )
cml_jackie$classify
cml_jackie$model.acc
# old.par <- par()
plot(cml_jackie)
CombineSplits(cml_jackie)
CombineSplits(cml_jackie, metric = "error rate")
CombineSplits(cml, metric = "sensitivity")
CombineSplits(cml, metric = "specificity")
CombineSplits(cml, metric = "auc")

