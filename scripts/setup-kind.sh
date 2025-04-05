#!/bin/bash
set -e

CLUSTER_NAME="k8s-lab"

kind create cluster --name $CLUSTER_NAME --config <<EOF
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
  - role: control-plane
EOF

kubectl cluster-info --context kind-${CLUSTER_NAME}
