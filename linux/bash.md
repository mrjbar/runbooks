# Bash

## Arguments and Variables

- [ ] \$@ - All command arguments: list of seperate items
- [ ] \$* - All command arguments: a single item
- [ ] \$# - Number of command arguments
- [ ] \$0 - Script name
- [ ] \${nn} - General format for argument nn
- [ ] \$var - value of  varuable var
- [ ] \${var} - general format
- [ ] \${var:p:n} - Substring of n character of var beginning at p 
- [ ] \${var-val2} - Return **val2** if var is undefined
- [ ] \${var+val2} - Return **val2** if var is defined
- [ ] \${var=val2} - Return **val2** if **var** is undefined and set 
- [ ] **var**=**val2** 
- [ ] \${var?errmsg} - Display "var: errmsg" if var is undefined
- [ ] arr( items ) - Dfined arr as an array
- [ ] echo ${arr[0]} - Print first element of the array
- [ ] echo ${#arr[@]}  - Print length of array
## General Contructs
- [ ] \` cmd\` - Substitute output of cmd
- [ ] \$(cmd) - Substitute output of cmd 
- [ ] \$? - Exit status of most recent command 
- [ ] \$! - PID of most recently started background command 
- [ ] eval string - Perform substitution operations on string and then execute.
- [ ] exit n - Exist scrupt with stats n (0 means success)
- [ ] set -- one two three - Sets command line arguments \$1=one, \$2=two \$3=three

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
- [ ] \` cmd\` - Substitute output of cmd
- [ ] \$(cmd) - Substitute output of cmd 
- [ ] \$? - Exit status of most recent command 
- [ ] \$! - PID of most recently started background command 
- [ ] eval string - Perform substitution operations on string and then execute.
- [ ] exit n - Exist scrupt with stats n (0 means success)

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

Create the watch command
```
 watch() { while true; do  eval "$*"; sleep 1; done }
```
