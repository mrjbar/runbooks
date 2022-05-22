# SSH

### Add default key to ssh agent
```
ssh-add
```

### Turn on ssh agent
```
eval `ssh-agent -s`
```

### List keys in ssh agent
```
ssh-add -l
```

### Update known host file
Removes all keys belonging to the specified hostname (with optional port number) from a known_hosts file.
```
ssh-keygen -R node1
```

### Disable strict host check
```
ssh -oStrictHostKeyChecking=no
```

### Local Port Forwarding
Local port forwarding forwards a port on a local machine(ssh client) through an intermediate host (ssh server / bastion) which is then forwarded to a destination machine that typically resides in a private network.

```
ssh -L [LOCAL_IP:]LOCAL_PORT:DESTINATION:DESTINATION_PORT [USER@]SSH_SERVER
```

**Example**
I want to connect to a mysql server on a private network, but it's accessible through a bastion host(ssh server)

localhost:3336(ssh client) -> bastion-server (ssh server) -> mysql-server:3306(destination host)

```
ssh -L 3336:mysql-server:3306 user@bastion-server
```

or

```
ssh -L 127.0.0.1:3336:mysql-server:3306 user@bastion-server
```

### Local Port Forwarding to Multiple Host
I want to connect to a mysql server and web server through a SSH bastion host.
```
ssh -L 3336:mysql-server:3306 8080:web-server:80 user@bastion-server
```

### Fancy Local Port Forwarding Tunnel
```
ssh -f -N -T -L 8080:destination-server:80 bastion-server
```
- **T** Disable pseudo-terminal allocation
- **f** Requests ssh to go to background just before command execution.  This is useful if ssh is going to ask for passwords or passphrases, but the user wants it in the background.
- **L** Listen on a local port and forward that through the SSH tunnel.
- **N**  Do not execute a remote command.  This is useful for just forwarding ports

