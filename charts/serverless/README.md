# Deployment Strategy: Serverless

Desplegar una imagen de contenedor utilizando Knative Services.

Permite crear los siguintes componentes:

* [ImageStreams](https://docs.openshift.com/container-platform/4.7/openshift_images/images-understand.html#images-imagestream-use_images-understand).
* [KnativeServices](https://docs.openshift.com/container-platform/4.7/serverless/knative_serving/serverless-applications.html).
* [Secret](https://docs.openshift.com/container-platform/4.7/nodes/pods/nodes-pods-secrets.html).
* [ConfigMap](https://docs.openshift.com/container-platform/4.7/authentication/configmaps.html).

## Valores permitidos

|Llave|Descripción|Valor por defecto|
|-----|-----------|-----------------|
|`teamName`|Permite agregar en la metadata el nombre del equipo a cargo del despliegue.|product-team|
|`minScale`|Cantidad mínima de replicas para este despliegue|0|
|`exposed`|Define si el despliegue es expuesto hacia fuera del cluster o no|`true`|
|`envs`|Listado de variables de entorno. [Ver la definición](#variables-de-entorno)|[]|
|`runtime.name`|Nombre del runtime utilizado por el software a desplegar.|nodejs|
|`runtime.version`|Versión del runtime utilizado por el software a desplegar.|14-ubi7|
|`repository.url`|URL del repositorio de código fuente a desplegar.|`https://github.com/sbpay/ocp-developer-workflow.git`|
|`nameOverride`|Sobrescribe el nombre por defecto del Chart para nombrar los componentes a desplegar.|serverless|
|`partOf`|Sobrescribe la metadata que agrupa el despliegue.|serverless|
|`servicePort`|Puerto a exponer para consumir el despliegue via red.|8080|
|`readinessProbe`|Configuración de validación de despliegue para cambiar el estado inicial del despliegue y empezar a recibir peticiones. Para saber más ver [documentación oficial](https://docs.openshift.com/container-platform/4.7/applications/application-health.html#application-health-about_application-health).|{}|
|`livenessProbe`|Configuración de validación de despliegue para confirmar que pueda seguir recibiendo peticiones. Para saber más ver [documentación oficial](https://docs.openshift.com/container-platform/4.7/applications/application-health.html#application-health-about_application-health).|{}|
|`resources`|Configuración de recursos mínimos y límites para el despliegue a nivel de CPU y RAM. Para saber más ver [documentación oficial](https://docs.openshift.com/container-platform/4.7/applications/quotas/quotas-setting-per-project.html).|{}|
|`secrets`|Listado de variables secretas necesarias para el componente de software a desplegar. [Ver la definición](#secrets---variables-secretas)|[]|
|`configurationManager`|Listado de variables **no** secretas necesarias para el componente de software a desplegar. [Ver la definición](#Configuration-Manager---variables-no-secretas)|[]|
|`mounts`|Puntos de montaje del despliegue. [Ver la definición](#puntos-de-montaje)|[]|

Para una mejor referencia ver [archivo de valores por defecto](./values.yaml).

### Variables de entorno

|Llave|Descripción|Dato de ejemplo|
|-----|-----------|-----------------|
|`name`|Llave o key de la variable de entorno.|DB_USER|
|`value`|Valor de la variable de entorno. Si el campo `kind` es **configmap** o **secret**, este campo hace referencia al dato del Secret o ConfigMap.|username|
|`kind`|Define si el valor de la variable de entorno proviene de un dato en duro, un secret o un configmap. Valores permitidos: **configmap** o **secret**.|secret|

### Secrets - Variables Secretas

|Llave|Descripción|Dato de ejemplo|
|-----|-----------|-----------------|
|`key`|Llave o key de la variable secreta.|username|
|`value`|Valor de la variable secreta.|test|

### Configuration Manager - Variables **NO** Secretas

|Llave|Descripción|Dato de ejemplo|
|-----|-----------|-----------------|
|`key`|Llave o key de la variable.|application.properties|
|`value`|Valor de la variable.|database.username=${DB_USER}|

### Puntos de Montaje

|Llave|Descripción|Dato de ejemplo|
|-----|-----------|-----------------|
|`name`|Nombre clave del punto de montaje.|application-properties|
|`mountPath`|Punto de montaje en el filesystem.|/config/application-properties|
|`kind`|Origen de los archivos a ubicar en el punto de montaje, valores permitidos: **configmap** o **secret**.|configmap|
