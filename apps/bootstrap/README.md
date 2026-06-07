Using Proxmox CSI plugin




kubectl label nodes ksrv-prod-1 topology.kubernetes.io/region=cluster-home
kubectl label nodes ksrv-prod-1 topology.kubernetes.io/zone=pve01
kubectl label nodes kserv-node-1 topology.kubernetes.io/region=cluster-home
kubectl label nodes kserv-node-1 topology.kubernetes.io/zone=pve01

kubectl label nodes ksrv-prod-2 topology.kubernetes.io/region=cluster-home
kubectl label nodes ksrv-prod-2 topology.kubernetes.io/zone=pve02
kubectl label nodes kserv-node-2 topology.kubernetes.io/region=cluster-home
kubectl label nodes kserv-node-2 topology.kubernetes.io/zone=pve02


*Done*
kubectl label nodes ksrv-prod-3 topology.kubernetes.io/region=cluster-home
kubectl label nodes ksrv-prod-3 topology.kubernetes.io/zone=pve03
kubectl label nodes kserv-node-3 topology.kubernetes.io/region=cluster-home
kubectl label nodes kserv-node-3 topology.kubernetes.io/zone=pve03
