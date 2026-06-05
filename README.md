# voting-app-gitops

GitOps-репозиторій для ArgoCD. Містить Application-манифести та Helm values для всіх сервісів.

## Структура

```
├── app-of-apps.yaml      # Root Application (App-of-Apps патерн)
└── apps/
    ├── vote/
    │   ├── application.yaml
    │   └── values.yaml
    ├── result/
    │   ├── application.yaml
    │   └── values.yaml
    ├── worker/
    │   ├── application.yaml
    │   └── values.yaml
    ├── postgres/
    │   ├── application.yaml
    │   └── values.yaml
    └── monitoring/
        ├── application.yaml
        └── values.yaml
```

## Як це працює

1. Root Application (app-of-apps) дивиться на `apps/` теку
2. Кожна дочірня Application вказує на свій Helm-чарт + values
3. Зміна `image.tag` у Git → ArgoCD автоматично синкає
4. Rollback через `git revert`
