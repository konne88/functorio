#!/usr/bin/env python3

import json

with open('data-raw-dump.json', 'r') as f:
    data = json.load(f)

print("hi")
print(data.keys())