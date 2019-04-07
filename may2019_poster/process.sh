#!/bin/bash

python3 scripts/means.py > results/mean_beds.csv
gnuplot scripts/plots.gnuplot
