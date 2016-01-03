b_to_c = read.table("b_to_c")
tic_params = c(0, 14, 7)
lim_params = c(-0.5, 14)
symbols(
    b_to_c$V1, b_to_c$V2, circles=(sqrt(b_to_c$V3)/6),
    main="Score Repeatability", xlab="Observer B in 2015", ylab="Observer C in 2015",
    inches=F, bg="gray", fg=NULL,
    xlim=lim_params, ylim=lim_params, xaxp=tic_params, yaxp=tic_params)
abline(0, 1, col="lightgray", lty=2)
