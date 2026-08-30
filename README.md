# voting-app-gitops

GitOps repository for the Voting App — ArgoCD App-of-Apps configuration.

## Structure

```
apps/           # ArgoCD Application definitions (production/EKS)
apps-local/     # ArgoCD Application definitions (local development)
helm-charts/    # Helm charts (own + wrappers for public charts)
```

## Usage

ArgoCD is configured to sync from `apps/` directory via the root-app pattern.
All infrastructure is managed declaratively through Git — **no manual `kubectl` or `helm` commands needed**.

### Sync Order (sync-wave)

| Wave | Components |
|------|-----------|
| -1 | cert-manager, external-dns, external-secrets-operator |
| 0 | cluster-issuer, gateway, monitoring, postgres, redis, tls-certificate |
| 1 | eso-cluster-secret-store, eso-external-secrets, keycloak, result, vote |
| 2 | grafana-route, keycloak-route, worker |

## Secrets

No secrets are stored in this repository. All credentials are managed via:
- **External Secrets Operator (ESO)** — synced from AWS Secrets Manager via IRSA
- **cert-manager** — TLS certificates via Let's Encrypt DNS-01 challenge

## Related Repositories

- [voting-app-infra](https://github.com/ybojko/voting-app-infra) — Terraform (VPC, EKS, IAM)
- [voting-app-ci](https://github.com/ybojko/voting-app-ci) — Reusable CI workflows
- [voting-app-vote](https://github.com/ybojko/voting-app-vote) — Vote frontend (Python)
- [voting-app-result](https://github.com/ybojko/voting-app-result) — Result frontend (Node.js)
- [voting-app-worker](https://github.com/ybojko/voting-app-worker) — Worker (C#/.NET)
