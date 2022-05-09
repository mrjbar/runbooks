# Device
List all open files on device
```
sudo lsof /dev/sda1
```

List processs with open files on mount point
```
sudo lsof -b /nfs/mount/point
```

# Files

### List process that opened a specific file
What files are writting to /var/log/syslog
```
sudo lsof /var/log/syslog
```

# Directory

### List processes that opened files in /var/log
Find what process are writing to certain files in /var/log
```
sudo lsof +d /var/log
```

### Watch a directory for modifications every second
```
sudo lsof +D /var/log -r 1
```

# Processes
### List files opened by process name
List all files opened by firefox
```
sudo lsof -c firefox
```

### List files opened by process id (pid)
List all files opened by firefox
```
sudo lsof -p ####
sudo lsof -p `pidof firefox`
```

### List files opened by a process name with regex
```
sudo lsof -c /^tv/i
```

### Only return the pid of the process that has a specific file open
```
sudo lsof -t /var/log/wifi.log
```

# User
### List files opened by a user
List all files opened by root
```
sudo lsof -u root
```

### List files not opened by a user
List all files not opened by user root
```
sudo lsof -u ^root
```


# Network
### Show all listening ports
```
sudo lsof -iTCP -sTCP:LISTEN
```

### Show all listening ports with port number
```
sudo lsof -iTCP -sTCP:LISTEN -P
```

### List all network connections
```
sudo lsof -i
```

### List network connections used by process id
```
sudo lsof -i -p 
```
 
### List network connections used by procee name
```
sudo lsof -i -c
```

### List processes that are listening on port 22
```
sudo lsof -i:22
```

### List all open IPv4 network files
```
sudo lsof -i 4
```

###  List all open IPv6 network files
```
sudo lsof -i 6
```

### List all files using any protocol on any port connected to a specific domain
```
sudo lsof -i@usscz2-vip-bx-010.aaplimg.com
```

### List all files using any protocal on any port connected to ip address
```
lsof -i@128.210.15.17
```



