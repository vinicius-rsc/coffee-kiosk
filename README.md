# Coffee Kiosk — frontend (container)

Frontend estático (dashboard + kiosk) servido por nginx, pra rodar num container gerenciado pelo Komodo.
O backend continua no Google Apps Script — **não** vive aqui.

## Conteúdo
- `Dockerfile`, `compose.yaml`, `nginx.conf`, `.dockerignore` — empacotamento do container
- `site/dashboard.html` — recepção (com trava de PIN)
- `site/index.html` — landing com link pras duas telas
- `site/kiosk.html` — tela do tablet (com prompt de PIN por empresa). Valida o PIN contra o backend no Apps Script.

## ⚠️ Nunca versionar aqui
O backend `coffee-kiosk.gs` (que tem os PINs por empresa) e qualquer `PINS.md`.
O `.gitignore` já bloqueia, mas nem copie pra cá.

## Subir no GitHub + Komodo
Repo: `vinicius-rsc/coffee-kiosk` (mantenha **privado**). Resumo do deploy:
1. GitHub: criar um **Personal Access Token** (Fine-grained, só leitura de conteúdo neste repo).
2. Komodo → Settings → Providers → Git account:
   domain `github.com`, username = seu usuário do GitHub, token = o PAT.
3. Komodo → Stacks → New Stack → Git Repo (`github.com`, `vinicius-rsc/coffee-kiosk`, branch `main`),
   **Run Build = on** (o serviço usa `build:`, então o Komodo precisa rodar `docker compose build` antes do `up`).
4. (Opcional) `KIOSK_PORT` no Environment do Stack se a porta 8080 estiver ocupada.
5. (Opcional) Webhook do GitHub → auto-deploy a cada push.
