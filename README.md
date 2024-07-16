# Codezero - K3D - MetalLB

Setting up a local k3d cluster, adding MetalLB and using Codezero from the host.

## Create K3D Cluster

```
k3d cluster create cz-local --api-port 6550 \
--port 8800:8800@loadbalancer \
--port 8900:8900@loadbalancer \
--k3s-arg "--disable=traefik@server:0" \
--agents 2
```
Note: need to expose the codezero ports, 8800 and 8900, to the host machine.

## Install and Configure MetalLB

```
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.5/config/manifests/metallb-native.yaml
```

Add IP addresses to the loopback device

```
sudo ./ips.sh
```

Add address to metallb

```
kubectl apply -f metallb.yaml
```

## Install codezero

```
hub.codezero.io
```
