# New argocd/cluster deployment  

- Configure ArgoCD projects/apps in ../argocd-proj-apps to point to k3s-node-21 dir
- Commit changes to master branch
- `kc --kubeconfig ~/kubeconfigs/k3s-m5-01 create ns argocd`
- `kc --kubeconfig ~/kubeconfigs/k3s-m5-01 apply -k ./argocd`
- Port forward to argocd-server, localhost:8080
- Grab `argocd-initial-admin-secret` in the argocd namespace
- Login to argocd ui
- 