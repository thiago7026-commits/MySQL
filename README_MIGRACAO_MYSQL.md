# Estratégia de Migração Completa — Supabase → MySQL

## Objetivo (vitrine)
Executar uma migração completa com padrão profissional: assessment, arquitetura alvo, migração de dados, segurança (RBAC), testes, cutover e rollback.

## Entregáveis
- docs/ (assessment, mapping, security, cutover, rollback, testes, ops)
- db/mysql/ (schema + seeds versionados)
- exports/ (arquivos de export/import)

## Fases
### Fase A — Preparação
- [ ] Completar inventário em `docs/migration-assessment.md`
- [ ] Definir decisões em `docs/target-architecture.md`
- [ ] Fechar padrão UUID/timezone em `docs/data-mapping.md`
- [ ] Aplicar `db/mysql/001_schema.sql` em produção
- [ ] Rodar `db/mysql/002_seed_roles_permissions.sql`

### Fase B — Migração de dados
- [ ] Export do Supabase → `exports/`
- [ ] Import para MySQL na ordem correta
- [ ] Validar com `docs/test-plan.md`

### Fase C — Cutover + Rollback
- [ ] Executar `docs/cutover-plan.md`
- [ ] Se necessário, usar `docs/rollback-plan.md`

## Status
- Data:
- Responsável:
- Ambiente: PROD
