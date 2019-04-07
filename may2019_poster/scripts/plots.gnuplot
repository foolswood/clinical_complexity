set datafile separator ','

set terminal postscript eps size 3,3

set output "results/mean_beds.eps"
set xlabel "Score"
set ylabel "Mean nights in hospital"
set y2label "Frequency of score"
set ytics nomirror
set y2tics
set style fill solid 0.1
set boxwidth 0.6 relative
plot "results/mean_beds.csv" using 1:3 axes x1y2 with boxes title "Frequency", "results/mean_beds.csv" using 1:2 linetype 1 with line title "Mean"
