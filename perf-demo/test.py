#!/usr/bin/python

sum = 0
for i in range(10 * 1000 * 1000):
    sum = (sum + i) % 19

print(sum)
