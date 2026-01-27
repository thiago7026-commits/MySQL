# Cutover Plan — Virada para MySQL

## Pré-requisitos
- Schema MySQL aplicado via migrations
- Import inicial completo e validado
- API em produção (staging validado)
- Monitoramento/logs habilitados
- Backup do MySQL feito e testado restore

## Janela de cutover
- Duração alvo: curta
- Estratégia: freeze de escrita + último sync + troca de apontamento

## Passos (ordem)
1) Anunciar freeze de escrita
2) Rodar export incremental final (Supabase → exports)
3) Import incremental final (exports → MySQL)
4) Rodar validações (contagem + amostras + FKs)
5) Trocar variáveis do front para apontar API nova
6) Smoke tests:
   - login
   - leitura pública
   - CRUD admin (criar/editar/publicar)
7) Liberar tráfego
8) Monitorar erros/latência por 60–120min

## Critérios de aceite
- 0 erros críticos em login/CRUD
- sem divergência de dados no relatório
- sem endpoints 5xx recorrentes
