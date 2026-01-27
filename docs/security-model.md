# Security Model — Substituindo RLS/RPC por API + RBAC

## Objetivo
Replicar o nível de controle que existia com RLS + RPC no Supabase, agora na camada de API.

## RBAC
### Entidades
- roles (admin/editor/viewer)
- permissions (module, action)
- role_permissions (role_id, permission_id)
- user_roles (user_id, role_id)

### Convenção de permissão
`<module>:<action>`
Ex: `materias:criar`, `materias:publicar`, `equipe:editar`

## Autenticação
- JWT (access token curto) + refresh token
- Rotação de refresh (recomendado)
- Regras: senha forte, rate limit, lockout básico (opcional)

## Autorização
### Middleware/Guard
- valida token
- carrega permissions do usuário
- verifica `can(permission)`
- retorna 403 quando negar

## Auditoria
Tabela `audit_log`:
- id
- actor_user_id
- action (ex: "materias.publicar")
- entity (tipo/id)
- created_at
- metadata (JSON)

## Regras equivalentes ao RLS (exemplos)
- Usuário viewer: somente leitura
- Editor: criar/editar, mas não excluir (se definido)
- Admin: tudo
