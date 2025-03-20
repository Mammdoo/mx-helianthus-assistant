## Happy build you home servers
BareMetal provisioning with Ansible

## Component
- RKE2 Kubernetes cluster
- Ceph Storage Cluster

## How to run on my servers
### Prerequisites
- Ubuntu 20.04 LTS or later (maybe older, but not tested)
- Root access to the server(s)
- Ansible installed on your local machine
- SSH keys configured for root user on all servers
- defined your own inventory file

### Tasks
#### Whole
```
ansible-playbook -i inventory/cluster initialize.yaml --tags=initialize
```

#### ceph

#### RKE2
