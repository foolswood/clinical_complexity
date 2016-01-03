#!/usr/bin/env python2

from collections import namedtuple, Counter

Child = namedtuple('child', ('respiratory', 'feeding', 'seizure', 'motor', 'bulbar', 'balofen', 'vi', 'shunt'))


def score(child):
    return sum(child)


def load_csv(year):
    with open('input/{}.csv'.format(year)) as f:
        lines = [l.strip().split(',') for l in f.readlines()]
    # Drop headings
    return lines[1:]

lines_2013 = load_csv(2013)
lines_2015 = load_csv(2015)


def highest_y(l):
    result = 0
    for i, s in enumerate(l):
        if s.lower().strip() == 'y':
            result = i + 1
    return result


def y_to_1(s):
    if s.lower().strip() == 'y':
        return 1
    else:
        return 0

children_2013 = {}
for child_line in lines_2013:
    assert len(child_line) == 22
    child_id = int(child_line[0].split()[1])
    resps = highest_y(child_line[1:5])
    feeding = highest_y(child_line[5:10])
    feeding = feeding if feeding <= 2 else feeding - 1
    seizure = highest_y(child_line[10:14])
    motor = highest_y(child_line[14:18])
    bulbar = y_to_1(child_line[18])
    baclofen = y_to_1(child_line[19])
    vi = y_to_1(child_line[20])
    shunt = y_to_1(child_line[21])
    assert child_id not in children_2013
    children_2013[child_id] = Child(resps, feeding, seizure, motor, bulbar, baclofen, vi, shunt)


def int_or_empty(s):
    if s:
        return int(s)
    else:
        return 0


def max_point(l):
    return max(map(int_or_empty, l))

children_2015 = {}
for child_line in lines_2015:
    assert len(child_line) == 22
    child_id = int(child_line[0].split()[1])
    resps = max_point(child_line[1:5])
    feeding = max_point(child_line[5:10])
    seizure = max_point(child_line[10:14])
    motor = max_point(child_line[14:18])
    bulbar = int_or_empty(child_line[18])
    baclofen = int_or_empty(child_line[19])
    vi = int_or_empty(child_line[20])
    shunt = int_or_empty(child_line[21])
    assert child_id not in children_2015
    children_2015[child_id] = Child(resps, feeding, seizure, motor, bulbar, baclofen, vi, shunt)

id_mapping_2015_2013 = {
    11: 2,
    14: 3,
    15: 5,
    16: 6,
    18: 13,
    19: 7,
    20: 8,
    21: 9,
    22: 10,
    23: 12,
    25: 16,
    26: 18,
    27: 19,
    28: 11,
    29: 15,
    30: 17,
    31: 20,
    32: 21,
    33: 23,
    34: 22,
    35: 25,
    37: 24,
    38: 29,
    39: 26,
    40: 27,
    41: 30,
    42: 31,
    43: 32,
    44: 33,
    45: 1,
    48: 34,
    49: 35,
    50: 38,
    51: 39,
    52: 40,
    53: 41,
    55: 42,
    57: 37,
    58: 59,
    59: 43,
    60: 44,
    61: 47,
    62: 48,
    63: 49,
    64: 50,
    65: 51,
    66: 52,
    67: 56,
    68: 46,
    69: 53,
    70: 54,
    71: 55,
    72: 57,
    73: 58,
    74: 60
}

correlated_child_data = {}
for child_id_2015, child_id_2013 in id_mapping_2015_2013.items():
    correlated_child_data[child_id_2015] = (children_2013[child_id_2013], children_2015[child_id_2015])

assert len(correlated_child_data) == 55

correlated_child_scores = {k: tuple(map(score, v)) for k, v in correlated_child_data.items()}


score_counts = Counter(correlated_child_scores.values())
with open('intermediate/13_15_freq.csv', 'w') as f:
    f.write('score_13,score_15,freq\n')
    for (score_13, score_15), count in sorted(score_counts.items()):
        f.write('{},{},{}\n'.format(score_13, score_15, count))

with open('intermediate/15_b.csv', 'w') as f:
    f.write('child_id,b_score\n')
    for id_15, (_, score_15) in correlated_child_scores.items():
        f.write('{},{}\n'.format(id_15, score_15))

with open('intermediate/13_a.csv', 'w') as f:
    f.write('child_id,a_score\n')
    for id_15, (score_13, _) in correlated_child_scores.items():
        # Storing with 2015 child_id to align with everything else
        f.write('{},{}\n'.format(id_15, score_13))
