library(openxlsx)
dat=read.xlsx("mvstats5.xlsx","crotab",rowNames=T)
chisq.test(dat)

#马赛克图
vcd::mosaic(as.matrix(dat),shade = TRUE)
vcd::mosaic(t(as.matrix(dat)),shade = TRUE)

##列联表对应分析
library(ca)
plot(ca(dat))
plot3d.ca(ca(dat))

##多重对应分析
car=read.xlsx("mcorres.xlsx")
mca=mjca(car)
plot(mca)

plot(mca,labels=c(2,0))
text(mca$colpcoord[,1],mca$colpcoord[,2],mca$levelnames,cex=0.75,adj=c(0.5,1))

plot(mca$colpcoord[,1],mca$colpcoord[,2],
     ylab="Dimension 2(14.1%)",xlab="Dimension 1(55.6%)",
     pch=rep(1:7,c(3,3,3,2,2,2,4)),col=rep(1:7,c(3,3,3,2,2,2,4)))
abline(h=0,v=0)
text(mca$colpcoord[,1],mca$colpcoord[,2],mca$levelnames,cex=0.75,adj=c(0.5,1))

