### Helper

0. Create a namespace: kubectl apply -f k8s/namespace.yaml
1. Enable sidecar for the istio-course namespace: kubectl label namespace istio-course istio-injection=enabled
2. Build java services: ./scripts/build-components.sh
3. Build docker images and push them: ./scripts/publish-components.sh
4. Apply services into k8s: ./scripts/deploy-components.sh
5. Delete all istio-course resources from k8s: ./scripts/delete-all.sh