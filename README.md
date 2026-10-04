# homelab

## Comparing an app with the cluster

To preview differences between an app's configuration in `k8s/services` and the resources currently running in the active Kubernetes context, run:

```sh
task kube:diff-app APP=apps/trek
```

`APP` is the app's path relative to `k8s/services`. For example, use `observability/grafana` for `k8s/services/observability/grafana`.

The task builds the manifests with Kustomize and Helm enabled, then runs `kubectl diff`. It reads the namespace from the app's `kustomization.yaml`. It requires `kustomize` and `yq` to be installed. This is a read-only preview and does not apply changes.

## 🤝 Thanks

I’ve picked up tons of ideas and inspiration from the K8s@Home and home-ops crowd along the way. 
    [MacroPower](https://github.com/MacroPower/homelab/), 
    [RazeLighter777](https://github.com/RazeLighter777/iaas), 
    [ahinko](https://github.com/ahinko/home-ops/), 
    [bjw-s](https://github.com/bjw-s-labs/home-ops), 
    [gruberdev](https://github.com/gruberdev/homelab/),
    [sromerotech](https://github.com/sromerotech/homelab),
    [Skaronator](https://github.com/Skaronator/homelab/),
    [khuedoan](https://github.com/khuedoan/homelab),
     and many others.
 
<!--
# [szinn](https://github.com/szinn/k8s-homelab), 
# [budimanjojo](https://github.com/budimanjojo/home-cluster), 
# [buroa](https://github.com/buroa/k8s-gitops), 
# [coolguy1771](https://github.com/coolguy1771/home-ops) -->
