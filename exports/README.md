# Exports (Supabase → MySQL)

## Objetivo
Pasta para armazenar arquivos exportados do Supabase (CSV/JSON) para importação no MySQL.

## Convenção de nomes
- `roles.csv`
- `permissions.csv`
- `role_permissions.csv`
- `users.csv` (se exportar)
- `user_roles.csv`
- `materias.csv` etc.

## Ordem de importação sugerida
1) roles
2) permissions
3) role_permissions
4) users
5) user_roles
6) conteúdo (materias/projetos/equipe)

## Validação pós-import
- comparar contagem de linhas por tabela
- verificar FKs
- amostragem por chaves
