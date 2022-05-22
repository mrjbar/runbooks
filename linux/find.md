# Find the Java Trust Store
```
sudo find /opt/ -type f -name '*.properties' -exec grep -i “trust"  {} \;
```

# Find files owned by a user
```
find . -user username
```

# Find files owned by a certain group
```
find . -group groupname
```

# Find files larger than 100MB
```
find . -size +100M
```

# Find files modified in the last 5 minutes
```
find . -mmin -5
```

# Find files that were modified exactly 4 days ago
```
find . -mtime 4 -name “*log”
```

# Find errors in logs
```
find /var/logs -mtime -1 -and ! -name '*gz' -exec grep 'java.net.SocketTimeoutException: Read timed out' {} \;
```

# Delete Files Between a Specific Date
```
find . -type f -newermt 2010-10-07 ! -newermt 2017-01-01 -delete
```

# Find large afters before a certain date and sort
```
sudo find /var/log/mysql ! -newermt 2017-12-01 -size +100M -exec ls -lh {} \; | sort
```

# Find URL endpoint in java properties files
```
find /opt -name '*.properties' -exec grep -Eo '(http|https)://[^/"]+' {} \; | sort -u
```

# Find specific endpoint in java properties files
```
find /opt -name '*.properties' -exec egrep -o "endpoint.example.com" {} \; | sort -u
```

# Find, Compress and Delete old files: 
```
for i in $(sudo find . -name '[logname1|lognam2]*' -type d -newermt 2018-01-01 ! -newermt 2018-10-01); do dirname=$(basename $i); echo $dirname; tar -zcvf "${dirname}.tar.gz" $i && sudo rm -r $i; done
```
