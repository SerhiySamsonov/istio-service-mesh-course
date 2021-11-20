#!/bin/bash

docker build -t sserhiys/frontend-service:2.0 ../frontend
docker push sserhiys/frontend-service:2.0

docker build -t sserhiys/authors-service:2.0 ../authors
docker push sserhiys/authors-service:2.0
