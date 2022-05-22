# OCI

## List load balancer shapes
```
➜ oci lb shape list -c $OCID
{
  "data": [
    {
      "name": "100Mbps"
    },
    {
      "name": "10Mbps"
    },
    {
      "name": "10Mbps-Micro"
    },
    {
      "name": "400Mbps"
    },
    {
      "name": "8000Mbps"
    },
    {
      "name": "flexible"
    }
  ]
}
```

## List service name within limits/quota
```
oci limits service list -c $OCID   
{
  "data": [
    {
      "description": "Application Dependency Management",
      "name": "adm"
    },
    {
      "description": "AI Anomaly Detection",
      "name": "ai-anomaly-detection"
    },
    {
      "description": "AI Vision",
      "name": "ai-vision"
    },
    {
      "description": "Analytics",
      "name": "analytics"
    },
    {
      "description": "API Gateway",
      "name": "api-gateway"
    },
    {
      "description": "Application Performance Monitoring",
      "name": "apm"
    },
    {
      "description": "Account Tracking and Automation Tools",
      "name": "atat"
    },
    {
      "description": "Auto Scaling",
      "name": "auto-scaling"
    },
    {
      "description": "Big Data",
      "name": "big-data"
    },
    {
      "description": "Block Volume",
      "name": "block-storage"
    },
    {
      "description": "Blockchain",
      "name": "blockchain"
    },
    {
      "description": "Cloud Shell",
      "name": "cloud-shell"
    },
    {
      "description": "Cloud Guard",
      "name": "cloudguard"
    },
    {
      "description": "Compartments",
      "name": "compartments"
    },
    {
      "description": "Compute",
      "name": "compute"
    },
    {
      "description": "Compute Management",
      "name": "compute-management"
    },
    {
      "description": "Container Engine",
      "name": "container-engine"
    },
    {
      "description": "Cost Management",
      "name": "cost-management"
    },
    {
      "description": "Dashboard",
      "name": "dashboard"
    },
    {
      "description": "Data Catalog",
      "name": "data-catalog"
    },
    {
      "description": "Data Flow",
      "name": "data-flow"
    },
    {
      "description": "Data Integration",
      "name": "data-integration"
    },
    {
      "description": "Data Labeling",
      "name": "data-labeling"
    },
    {
      "description": "Data Science",
      "name": "data-science"
    },
    {
      "description": "Data Transfer",
      "name": "data-transfer"
    },
    {
      "description": "Database",
      "name": "database"
    },
    {
      "description": "Database Migration",
      "name": "database-migration"
    },
    {
      "description": "DevOps",
      "name": "devops"
    },
    {
      "description": "Digital Assistant",
      "name": "digital-assistant"
    },
    {
      "description": "Disaster Recovery Service",
      "name": "disaster-recovery"
    },
    {
      "description": "DNS",
      "name": "dns"
    },
    {
      "description": "Email Delivery",
      "name": "email-delivery"
    },
    {
      "description": "Events",
      "name": "events"
    },
    {
      "description": "Functions",
      "name": "faas"
    },
    {
      "description": "Fast Connect",
      "name": "fast-connect"
    },
    {
      "description": "File Storage",
      "name": "filesystem"
    },
    {
      "description": "GoldenGate",
      "name": "goldengate"
    },
    {
      "description": "Health Check",
      "name": "health-checks"
    },
    {
      "description": "Integration",
      "name": "integration"
    },
    {
      "description": "Java Management",
      "name": "java-management"
    },
    {
      "description": "Key Management",
      "name": "kms"
    },
    {
      "description": "License Manager",
      "name": "licensemanager"
    },
    {
      "description": "LbaaS",
      "name": "load-balancer"
    },
    {
      "description": "Logging",
      "name": "logging"
    },
    {
      "description": "Logging Analytics",
      "name": "logging-analytics"
    },
    {
      "description": "Management Agent",
      "name": "management-agent"
    },
    {
      "description": "Management Dashboard",
      "name": "management-dashboard"
    },
    {
      "description": "MySQL",
      "name": "mysql"
    },
    {
      "description": "MySQL HeatWave on AWS",
      "name": "mysql-heatwave-on-aws"
    },
    {
      "description": "Network Load Balancer",
      "name": "network-load-balancer-api"
    },
    {
      "description": "NoSQL",
      "name": "nosql"
    },
    {
      "description": "Notifications",
      "name": "notifications"
    },
    {
      "description": "Object Storage",
      "name": "object-storage"
    },
    {
      "description": "VMware Solution",
      "name": "ocvp"
    },
    {
      "description": "OpenSearch",
      "name": "open-search"
    },
    {
      "description": "Regions",
      "name": "regions"
    },
    {
      "description": "Resource Manager",
      "name": "resource-manager"
    },
    {
      "description": "Service Connector Hub",
      "name": "service-connector-hub"
    },
    {
      "description": "Service Mesh",
      "name": "service-mesh"
    },
    {
      "description": "Streaming",
      "name": "streaming"
    },
    {
      "description": "Virtual Cloud Network",
      "name": "vcn"
    },
    {
      "description": "IP Management",
      "name": "vcnip"
    },
    {
      "description": "VPN",
      "name": "vpn"
    },
    {
      "description": "Vulnerability Scanning",
      "name": "vulnerability-scanning"
    },
    {
      "description": "WaaS",
      "name": "waas"
    },
    {
      "description": "Web Application Firewall",
      "name": "waf"
    }
  ]
}
```

## List quota/limit for load balancer
```
➜ oci limits value list --service-name load-balancer -c $OCID 
{
  "data": [
    {
      "availability-domain": null,
      "name": "lb-100mbps-count",
      "scope-type": "REGION",
      "value": 0
    },
    {
      "availability-domain": null,
      "name": "lb-10mbps-count",
      "scope-type": "REGION",
      "value": 0
    },
    {
      "availability-domain": null,
      "name": "lb-10mbps-micro-count",
      "scope-type": "REGION",
      "value": 0
    },
    {
      "availability-domain": null,
      "name": "lb-400mbps-count",
      "scope-type": "REGION",
      "value": 0
    },
    {
      "availability-domain": null,
      "name": "lb-8000mbps-count",
      "scope-type": "REGION",
      "value": 0
    },
    {
      "availability-domain": null,
      "name": "lb-flexible-bandwidth-sum",
      "scope-type": "REGION",
      "value": 10
    },
    {
      "availability-domain": null,
      "name": "lb-flexible-count",
      "scope-type": "REGION",
      "value": 1
    }
  ]
}
```

## Use jq to select resources
```
➜ oci limits service list -c $OCID | jq '.data[] | select(.name == "load-balancer")'
{
  "description": "LbaaS",
  "name": "load-balancer"
}
➜  workspace oci limits service list -c $OCID | jq '.data[] | select(.name == "vcn")'          
{
  "description": "Virtual Cloud Network",
  "name": "vcn"
}
➜  workspace oci limits service list -c $OCID | jq '.data[] | select(.name == "object-storage")'
{
  "description": "Object Storage",
  "name": "object-storage"
}  
➜  workspace oci limits service list -c $OCID | jq '.data[] | select(.name == "fast-connect")'
{
  "description": "Fast Connect",
  "name": "fast-connect"
}
➜  workspace oci limits service list -c $OCID | jq '.data[] | select(.name == "compute")'     
{
  "description": "Compute",
  "name": "compute"
}
➜  workspace oci limits service list -c $OCID | jq '.data[] | select(.name == "dns")'    
{
  "description": "DNS",
  "name": "dns"
}
➜  workspace oci limits service list -c $OCID | jq '.data[] | select(.name == "mysql")'
{
  "description": "MySQL",
  "name": "mysql"
}
```

## List Available Compute Limits
```
➜ oci limits value list --service-name compute -c $OCID --all | jq '.data[]|select(.value > 0)'  
{
  "availability-domain": "EBKv:PHX-AD-1",
  "name": "standard-a1-core-count",
  "scope-type": "AD",
  "value": 4
}
{
  "availability-domain": "EBKv:PHX-AD-2",
  "name": "standard-a1-core-count",
  "scope-type": "AD",
  "value": 4
}
{
  "availability-domain": "EBKv:PHX-AD-3",
  "name": "standard-a1-core-count",
  "scope-type": "AD",
  "value": 4
}
{
  "availability-domain": null,
  "name": "standard-a1-core-regional-count",
  "scope-type": "REGION",
  "value": 4
}
{
  "availability-domain": "EBKv:PHX-AD-1",
  "name": "standard-a1-memory-count",
  "scope-type": "AD",
  "value": 24
}
{
  "availability-domain": "EBKv:PHX-AD-2",
  "name": "standard-a1-memory-count",
  "scope-type": "AD",
  "value": 24
}
{
  "availability-domain": "EBKv:PHX-AD-3",
  "name": "standard-a1-memory-count",
  "scope-type": "AD",
  "value": 24
}
{
  "availability-domain": null,
  "name": "standard-a1-memory-regional-count",
  "scope-type": "REGION",
  "value": 24
}
{
  "availability-domain": "EBKv:PHX-AD-1",
  "name": "standard-e2-micro-core-count",
  "scope-type": "AD",
  "value": 2
}
{
  "availability-domain": "EBKv:PHX-AD-1",
  "name": "vm-standard-e2-1-micro-count",
  "scope-type": "AD",
  "value": 2
}
```


## list Available Load Lalancer Limits
```
➜  oci limits value list --service-name load-balancer -c $OCID --all | jq '.data[]|select(.value > 0)' 
{
  "availability-domain": null,
  "name": "lb-flexible-bandwidth-sum",
  "scope-type": "REGION",
  "value": 10
}
{
  "availability-domain": null,
  "name": "lb-flexible-count",
  "scope-type": "REGION",
  "value": 1
}
```
