cpd = read.table("cpd")
tic_params = c(0, 14, 7)
lim_params = c(-0.5, 14)
symbols(
    cpd$V1, cpd$V2, circles=(sqrt(cpd$V3)/6),
    main="Score Repeatability", xlab="Observer A in 2013", ylab="Observer B in 2015",
    inches=F, bg="gray", fg=NULL,
    xlim=lim_params, ylim=lim_params, xaxp=tic_params, yaxp=tic_params)
abline(0, 1, col="lightgray", lty=2)
