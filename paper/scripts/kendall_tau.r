f = read.csv('data/usage_data.csv')
cor.test(f$score, f$outpatient, method='kendall')
cor.test(f$score, f$a_and_e, method='kendall')
cor.test(f$score, f$beds, method='kendall')
