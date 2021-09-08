# Openshift GitOps Demo

This repo contains all files needed to execute Caio's GitOps demo over Openshift 4.x.

## Prerequisites

* 1x Openshift Container Platform version 4.7 or later.
* Helm CLI installed in your workstation.
* OC CLI installed in your workstation.

## Step by step

1. Clone this repo:

    ```bash
    git clone https://github.com/caiomedeirospinto/ocp-gitops-demo.git
    ```

2. Login to Openshift with an Cluster admin account.
3. Create projects:

    ```bash
    helm template charts/bootstrap-project/ | oc apply -f -
    ```

4. Install Red Hat Advanced Cluster Management:

    ```bash
    oc apply -f operators/acm/
    ```

5. Wait for ACM to be ready:

    ```bash
    oc get pods -n open-cluster-management
    ```

    <details>
    <summary>Ver output esperado.</summary>
    <p>

    ```bash
    NAME                                                              READY   STATUS    RESTARTS   AGE
    application-chart-faaf7-applicationui-7769599f89-lgckj            1/1     Running   0          13h
    application-chart-faaf7-applicationui-7769599f89-x58p2            1/1     Running   0          13h
    application-chart-faaf7-consoleapi-59c5b6749f-gl9p2               1/1     Running   0          13h
    application-chart-faaf7-consoleapi-59c5b6749f-m6ldl               1/1     Running   0          13h
    cluster-curator-controller-6bfb998d9f-gczfs                       1/1     Running   0          13h
    cluster-curator-controller-6bfb998d9f-hglvv                       1/1     Running   0          13h
    cluster-manager-5d87dc6f88-49fjt                                  1/1     Running   0          13h
    cluster-manager-5d87dc6f88-bt7tj                                  1/1     Running   0          13h
    cluster-manager-5d87dc6f88-fmvnv                                  1/1     Running   0          13h
    clusterlifecycle-state-metrics-v2-579fc6f5-wrrt9                  1/1     Running   0          13h
    console-chart-046f3-console-v2-54f475f59b-882k5                   1/1     Running   0          13h
    console-chart-046f3-console-v2-54f475f59b-xb9dx                   1/1     Running   0          13h
    discovery-operator-5b9f8fbcc5-rhmf4                               1/1     Running   0          13h
    grc-b3ddf-grcui-5f4454c65f-c4bmb                                  1/1     Running   0          13h
    grc-b3ddf-grcui-5f4454c65f-pwzgl                                  1/1     Running   0          13h
    grc-b3ddf-grcuiapi-756c8478d4-rtw5x                               1/1     Running   0          13h
    grc-b3ddf-grcuiapi-756c8478d4-tv82m                               1/1     Running   0          13h
    grc-b3ddf-policy-propagator-66495fb665-rg97z                      1/1     Running   0          13h
    grc-b3ddf-policy-propagator-66495fb665-xlbnj                      1/1     Running   0          13h
    hive-operator-c5d489c66-rwwv4                                     1/1     Running   0          13h
    infrastructure-operator-5c69678d7c-7q98q                          1/1     Running   0          13h
    klusterlet-addon-controller-v2-59bf44b7dd-n844x                   1/1     Running   0          13h
    klusterlet-addon-controller-v2-59bf44b7dd-wn2d2                   1/1     Running   0          13h
    kui-web-terminal-74f79bf74-hq85h                                  1/1     Running   0          13h
    managedcluster-import-controller-v2-5c559b77cb-9jr2v              1/1     Running   0          13h
    managedcluster-import-controller-v2-5c559b77cb-zvxn4              1/1     Running   0          13h
    management-ingress-39764-7d8d4bbf78-k69q8                         2/2     Running   0          13h
    management-ingress-39764-7d8d4bbf78-rh5xv                         2/2     Running   0          13h
    multicluster-observability-operator-9547bbf98-l7v8k               1/1     Running   0          13h
    multicluster-operators-application-5b5488d78d-dzmpf               4/4     Running   0          13h
    multicluster-operators-channel-f67959778-k5qm4                    1/1     Running   0          13h
    multicluster-operators-hub-subscription-6f7b79fcbd-dvnlq          1/1     Running   0          13h
    multicluster-operators-standalone-subscription-675c8dd96c-6jgln   1/1     Running   0          13h
    multiclusterhub-operator-7d7bf465b6-j94jb                         1/1     Running   0          13h
    multiclusterhub-repo-d8bffb758-dfxg7                              1/1     Running   0          13h
    ocm-controller-9d45c7f4-d2l2j                                     1/1     Running   0          13h
    ocm-controller-9d45c7f4-k6kjg                                     1/1     Running   0          13h
    ocm-proxyserver-6b4df9dbf-4cmw4                                   1/1     Running   0          13h
    ocm-proxyserver-6b4df9dbf-bbtzk                                   1/1     Running   0          13h
    ocm-webhook-854df47ff6-bg7gl                                      1/1     Running   0          13h
    ocm-webhook-854df47ff6-mffvc                                      1/1     Running   0          13h
    policyreport-99eb8-insights-client-7fbc4cb9bd-2lzqx               1/1     Running   0          13h
    policyreport-99eb8-metrics-64b89469dc-gdh9x                       1/1     Running   0          13h
    provider-credential-controller-55bb77b6d-rgt77                    2/2     Running   0          13h
    search-operator-58fcfd47c7-mthbc                                  1/1     Running   0          13h
    search-prod-73a25-search-aggregator-5cf8f9c845-297mv              1/1     Running   0          13h
    search-prod-73a25-search-api-5469c5c64d-fjf7z                     1/1     Running   0          13h
    search-prod-73a25-search-api-5469c5c64d-vtpks                     1/1     Running   0          13h
    search-prod-73a25-search-collector-574cdf7d69-v6bb8               1/1     Running   0          13h
    search-redisgraph-0                                               1/1     Running   0          13h
    search-ui-76b68fd6f-jhbc6                                         1/1     Running   0          13h
    search-ui-76b68fd6f-qglsp                                         1/1     Running   0          13h
    submariner-addon-5c9858dd8c-fdf6v                                 1/1     Running   0          13h
    ```

    </p>
    </details>

6. Install Openshift GitOps:

    ```bash
    oc apply -f operators/acm/applications/
    ```

7. Wait for Openshift GitOps to be ready:

    ```bash
    oc get pods -n openshift-gitops
    ```

    <details>
    <summary>Ver output esperado.</summary>
    <p>

    ```bash
    NAME                                                              READY   STATUS    RESTARTS   AGE
    cluster-78779b6d4c-2bk2f                                      1/1     Running   0          3h29m
    kam-6764ccc9c-dpwxg                                           1/1     Running   0          3h29m
    openshift-gitops-application-controller-0                     1/1     Running   0          3h29m
    openshift-gitops-applicationset-controller-5d9f9998f8-kf4k9   1/1     Running   0          3h29m
    openshift-gitops-redis-7867d74fb4-j28gv                       1/1     Running   0          3h29m
    openshift-gitops-repo-server-579776b7d6-vd568                 1/1     Running   0          3h29m
    openshift-gitops-server-84fcb8547c-zbmsm                      1/1     Running   0          3h29m
    ```

    </p>
    </details>

8. Deploy YAML Online product:

    ```bash
    helm template -f charts/ubiquitous-journey/app-of-apps.yaml charts/ubiquitous-journey/ | oc apply -n openshift-gitops -f -
    ```

9. Execute pipeline that deploys charts:

    ```bash
    oc apply -n nexus -f .iac/templates/first-run.yaml
    ```

10. Login to ArgoCD and check if whole infra as code was applied:

    The ArgoCD user `admin` password is:

    ```bash
    oc get secrets openshift-gitops-cluster -n openshift-gitops -o go-template='{{index .data "admin.password"}}' | base64 --decode
    ```

    Go to ArgoCD web app using this url:

    ```bash
    oc get route openshift-gitops-server -n openshift-gitops -o go-template='https://{{ .spec.host }}'
    ```
