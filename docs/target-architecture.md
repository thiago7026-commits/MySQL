# Target Architecture — MySQL + API + Front

## Visão geral
O MySQL será o banco de dados principal. A API passa a ser a “fonte de verdade” de autenticação, autorização e regras de acesso.

## Componentes
### Front-end (Hostinger)
- Consome somente endpoints da API (HTTPS)
- Armazena token de sessão de forma segura (preferência: cookie httpOnly via backend)

### API Backend
- Autenticação: JWT + refresh (ou sessão)
- Autorização: RBAC (roles + permissions por módulo/ação)
- CRUDs: Matérias / Projetos / Equipe
- Auditoria: registra ações sensíveis

### Banco MySQL
- Schema versionado (migrations)
- Índices e constraints explícitos
- Backups automatizados

## Fluxos
### Login
1) Front envia credenciais → API
2) API valida e emite token (access + refresh)
3) Front acessa rotas protegidas com token

### Autorização (RBAC)
1) API extrai user_id do token
2) API carrega roles/permissions (cache opcional)
3) `can(module:action)` decide 403/200

## Decisões recomendadas
- UUID: armazenar como `BINARY(16)` (melhor performance) ou `CHAR(36)` (mais simples)
- Datas: padronizar UTC
- JSON: usar tipo `JSON` quando necessário
