# Rollback Plan — Volta para Supabase

## Quando acionar rollback
- falha de login generalizada
- falhas 5xx persistentes
- divergência de dados crítica
- degradação severa de performance

## Passos de rollback
1) Reverter env vars do front para Supabase
2) Reverter DNS/endpoint (se aplicável)
3) Confirmar login e fluxos essenciais no Supabase
4) Congelar alterações no MySQL para análise
5) Abrir incident report (post-mortem)

## Após rollback
- coletar logs
- corrigir causa raiz
- preparar novo cutover
