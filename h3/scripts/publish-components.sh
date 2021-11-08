#!/bin/bash

#docker build -t sserhiys/frontend-service:1.0 ../frontend
#docker push sserhiys/frontend-service:1.0
#
#docker build -t sserhiys/books-service:1.0 ../books
#docker push sserhiys/books-service:1.0

docker build -t sserhiys/authors-service:2.0 ../authors
docker push sserhiys/authors-service:2.0