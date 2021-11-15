## Application deployment and telemetry data

1. [Prerequisites](#Prerequisites)
    - [Build services](#buildServices)
    - [Publish demo application to DockerHub](#dockerhub)
    - [Deploy applications to k8s](#deploy-k8s)
1. [Canary deployment](#canary)
1. [Developer environment](#dev-env)
1. [Service resiliency](#resiliency)

<a name="Prerequisites"></a>
### Prerequisites
See [hometask 2](../h2/README.md)

<a name="buildServices"></a>
### Build services
`./scripts/build-components.sh`

Please note that we've changed frontend and authors services only.

<a name="dockerhub"></a>
### Publish demo application to DockerHub

`./scripts/publish-components.sh` (make sure to edit script to point it to your personal DockerHub repo)

Please note that authors service is published as v2

<a name="deploy-k8s"></a>
### Deploy applications to k8s
Make sure to edit the following files to point them to your personal DockerHub repo first:
- Author service: `k8s/deployments/author.yml` (also make sure to specify v2)

Then run the deployment script: `./scripts/deploy-components.sh`

<a name="canary"></a>
### Canary deployment

90-10 distribution:
![screenshots/canary-90-10.png](screenshots/canary-90-10.png)
![screenshots/canary-90-10-2.png](screenshots/canary-90-10-2.png)

50-50 distribution:
![screenshots/canary-50-50.png](screenshots/canary-50-50.png)

0-100 distribution:
![screenshots/canary-0-100.png](screenshots/canary-0-100.png)

<a name="dev-env"></a>
### Development environment
Feature flag with "developer: ssamsonov" header.

Sending request without headers (landing on a v1)
![screenshots/dev-env-v1.png](screenshots/dev-env-v1.png)

Sending request with an appropriate header (landing on a v2 now)
![screenshots/dev-env-v2.png](screenshots/dev-env-v2.png)

<a name="resiliency"></a>
### Service resiliency

Destination rule with ROUND ROBIN strategy and circuit breaking:
![screenshots/dest-rule-rr.png](screenshots/dest-rule-rr.png)

Destination rule with RANDOM strategy and circuit breaking:
![screenshots/dest-rule-rand.png](screenshots/dest-rule-rand.png)