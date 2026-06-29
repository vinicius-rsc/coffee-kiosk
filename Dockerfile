# ─────────────────────────────────────────────────────────────
# Coffee Kiosk — frontend estático servido por nginx
#
# IMPORTANTE: o backend (coffee-kiosk.gs) NÃO está aqui.
# Ele roda no Google Apps Script e continua lá. Este container
# serve apenas as páginas HTML (kiosk + dashboard), que falam
# com o Apps Script por fetch.
# ─────────────────────────────────────────────────────────────
FROM nginx:1.27-alpine

# Nossa config de site no lugar da default
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Os arquivos estáticos (kiosk.html, dashboard.html, index.html)
COPY site/ /usr/share/nginx/html/

EXPOSE 80

# Healthcheck que o Komodo usa pra mostrar o status do container
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -q -O /dev/null http://localhost/healthz || exit 1
