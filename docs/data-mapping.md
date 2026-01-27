# Data Mapping — Postgres (Supabase) → MySQL

## Regras gerais
- Datas em UTC
- Booleans como TINYINT(1)
- JSONB → JSON
- UUID: escolher 1 padrão e manter no projeto inteiro

## Mapeamento de tipos (referência)
| Postgres (Supabase) | MySQL |
|---|---|
| uuid | BINARY(16) ou CHAR(36) |
| text | TEXT |
| varchar(n) | VARCHAR(n) |
| jsonb | JSON |
| boolean | TINYINT(1) |
| timestamp with time zone | DATETIME (UTC) |
| bigint/serial | BIGINT / AUTO_INCREMENT |

## Checklist de migração por tabela (preencher)
Para cada tabela:
- Nome:
- PK:
- FKs:
- Índices:
- Campos sensíveis:
- Regras de default:
- Regras de integridade:
