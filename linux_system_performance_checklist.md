
### Load Averages

Check Load Averages to identify if load is increasing or decreasing (compare 1-, 5-, and 15-minute averages).

```
uptime
```

### Kernel Errors
Kernel errors including OOM events.
```
dmesg -T | tail
```

### System-Wide Statistics
System-wide statistics: run queue length, swapping, overall CPU usage.
```
vmstat -SM 1
```

### Per CPU Statistics.
Per-CPU balance: a single busy CPU can indicate poor thread scaling.
```
mpstat -P ALL 1
```

### Per-Process CPU Statistics
Per-process CPU usage: identity unexpected CPU consumers, and user/system CPU time for each process. 
```
pidstat 1
```

### Disk I/O Statistics
Disk I/O statistics: IOPS and throughput, average wait time, percent busy.
```
iostat -sxz 1
```

### Memory Usage
Memory usage including the file system cache
```
free -m
```

### Network Device I/O
Network device I/O: packets and throughput
```
sar -n DEV 1
```

### TCP Statistics
TCP statistics: connections rates, retransmits.
```
sar -n TCP,ETCP 1
```

### System Overview
```
top
```