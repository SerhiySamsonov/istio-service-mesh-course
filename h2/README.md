## Application deployment and telemetry data

1. [Prerequisites](#Prerequisites)
1. [Build services](#buildServices)
1. [Publish demo application to DockerHub](#dockerhub)
1. [Deploy applications to k8s](#deploy-k8s)
1. [Query application](#query)
1. [Kiali](#Kiali)
1. [Jaeger](#Jaeger)
1. [Grafana](#Grafana)

<a name="Prerequisites"></a>
### Prerequisites
Have JDK11 and maven installed.

<a name="buildServices"></a>
### Build services
`./scripts/build-components.sh`

<a name="dockerhub"></a>
### Publish demo application to DockerHub

`./scripts/publish-components.sh` (make sure to edit script to point it to your personal DockerHub repo)

<a name="deploy-k8s"></a>
### Deploy applications to k8s
Make sure to edit the following files to point them to your personal DockerHub repo first:
- Frontend: `k8s/deployments/frontend.yml`
- Book service: `k8s/deployments/book.yml`
- Author service: `k8s/deployments/author.yml`

Then run the deployment script: `./scripts/deploy-components.sh`

And another script to create an ingress controller and gateway: `./scripts/configure-routing.sh`

<a name="query"></a>
### Query application
Query your application, e.g.:
```
export MY_APP_HOST=$(kubectl -n istio-course get ingress -o=jsonpath='{.items[].status.loadBalancer.ingress[].hostname}')
curl $MY_APP_HOST/frontend-catalog/api/v1/dashboard
```
![screenshots/http-response.png](screenshots/http-response.png)

<a name="Kiali"></a>
### Kiali
Check out your Kiali dashboard

`istioctl dashboard kiali`
![screenshots/kiali-applications.png](screenshots/kiali-applications.png)
![screenshots/kiali-applications.png](screenshots/kiali-graph-3h.png)

<a name="Jaeger"></a>
### Jaeger
Check out your Jaeger dashboard

`istioctl dashboard jaeger`
![screenshots/jaeger.png](screenshots/jaeger.png)

<a name="Grafana"></a>
### Grafana
Make sure you've actually installed Grafana dashboard for Istio:

`kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.11/samples/addons/grafana.yaml`

Check out your Grafana dashboard

`istioctl dashboard grafana`
![screenshots/grafana-frontend.png.png](screenshots/grafana-frontend.png)
![screenshots/grafana-books.png.png](screenshots/grafana-books.png)
![screenshots/grafana-authors.png.png](screenshots/grafana-authors.png)