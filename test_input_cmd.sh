#!/bin/bash
set -e

input_cmd="$*"
input_cmd=${input_cmd//+/'&&'}
# replace '+' in input_cmd to '&&'

#echo "input_cmd : $input_cmd"
eval "$input_cmd"