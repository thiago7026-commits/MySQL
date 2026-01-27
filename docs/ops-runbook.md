# Ops Runbook — Produção (MySQL + API)

## Backups
- Frequência:
- Retenção:
- Restore testado:

## Monitoramento
- Logs estruturados (request_id)
- Métricas: latência p95, taxa de erro, 5xx
- Alertas: login falhando, DB sem conexão, pico de 403/401

## Rotina de deploy
- migrations antes do deploy da API
- smoke test após deploy
- rollback procedure documentada

## Incidentes
- checklist de coleta: logs, horários, endpoints afetados
- mitigação rápida: rollback
