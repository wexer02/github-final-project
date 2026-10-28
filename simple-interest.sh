#!/usr/bin/env bash

# Simple interest calculator. Rate is entered as an annual percentage.
read -r -p "Enter principal amount: " principal
read -r -p "Enter annual rate of interest (%): " rate
read -r -p "Enter time period in years: " time

for value in "$principal" "$rate" "$time"; do
    if [[ ! "$value" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
        echo "Please enter non-negative numbers." >&2
        exit 1
    fi
done

awk -v p="$principal" -v r="$rate" -v t="$time" \
    'BEGIN { printf "Simple interest = %.2f\n", p * r * t / 100 }'
