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

kubectl create secret generic *serviceName*-config --from-file=/Users/P3193379/repos/*serviceName*/config-volume/app-config.properties --from-file=/Users/P3193379/repos/*serviceName*/config-volume/logback.xml

kubectl get secret *serviceName*-config -o jsonpath='{.data.logback\.xml}' | base64 --decode
kubectl get secret *serviceName*-config -o jsonpath='{.data.app-config\.properties}' | base64 --decode
