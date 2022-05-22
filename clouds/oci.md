# Oracle Cloud Infrastructure

## Tenancy and Compartments
* * *
### Show Compartments
```
PROFILE=""
REGION=""
COMPARTMENT=""

oci iam compartment list -c $COMPARTMENT --profile $PROFILE --region $REGION  --output table --query 'data[*].{ocid:"compartment-id",name:"name",description:"description"}'
```

## Audit Events
* * *
### Get last the 5 days of events within a tenancy

**Output Field**
- cloud-events-version
- content-type
- data
- event-id
- event-time
- event-type
- event-type-version
- source

```
PROFILE=""
REGION=""
COMPARTMENT=""
START_TIME=$(date -v '-5d' '+%Y-%m-%dT%H:%M:%S%z')
END_TIME=$(date +%Y-%m-%dT%H:%M:%S%z)

# Get a list of events for the last 5 days
oci audit event list --compartment-id $COMPARTMENT --end-time $END_TIME --start-time $START_TIME --profile $PROFILE --region $REGION --output table --query 'data[*].{eventTime:"event-time",eventType:"event-type",source:"source",user:"user"}'
```

## Limits and Quotas
* * *
### List all cloud services
```
PROFILE=""
REGION=""
COMPARTMENT=""
oci --profile $PROFILE --region $REGION limits service list -c $COMPARTMENT
```


### Show all Limits for a list of services

#### Resources
https://jmespath.org/examples.html

#### Field
- availability-domain
- name
- scope-type
- value

```
REGION=""
PROFILE=""
COMPARTMENT=""
SERVICE_NAME="vcn fast-connect load-balancer dns compute block-storage filesystem object-storage"

for s in $SERVICE_NAME; do echo -e "\n$s"; oci limits value list --service-name $s -c $COMPARTMENT --all --profile $PROFILE --region $REGION --output table --query 'data[?value > `0`]'; done
```

### Select a specific service name
```
PROFILE=""
REGION=""
oci limits service list -c $OCID --query 'data[?name == `load-balancer`]'
{
  "description": "LbaaS",
  "name": "load-balancer"
}
```

## Load Balancers
* * *

### Get load balancer Info
```
PROFILE=""
REGION=""
COMPARTMENT=""

oci lb load-balancer list -c $COMPARTMENT --profile $PROFILE --region $REGION --output table --query 'data[*].{ocid:"id",ipAddress:"ip-addresses",name:"display-name"}'
```

### List load balancer shapes
```
PROFILE=""
REGION=""
COMPARTMENT=""
oci --profile $PROFILE --region $REGION lb shape list -c $COMPARTMENT
```

## Compute
* * *
### Show Compute Resources
```
PROFILE=""
REGION=""
COMPARTMENT=""

oci compute instance list -c $COMPARTMENT --profile $PROFILE --region $REGION --output table --query 'data[*].{ocid:"id",name:"display-name",ad:"availability-domain",fd:"fault-domain",shape:"shape",lifecycle:"lifecycle-state"}'
```

## Object Storage
* * *
### Show Buckets
```
PROFILE=""
REGION=""
COMPARTMENT=""
NAMESPACE=""

oci os bucket list -ns $NAMESPACE  -c $COMPARTMENT --profile $PROFILE --region $REGION --output table --query 'data[*].{namespace:"namespace",bucketName:"name",createTime:"time-created"}'
```

