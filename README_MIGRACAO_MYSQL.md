diff --git a/README_MIGRACAO_MYSQL.md b/README_MIGRACAO_MYSQL.md
index 6b2d0b4..0d3a9a1 100644
--- a/README_MIGRACAO_MYSQL.md
+++ b/README_MIGRACAO_MYSQL.md
@@ -1,110 +1,114 @@
 # Estratégia de Migração Completa — Supabase → MySQL
 
 ## Objetivo (vitrine)
 Executar uma migração completa com padrão profissional: assessment, arquitetura alvo, migração de dados, segurança (RBAC), testes, cutover e rollback.
 
 ## Entregáveis
 - docs/ (assessment, mapping, security, cutover, rollback, testes, ops)
 - db/mysql/ (schema + seeds versionados)
 - exports/ (arquivos de export/import)
+- checklists/ (passos de execução práticos)
 
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
-- Data:
-- Responsável:
-- Ambiente: PROD
+- Data: 2026-01-28
+- Responsável: Thiago Dias
+- Ambiente: PROD
diff --git a/checklists/001_migracao_mysql_hoje.md b/checklists/001_migracao_mysql_hoje.md
new file mode 100644
index 0000000..b9f1b2a
--- /dev/null
+++ b/checklists/001_migracao_mysql_hoje.md
@@ -0,0 +1,170 @@
+# Checklist HOJE — Início da Migração Supabase → MySQL (PROD)
+
+**Objetivo de hoje:** deixar o MySQL pronto (schema + seed RBAC) e criar o “pipeline” de export/import com validação.
+
+> Observação: sem ambiente “dev” formal. Você pode testar localmente se quiser, mas o alvo e a execução principal são em **PROD**.
+
+---
+
+## 0) Pré-requisitos (15 min)
+- [ ] Ter acesso ao painel do Supabase (para exportar tabelas)
+- [ ] Ter acesso ao MySQL do provedor (Hostinger / MySQL remoto / phpMyAdmin)
+- [ ] Ter este repo atualizado (pull)
+
+---
+
+## 1) Criar o banco em PROD (MySQL)
+No painel do provedor:
+- [ ] Criar **database** (ex: `rkc_prod`)
+- [ ] Criar **usuário** e senha forte
+- [ ] Conceder permissões do usuário no database
+- [ ] Salvar Host / Porta / DB / User / Pass em um local seguro
+
+Checklist rápido de conexão:
+- [ ] Consigo conectar via phpMyAdmin OU cliente MySQL
+
+---
+
+## 2) Aplicar schema + seed (PROD)
+Executar na ordem:
+1) `db/mysql/001_schema.sql`
+2) `db/mysql/002_seed_roles_permissions.sql`
+
+Validação rápida:
+- [ ] Tabela `roles` existe e tem: admin/editor/viewer
+- [ ] Tabela `permissions` existe e tem permissões exemplo
+- [ ] `role_permissions` tem vínculos do admin
+
+---
+
+## 3) Export do Supabase → exports/
+Hoje o foco é RBAC + usuários + tabelas principais (as que existirem).
+
+Exportar para CSV (um arquivo por tabela) e salvar em `exports/`:
+- [ ] `roles.csv`
+- [ ] `permissions.csv`
+- [ ] `role_permissions.csv` (se existir no Supabase)
+- [ ] `users.csv` (se você tiver tabela própria; **auth.users** não exporta senha)
+- [ ] `user_roles.csv`
+- [ ] Conteúdo:
+  - [ ] `materias.csv` (se existir)
+  - [ ] `projetos.csv` (se existir)
+  - [ ] `equipe.csv` (se existir)
+
+**IMPORTANTE (senhas):**
+- Senhas do Supabase Auth **não** migram “como estão”.
+- Em MySQL, você vai criar um fluxo novo de autenticação (password_hash) ou usar outro provider.
+
+---
+
+## 4) Import no MySQL (ordem correta)
+Ordem recomendada:
+1) roles
+2) permissions
+3) role_permissions
+4) users
+5) user_roles
+6) conteúdo (materias/projetos/equipe)
+
+Você pode importar via:
+- phpMyAdmin (Import → CSV)
+- LOAD DATA (se tiver acesso e permissão)
+
+Validação:
+- [ ] Contagem de linhas por tabela (origem vs destino)
+- [ ] FKs não quebraram (sem erro de constraint)
+
+---
+
+## 5) Relatório rápido de validação (10 min)
+Criar um arquivo simples com contagens:
+- [ ] `exports/VALIDACAO_2026-01-28.md`
+  - tabela: origem / destino / ok?
+
+---
+
+## 6) Commit (fim do dia)
+Arquivos esperados no commit:
+- `checklists/001_migracao_mysql_hoje.md`
+- (opcional) `exports/VALIDACAO_2026-01-28.md` (sem dados sensíveis)
+- atualização do status em `README_MIGRACAO_MYSQL.md`
+
+Mensagem de commit sugerida:
+`chore(mysql): start migration checklist + prod status`
diff --git a/exports/.gitkeep b/exports/.gitkeep
new file mode 100644
index 0000000..e69de29
--- /dev/null
+++ b/exports/.gitkeep
