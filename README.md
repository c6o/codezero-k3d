# Codezero - K3D - MetalLB

This is the process for setting up a local k3d cluster, adding MetalLB and using Codezero from the local host.

## Create K3D Cluster

```
k3d cluster create cz-local --api-port 6550 \
--port 8800:8800@loadbalancer \
--port 8900:8900@loadbalancer \
--k3s-arg "--disable=traefik@server:0" \
--agents 2
```
Note: The above command exposes the codezero ports, 8800 and 8900, to the host machine.

## Install and Configure MetalLB

```
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.5/config/manifests/metallb-native.yaml
```

Run "ips.sh" script to add IP addresses (127.10.0.100 through 127.10.0.109) to the loopback device

```
sudo ./ips.sh
```

Run the following to add IP addresses (127.10.0.100 through 127.10.0.109) to metallb

```
kubectl apply -f metallb.yaml
```

## Install Ccodezero

Visit the Codezero HUB and follow the directions on screen.  Detailed instructions are here: https://docs.codezero.io/guides/teamspace-setup. Use the k3d cluster you just created for the install.
```
hub.codezero.io
```
If you have any further questions - please connect via Discord: https://discord.gg/wx3JkVjTPy, or support@codezero.io or your dedicated Slack Connect channel if you're an Enterprise Customer.
