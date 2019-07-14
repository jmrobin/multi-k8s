docker build -t jmrhub/multi-client:latest -f ./client/Dockerfile ./client
docker build -t jmrhub/multi-server:latest -f ./server/Dockerfile ./server
docker build -t jmrhub/multi-worker:latest -f ./worker/Dockerfile ./worker

docker build -t jmrhub/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t jmrhub/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t jmrhub/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker image push jmrhub/multi-client:latest
docker image push jmrhub/multi-server:latest
docker image push jmrhub/multi-worker:latest

docker image push jmrhub/multi-client:$SHA
docker image push jmrhub/multi-server:$SHA
docker image push jmrhub/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=jmrhub/multi-server:$SHA
kubectl set image deployments/client-deployment client=jmrhub/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=jmrhub/multi-worker:$SHA