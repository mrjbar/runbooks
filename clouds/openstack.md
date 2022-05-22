# OpenStack

## Create a stack
```
openstack stack create db-stack -t databases.yaml -e env.yaml
```


## List a stack
```
openstack stack list
```


## Delete a stack
```
openstack stack delete db-stack
```


## Update a stack
```
openstack stack update db-stack -t databases.yaml -e env.yaml
```


## Check stack status
```
openstack stack event list db-stack
```


## Show Quota
```
openstack limits show --quote all --absolute
```


## List floating ip
```
openstack floating ip list
```


## Create a floating ip
```
openstack floating ip create integration
```


## Allocate a floating ip
```
openstack floating ip create integration --floating-ip-address x.x.x.x
```


## Set a floating ip to a port
```
openstack floating ip set --port bastion-port x.x.x.x
```


## Create a port
```
openstack port create compute1-port --network network1 --dns-name dns1 --fixed-ip ip-address=x.x.x.x
```


## Watch cloud init
```
ssh compute1
tail -f /var/log/cloud-init-output.log

```


## Create a security group
```
openstack security group create "tls-traffic" --description "Allow incoming https traffic on 443"

```


## Add rule to security group
```
openstack security group rule create --ingress --remote-ip 192.168.1.0/24 --dst-port 443 "tls-traffic"
```


## Add security group to host
```
openstack server add security group compute1 "tls-traffic"
```

## Remove security group
```
openstack server remove security group compute1 tls-traffic
```

## Add multiple rules to a host
```
security_groups=(tls-traffic http-traffic)
for security_group in $security_groups
do 
    openstack server add security group compute1 $security_group
done
```

## Create a router
```
openstack router create primary-router
```


## Attach router to external network
```
openstack router set primary-router --external-gateway public-network
```


## Detach router from external network
```
openstack router unset primary-router --external-gateway
```


## Attach router to internal subnet
```
openstack router add subnet primary-router subnet
```


## Create an instance
```
openstack server create bastion --flavor c2-4-4-80 --image bionic-server-cloudimg-amd64.img --key-name masterkey --file dest-filename=lib/setup.sh --availability-zone zone-b --port bastion-port
```


## Search for heat templates
```
openstack orchestration resource type list --filter name=Avi
```


## Create image from an instance
```
openstack server image create --name compute-image compute1
```
