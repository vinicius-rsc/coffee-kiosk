# Coffee Kiosk — frontend (container)

Frontend estático (dashboard + kiosk) servido por nginx, pra rodar num container gerenciado pelo Komodo.
O backend continua no Google Apps Script — **não** vive aqui.

## Conteúdo
- `Dockerfile`, `compose.yaml`, `nginx.conf`, `.dockerignore` — empacotamento do container
- `site/dashboard.html` — recepção (com trava de PIN)
- `site/index.html` — landing com link pras duas telas
- `site/kiosk.html` — **você adiciona** (o do tablet, com prompt de PIN). Ver `site/LEIA-falta-o-kiosk.txt`.

## ⚠️ Nunca versionar aqui
O backend `coffee-kiosk.gs` (que tem os PINs por empresa) e qualquer `PINS.md`.
O `.gitignore` já bloqueia, mas nem copie pra cá.

## Subir no Bitbucket + Komodo
Passos completos na mensagem do chat. Resumo:
1. Repo **privado** no Bitbucket, push destes arquivos.
2. Bitbucket: criar um **API token** (app passwords estão sendo desativados).
3. Komodo → Settings → Providers → Git account:
   domain `bitbucket.org`, username `x-bitbucket-api-token-auth`, token = o API token.
4. Komodo → Stacks → New Stack → Git Repo (bitbucket.org, este repo, branch `main`), **Run Build = on**, Deploy.
5. (Opcional) Webhook do Bitbucket → auto-deploy a cada push.
