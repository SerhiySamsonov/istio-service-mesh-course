## Application deployment and telemetry data

1. [Prerequisites](#Prerequisites)
1. [Fault testing: delay](#delay)
1. [Fault testing: HTTP 500](#http500)

<a name="Prerequisites"></a>
### Prerequisites
See [hometask 3](../h3/README.md)

<a name="delay"></a>
### Fault testing: delay
Delay testing implemented via feature-flag (see [v-service-ff-v2-delay.yaml](k8s/virtual-service/v-service-ff-v2-delay.yaml))

![screenshots/vs-fault-delay-graph.png](screenshots/vs-fault-delay-graph.png)

<a name="http500"></a>
### Fault testing: HTTP 500
Delay testing implemented via feature-flag (see [v-service-ff-v2-500.yaml](k8s/virtual-service/v-service-ff-v2-500.yaml))

![screenshots/vs-fault-500-v1.png](screenshots/vs-fault-500-v1.png)
![screenshots/vs-fault-500-v2.png](screenshots/vs-fault-500-v2.png)