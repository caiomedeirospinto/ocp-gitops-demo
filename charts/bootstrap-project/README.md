# Pipelines: CI/CD

Helm Chart que permite la creación y configuración de proyectos en Openshift.

Permite crear los siguintes componentes:

* [Namespace](https://kubernetes.io/es/docs/concepts/overview/working-with-objects/namespaces/).
* [Role Bindings](https://docs.openshift.com/container-platform/4.7/authentication/using-rbac.html#viewing-local-roles_using-rbac).
* [Service Account](https://docs.openshift.com/container-platform/4.7/authentication/understanding-and-creating-service-accounts.html).
* Secret Notificación: se crea secret con token requerido para notificar la ejecución de pipelines en Slack.

## Valores permitidos

|Llave|Descripción|Valor por defecto|
|-----|-----------|-----------------|
|`namespaces`|Listado de proyectos que se desean crear.|Tipo lista, [Ver definición](#Proyectos)|
|`serviceaccounts`|Listado de cuentas de servicio a crear.|Tipo lista, [Ver definición](#Cuenta-de-servicio)|

Para una mejor referencia ver [archivo de valores por defecto](./values.yaml).

## Proyectos

|Llave|Descripción|Ejemplo de valor|
|-----|-----------|-----------------|
|`name`|Nombre de proyecto, debe seguir el estándar de nombre de K8s que solo permite minúsculas, guiones medio y números.|ejemplo|
|`bindings`|Listado de accesos consedidos sobre este proyecto.|Tipo lista, [Ver definición](#Binding)|
|`labels`|Etiquetas que se le incluirán al proyecto como metadata.|`team: platform-team`|
|`annotations`|Anotaciones que se le incluirán al proyecto como metadata.|`openshift.io/node-selector: env=dev`|

## Cuenta de servicio

|Llave|Descripción|Ejemplo de valor|
|-----|-----------|-----------------|
|`name`|Nombre de cuenta de servicio, debe seguir el estándar de nombre de K8s que solo permite minúsculas, guiones medio y números.|dummy-sa|
|`namespace`|Nombre del proyecto al que pertenece la cuenta de servicio.|ejemplo|

## Binding

|Llave|Descripción|Ejemplo de valor|
|-----|-----------|-----------------|
|`name`|Nombre de cuenta de servicio, usuario o grupo al que se le va a conceder el acceso.|dummy-sa|
|`kind`|Tipo de entidad a quien se le va a conceder el acceso, tipos permitidos: `Group`, `User`, o `ServiceAccount`.|ServiceAccount|
|`namespace`|Obligatorio solo cuando el campo `kind` es igual a **ServiceAccount**, referencia el nombre del proyecto al que pertenece la cuenta de servicio.|ejemplo|
