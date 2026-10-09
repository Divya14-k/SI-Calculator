#!/usr/bin/env bash
# Calculate simple interest from principal, annual percentage rate, and years.

set -euo pipefail

read -r -p "Enter the principal amount: " principal
read -r -p "Enter the annual rate of interest (%): " rate
read -r -p "Enter the time period in years: " years

for value in "$principal" "$rate" "$years"; do
    if [[ ! "$value" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
        printf 'Error: enter non-negative numbers for principal, rate, and time.\n' >&2
        exit 1
    fi
done

interest=$(awk -v p="$principal" -v r="$rate" -v t="$years" \
    'BEGIN { printf "%.2f", (p * r * t) / 100 }')

printf 'The simple interest is: %s\n' "$interest"
