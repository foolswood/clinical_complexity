set datafile separator ','

# Jittering:
w = 0.3
j(v) = v + (w * (rand(0) - 0.5))


set terminal postscript eps size 3,3

set output "results/pros.eps"
set xlabel "Observer A (Score)"
set ylabel "Observer B (Score)"
plot "data/involved_professionals.csv" using (j($1)):(j($2)) notitle

set output "results/beds.eps"
set xlabel "Score"
set ylabel "Nights in hospital"
plot "data/usage_data.csv" using (j($3)):(j($4)) notitle

set output "results/outpatient.eps"
set ylabel "Attended outpatient appointments"
plot "data/usage_data.csv" using (j($3)):(j($1)) notitle

set output "results/a_and_e.eps"
set ylabel "Accident and Emergency Attendances"
plot "data/usage_data.csv" using (j($3)):(j($2)) notitle
