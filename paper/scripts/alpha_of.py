from sys import argv
from csv import reader

from krippendorffs_alpha import alpha

with open(argv[1]) as f:
    U = [[int(i) for i in l] for l in reader(f)]

R = frozenset(range(0, 21))

def delta(a, b):
    return (a - b) ** 2

print('Alpha:', alpha(delta, R, U))
