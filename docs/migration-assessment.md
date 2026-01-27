# Migration Assessment — Supabase (Postgres) → MySQL

## Objetivo
Migrar dados e regras do Supabase para MySQL com backend próprio, mantendo segurança (RBAC) e previsibilidade de deploy (cutover + rollback).

## Escopo
### Dentro do escopo
- Schema MySQL (tabelas, FKs, índices, constraints)
- Migração de dados (export/import) com validação
- Backend API (auth + RBAC + CRUD) como substituto de RPC/RLS
- Plano de cutover e rollback
- Testes (integração + E2E mínimos)
- Observabilidade básica (logs + auditoria)

### Fora do escopo (se aplicável)
- Migração de storage (imagens/arquivos) do Supabase Storage
- Refatoração visual do front (apenas ajustes de integração)

## Inventário (preencher)
### Tabelas / Domínios
- [ ] RBAC: roles / permissions / user_roles / profiles
- [ ] Conteúdo: materias / projetos / equipe (ou equivalentes)
- [ ] Outras: (listar)

### Funcionalidades Supabase que precisam de substituto
- [ ] Auth (login/sessão/JWT)
- [ ] RLS (Row Level Security)
- [ ] RPCs / Funções (ex: is_admin(), get_my_roles(), etc.)
- [ ] Triggers / Views (se existirem)

## Riscos principais
- Segurança: regras que eram “no banco (RLS)” agora ficam “na API”.
- Divergência de dados: import parcial ou ordem errada pode quebrar FKs.
- Tipos: uuid/timezone/jsonb exigem padronização.

## Critérios de sucesso
- API substitui os fluxos essenciais (login, roles, CRUD)
- Todas as permissões equivalentes às regras anteriores
- Validação: contagem de registros + integridade referencial + amostras
- Cutover com rollback testado
