# Observer A/B comparison

pdf("output/observers_a_b_scatter.pdf")
a_b_freq = read.csv("intermediate/13_15_freq.csv")
tic_params = c(0, 14, 7)
lim_params = c(-0.5, 14)
circle_scale = 1.0/6
symbols(
    a_b_freq$score_13, a_b_freq$score_15,
    circles=(sqrt(a_b_freq$freq)*circle_scale),
    main="Score Repeatability",
    xlab="Observer A in 2013", ylab="Observer B in 2015",
    inches=F, bg="gray", fg=NULL,
    xlim=lim_params, ylim=lim_params,
    xaxp=tic_params, yaxp=tic_params)
abline(0, 1, col="lightgray", lty=2)

pdf("output/observers_a_b_diff_hist.pdf")
scores_a = read.csv('intermediate/13_a.csv')
scores_b = read.csv("intermediate/15_b.csv")
a_b_scores = merge(scores_a, scores_b)
hist(
    a_b_scores$a_score - a_b_scores$b_score,
    main="Score Difference (Observers A and B)",
    xlab="Score A - Score B",
    breaks=seq(-2.5,5.5), xlim=c(-2,5))

# Observer B/C comparison

pdf("output/observers_b_c_scatter.pdf")
scores_c = read.csv("input/2015_c.csv")
b_c_scores = merge(scores_b, scores_c)
library(graphics)
sunflowerplot(
    b_c_scores$b_score, b_c_scores$c_score,
    main="Observers B and C",
    xlab="Observer B (score)", ylab="Observer C (score)",
    xlim=lim_params, ylim=lim_params,
    xaxp=tic_params, yaxp=tic_params)
abline(0, 1, col="lightgray", lty=2)

pdf("output/observers_b_c_diff_hist.pdf")
hist(
    b_c_scores$b_score - b_c_scores$c_score,
    main="Score Difference (Observers B and C)",
    xlab="Score B - Score C",
    breaks=seq(-2.5,3.5), xlim=c(-2.5,3.5), yaxp=c(0,4,4))

# Service usage

pdf("output/service_usage.pdf")
sud = read.csv("input/service_use_data.csv")
plot(
    sud$score, sud$contacts_q1 + sud$contacts_q2 + sud$contacts_q3,
    main="Service Usage",
    xlab="Score (observer C)", ylab="Contacts",
    pch=17, col=rgb(127,127,127,127,maxColorValue=255))

# Admissions

pdf("output/admissions.pdf")
admissions = read.csv("input/admissions_2015.csv")
admissions = merge(sud, admissions)
sunflowerplot(
    admissions$score, admissions$total,
    main="Hospital Admissions",
    xlab="Score (observer C)", ylab="Admissions")
