
### kubernetes hello world

```
// run a deployment
kubectl run kubernetes-bootcamp --image=jocatalin/kubernetes-bootcamp:v1 --port=8080
// or kubectl run kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1 --port=8080

// 在一个新的 terminal 中输入
kubectl proxy

// 
curl http://localhost:8001/version

kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}'

curl http://localhost:8001/api/v1/namespaces/default/pods/kubernetes-bootcamp-76fcb8587-dt49f/proxy/
```
