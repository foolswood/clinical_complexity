#!/bin/sh
python3 scripts/alpha_of.py data/involved_professionals.csv > results/involved_alpha
Rscript scripts/kendall_tau.r > results/kendall_tau
gnuplot scripts/plots.gnuplot
