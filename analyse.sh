#!/bin/bash

mkdir -p intermediate/ output/
python2 process.py
R -f generate_graphs.r
