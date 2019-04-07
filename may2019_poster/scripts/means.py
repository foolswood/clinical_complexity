from collections import defaultdict
from csv import DictReader

beds_by_score = defaultdict(list)

with open('../paper/data/usage_data.csv') as f:
    for entry in DictReader(f):
        beds_by_score[int(entry['score'])].append(int(entry['beds']))

def mean(items):
    return sum(items) / len(items)

means = [(score, mean(items), len(items)) for score, items in beds_by_score.items()]
means.sort()

for score, mean_beds, n_entries in means:
    print("{}, {}, {}".format(score, mean_beds, n_entries))
