# docker-self-service-password
Docker image https://ltb-project.org/documentation/self-service-password

## namespace
    kubectl create ns -n ldap

## install openldap
[openldap helm chart](https://github.com/helm/charts/tree/master/stable/openldap)

## ssp config
[config.inc.php](https://github.com/ltb-project/self-service-password/blob/master/conf/config.inc.php)

    kubectl create configmap self-service-password --from-file=config.inc.php -n ldap

## deploy
    kubectl create -f kubernetes/deployment.yaml
    kubectl create -f kubernetes/service.yaml

### enable ingress
edit kubernetes/ingress.yaml, replace the annotations and domain name.

    kubectl create -f kubernetes/ingress.yaml
