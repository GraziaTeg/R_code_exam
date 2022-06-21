########################
#PROGETTO
#3, 2, 1, CASA
################
?install.packages()
install.packages("raster")
install.packages("RStoolbox")
library(raster) 
library(RStoolbox)
?setwd
setwd("C:/Users/grazi/Desktop/progetto/lab")
??brick 
brick("casa_2011.jpg")
c2011 <- brick("casa_2011.jpg")
c2011
plot(c2011)
brick("casa_2021.jpg")
c2021 <- brick("casa_2021.jpg")
c2021
plot(c2021)
?colorRampPalette
colorRampPalette(c("black", "grey", "light grey")) (100)
cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
plot(c2011, col = cl)
plot(c2021, col = cl)
plot(c2011$casa_2011.1, col = cl)
plot(c2021[[1]], col = cl)
plot(c2021$casa_2021.1, col = cl)
par(mfrow = c (1, 2))
plot(c2011$casa_2011.1, col = cl)
plot(c2021$casa_2021.1, col = cl)
par(mfrow = c (2, 1))
plot(c2011$casa_2011.1, col = cl)
plot(c2021$casa_2021.1, col = cl)
pdf("multiframe.pdf")
par(mfrow = c (2, 1))
plot(c2011$casa_2011.1, col = cl)
plot(c2021$casa_2021.1, col = cl)
pdf("multiframe.png")
par(mfrow = c (2, 1))
plot(c2011$casa_2011.1, col = cl)
plot(c2021$casa_2021.1, col = cl)
dev.off()
??plotRGB
plotRGB(c2011, r = 1, g = 2, b = 3, stretch = "lin")
plotRGB(c2021, r = 1, g = 2, b = 3, stretch = "lin")
par(mfrow = c(2, 1))
plotRGB(c2011, r = 1, g = 2, b = 3, stretch = "lin")
plotRGB(c2021, r = 1, g = 2, b = 3, stretch = "lin")

################################
dvi2011 = c2011[[1]] - c2011[[2]]
dvi2011
cldvi <- colorRampPalette(c("dark blue", "yellow", "red", "black")) (100)
plot(dvi2011, col = cldvi)
dvi2021 = c2021[[1]] - c2021[[2]]
dvi2021
cldvi <- colorRampPalette(c("dark blue", "yellow", "red", "black")) (100)
plot(dvi2021, col = cldvi)
par(mfrow = c(2, 1))
plot(dvi2011, col = cldvi)
plot(dvi2021, col = cldvi)
dvi_dif <- dvi2011 - dvi2021
dvi_dif
cldif <- colorRampPalette(c(" blue", "white", "red")) (100)
plot(dvi_dif, col = cldif)
c2011
c2021
ndvi2011 = (c2011[[1]] - c2011[[2]]) / (c2011[[1]] + c2011[[2]])
ndvi2011
clndvi <- colorRampPalette(c("dark blue", "yellow", "red", "black")) (100)
plot(ndvi2011, col = clndvi)
ndvi2021 = (c2021[[1]] - c2021[[2]]) / (c2021[[1]] + c2021[[2]])
ndvi2021
clndvi <- colorRampPalette(c("dark blue", "yellow", "red", "black")) (100)
plot(ndvi2021, col = clndvi)
par(mfrow = c(2, 1))
plot(ndvi2011, col = clndvi)
plot(ndvi2021, col = clndvi)


