# istio-service-mesh-course

##Hometask 1
1. Setting up local kubernetes cluster using docker desktop is as simple as that:
![local k8s](hr1/local_k8s_docker.png?raw=true "local k8s")
1. Make sure you have kubectl installed (`brew install kubectl`)
1. To install k9s tool run `brew install k9s` (or follow the instructions [here](https://k9scli.io/topics/install/))
1. Install k8s dashboard follow these steps:
    * Deploy the dashbord `kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.3.1/aio/deploy/recommended.yaml`
    * Run `kubectl proxy` to start kube proxy on port 8081
    * This will make you dashboard available [by the link](http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/)
    * You may get a token for authentication running `kubectl -n kube-system describe secret default`
1. Install istio
    * Download pacakge `curl -L https://istio.io/downloadIstio | sh -`
    * Move the package somewhere safe:)
    * Make sure to make binary out of the package visible for your `$PATH` (e.g. navigate to istio folder and `echo 'export PATH="$PWD/bin:$PATH"'`)
    * Install istio `istioctl install --set profile=demo -y`
    * Add a namespace label to instruct Istio to automatically inject Envoy sidecar proxies when you deploy your application later `kubectl label namespace default istio-injection=enabled`
1. To install kiali run `kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.11/samples/addons/kiali.yaml`
    * To verify that the service is running `kubectl -n istio-system get svc kiali`
1. Install Jaeger `istioctl dashboard jaeger`
1. Verify kubernetes dashboard is there [](hr1/kubernetes_dashboard.png?raw=true)
1. Verify istio querying pods [](hr1/istio_pods.png?raw=true)
