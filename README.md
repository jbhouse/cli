# cli

local docker registry
docker run -d -p 5000:5000 --restart always --name registry registry:2
$ docker tag *serviceName* localhost:5000/*serviceName*
$ docker push localhost:5000/*serviceName*

in values.yaml 

  extraVolumes:
    - type: secret
      name: *serviceName*-config
      mountPath: '/config-volume'

kubernetes commands 

kubectl create secret generic *serviceName*-config --from-file=~/repos/*serviceName*/config-volume/app-config.properties --from-file=~/repos/*serviceName*/config-volume/logback.xml

kubectl get secret *serviceName*-config -o jsonpath='{.data.logback\.xml}' | base64 --decode
kubectl get secret *serviceName*-config -o jsonpath='{.data.app-config\.properties}' | base64 --decode

local helm repo

docker run --rm -it \
  -p 8080:8080 \
  -e DEBUG=1 \
  -e STORAGE=local \
  -e STORAGE_LOCAL_ROOTDIR=/charts \
  -v ~/charts:/charts \
  ghcr.io/helm/chartmuseum:v0.16.2

- pwd = ~/repos/chartmuseum
$ helm package ~/repos/*service*
- Successfully packaged chart and saved it to: ~/repos/chartmuseum/*service*-1.7.1.tgz
- Successfully packaged chart and saved it to: ~/repos/chartmuseum/*service*-1.7.1.tgz
curl --data-binary "@*service*-1.7.1.tgz" http://localhost:8080/api/charts

apiVersion: v2
description: A Helm chart
dependencies:
  - name: *service*
    repository: "http://localhost:8080"
    version: 1.7.1
