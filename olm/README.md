## Steps to install OpenEBS Operator From OperatorHub

### Pre-Requisites: 

- Steps are valid for OpenShift versions >= 4.0

- Create an namespace (project) into which the OpenEBS control plane has to be deployed 
  
  Ex: `oc create namespace openebs`

- Ensure that the serviceaccount used for the OpenEBS control plane deployments, i.e.,
  the serviceaccount created by the helm operator is added into the privileged SCC:

  Ex: `oc adm policy add-scc-to-user privileged system:serviceaccount:openebs:openebs-maya-operator`  

- (Can be a post-install step as well) In cases where the `Jiva` storage engine is used, 
  ensure that the `default` serviceaccount in the namespace/project where the OpenEBS 
  persistent volume is created (either `openebs` or application ns`) is also added to the 
  privileged SCC. 

  Ex: `oc adm policy add-scc-to-user privileged system:serviceaccount:openebs:default` 

### Install Steps from Embedded OperatorHub in OpenShift Console 
  
![screen1](/olm/images/operatorhub-screen-1.jpg)
![screen2](/olm/images/operatorhub-screen-2.jpg)
![screen3](/olm/images/operatorhub-screen-3.jpg)
![screen4](/olm/images/operatorhub-screen-4.jpg)
![screen5](/olm/images/operatorhub-screen-5.jpg)
![screen6](/olm/images/operatorhub-screen-6.jpg)
![screen7](/olm/images/operatorhub-screen-7.jpg)



