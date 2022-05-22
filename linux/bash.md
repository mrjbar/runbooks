# Bash

## Arguments and Variables

### Get length of a space deliminated string
```
length = echo $var | wc -w
```

#https://stackoverflow.com/questions/638802/number-of-tokens-in-bash-variable
Get length of all characters in a variable
```
echo 
```

### Trim whitespaces
# https://stackoverflow.com/questions/369758/how-to-trim-whitespace-from-a-bash-variable

## General Contructs

## Arithmetic

### Increment a variable
```
counter=0
((counter++))
echo $counter
```

## Condtional Contructs

## Input and Output

### Change Output Color
```
Black        0;30     Dark Gray     1;30
Red          0;31     Light Red     1;31
Green        0;32     Light Green   1;32
Brown/Orange 0;33     Yellow        1;33
Blue         0;34     Light Blue    1;34
Purple       0;35     Light Purple  1;35
Cyan         0;36     Light Cyan    1;36
Light Gray   0;37     White         1;37

RED='\033[0;31m'
NC='\033[0m' # No Color
printf "I ${RED}love${NC}\n"
```
### echo
```

```

### printf
- %s - string
- %d - numbers
```
printf "%s %d" $string $integer
```

## Functions

