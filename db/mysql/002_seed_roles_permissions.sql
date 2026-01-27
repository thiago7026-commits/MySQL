-- 002_seed_roles_permissions.sql

INSERT IGNORE INTO roles (name) VALUES
('admin'),
('editor'),
('viewer');

-- Permissões exemplo (ajuste conforme módulos reais)
INSERT IGNORE INTO permissions (module, action) VALUES
('materias','criar'),
('materias','editar'),
('materias','publicar'),
('materias','excluir'),
('projetos','criar'),
('projetos','editar'),
('projetos','publicar'),
('projetos','excluir'),
('equipe','criar'),
('equipe','editar'),
('equipe','publicar'),
('equipe','excluir');

-- Regra simples: admin tem tudo (ajuste depois)
INSERT IGNORE INTO role_permissions (role_id, permission_id)
SELECT r.id, p.id
FROM roles r
JOIN permissions p
WHERE r.name = 'admin';
