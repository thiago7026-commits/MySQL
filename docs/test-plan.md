# Test Plan — Migração + API

## Testes de dados
- [ ] Contagem por tabela (origem vs destino)
- [ ] Integridade referencial (FKs)
- [ ] Amostragem por chaves (10–50 registros por tabela)
- [ ] Campos obrigatórios não nulos

## Testes de autenticação
- [ ] login válido
- [ ] login inválido (senha errada)
- [ ] refresh token
- [ ] expiração de sessão

## Testes de autorização (RBAC)
- [ ] viewer: somente leitura
- [ ] editor: criar/editar conforme permissões
- [ ] admin: acesso total
- [ ] 401 sem token
- [ ] 403 sem permissão

## Testes E2E mínimos
- [ ] CRUD de Matérias
- [ ] CRUD de Projetos
- [ ] CRUD de Equipe
- [ ] Leitura pública apenas de publicado
