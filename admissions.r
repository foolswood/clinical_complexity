sud = read.csv("service_use_data.csv")
ad = read.csv("admissions_2015.csv")
both = merge(sud, ad)
#library(ggplot2)
#qplot(
library(graphics)
sunflowerplot(
    both$score, both$Total,
    main="Hospital Admissions", xlab="Score (observer C)", ylab="Admissions",
    )
#    geom='bin2d')
#    pch=17, col=rgb(127,127,127,32,maxColorValue=255))
