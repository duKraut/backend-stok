INSERT INTO suppliers (id, name, document, category, person_type, contact_name, email, phone, address, zip_code, city, neighborhood, active, created_at, updated_at)
VALUES
  ('a1000000-0000-0000-0000-000000000001',
   'Tech Solutions Ltda', '12.345.678/0001-90', 'Tecnologia', 'PJ',
   'Marcos Oliveira', 'vendas@techsolutions.com.br', '(11) 3344-5566',
   'Av. Paulista, 1000', '01310-100', 'São Paulo', 'Bela Vista',
   TRUE, NOW(), NOW()),

  ('a1000000-0000-0000-0000-000000000002',
   'Escritório Design S/A', '23.456.789/0001-01', 'Mobiliário', 'PJ',
   'Fernanda Lima', 'contato@escritoriodesign.com.br', '(11) 4455-6677',
   'Rua Augusta, 500', '01305-000', 'São Paulo', 'Consolação',
   TRUE, NOW(), NOW()),

  ('a1000000-0000-0000-0000-000000000003',
   'Suprimentos Total Ltda', '34.567.890/0001-12', 'Almoxarifado', 'PJ',
   'Roberto Santos', 'comercial@suprimentostotal.com.br', '(11) 5566-7788',
   'Rua das Flores, 200', '04022-000', 'São Paulo', 'Vila Mariana',
   TRUE, NOW(), NOW());


INSERT INTO assets (id, name, brand, model, serial_number, category, conservation_status, department, location, responsible, acquisition_date, acquisition_value, supplier_id, warranty_until, useful_life_years, depreciation_rate, depreciation_method, active, created_at, updated_at)
VALUES
  ('b1000000-0000-0000-0000-000000000001',
   'Notebook', 'Dell', 'Latitude 5530', 'SN-DL5530-001', 'Informática',
   'BOM', 'TI', 'Sala 101', 'Administrador',
   '2023-03-15', 4850.00, 'a1000000-0000-0000-0000-000000000001',
   '2026-03-15', 5, 20.00, 'LINEAR', TRUE, NOW(), NOW()),

  ('b1000000-0000-0000-0000-000000000002',
   'Servidor', 'Dell', 'PowerEdge R750', 'SN-PE750-001', 'Informática',
   'MANUTENCAO', 'TI', 'Sala de Servidores', 'Administrador',
   '2024-01-10', 38500.00, 'a1000000-0000-0000-0000-000000000001',
   '2027-01-10', 10, 10.00, 'LINEAR', TRUE, NOW(), NOW()),

  ('b1000000-0000-0000-0000-000000000003',
   'Câmera IP', 'Intelbras', 'VIP 1130 B', 'SN-INT1130-001', 'Segurança',
   'MANUTENCAO', 'TI', 'Corredor Principal', 'Administrador',
   '2023-08-20', 620.00, 'a1000000-0000-0000-0000-000000000001',
   '2025-08-20', 5, 20.00, 'LINEAR', TRUE, NOW(), NOW()),

  ('b1000000-0000-0000-0000-000000000004',
   'Impressora Multifuncional', 'HP', 'LaserJet Pro M428', 'SN-HP428-001', 'Informática',
   'MANUTENCAO', 'RH', 'Sala de Impressão', 'Administrador',
   '2021-06-10', 2100.00, 'a1000000-0000-0000-0000-000000000001',
   '2023-06-10', 5, 20.00, 'LINEAR', TRUE, NOW(), NOW()),

  ('b1000000-0000-0000-0000-000000000005',
   'Telefone IP', 'Cisco', '7841', 'SN-CS7841-001', 'Telefonia',
   'SUBSTITUIR', 'RH', 'Recepção', 'Administrador',
   '2022-11-05', 890.00, 'a1000000-0000-0000-0000-000000000001',
   '2024-11-05', 5, 20.00, 'LINEAR', TRUE, NOW(), NOW()),

  ('b1000000-0000-0000-0000-000000000006',
   'Projetor', 'Epson', 'PowerLite X49', 'SN-EPX49-001', 'Audiovisual',
   'EXCELENTE', 'Secretaria', 'Sala de Reunião', 'Administrador',
   '2024-02-20', 3200.00, 'a1000000-0000-0000-0000-000000000001',
   '2027-02-20', 5, 20.00, 'LINEAR', TRUE, NOW(), NOW()),

  ('b1000000-0000-0000-0000-000000000007',
   'Computador Desktop', 'Lenovo', 'ThinkCentre M70q', 'SN-LNM70Q-001', 'Informática',
   'SUBSTITUIR', 'Financeiro', 'Sala Financeiro', 'Administrador',
   '2018-05-12', 1800.00, 'a1000000-0000-0000-0000-000000000001',
   '2020-05-12', 5, 20.00, 'LINEAR', TRUE, NOW(), NOW()),

  ('b1000000-0000-0000-0000-000000000008',
   'Mesa de Reunião', 'Flex', 'Executive 200', 'SN-FXEX200-001', 'Mobiliário',
   'BOM', 'Secretaria', 'Sala de Reunião', 'Administrador',
   '2020-09-01', 1450.00, 'a1000000-0000-0000-0000-000000000002',
   NULL, 10, 10.00, 'LINEAR', FALSE, NOW(), NOW()),

  ('b1000000-0000-0000-0000-000000000009',
   'Monitor', 'Samsung', 'Odyssey G5 27"', 'SN-SAM-G527-001', 'Informática',
   'BOM', 'TI', 'Sala 101', 'Administrador',
   '2024-05-10', 2200.00, 'a1000000-0000-0000-0000-000000000001',
   '2027-05-10', 5, 20.00, 'LINEAR', TRUE, NOW(), NOW()),

  ('b1000000-0000-0000-0000-000000000010',
   'Cadeira Ergonômica', 'Flexform', 'Presidente Plus', 'SN-FFP-001', 'Mobiliário',
   'EXCELENTE', 'Diretoria', 'Sala da Diretoria', 'Administrador',
   '2025-02-14', 980.00, 'a1000000-0000-0000-0000-000000000002',
   '2028-02-14', 10, 10.00, 'LINEAR', TRUE, NOW(), NOW()),

  ('b1000000-0000-0000-0000-000000000011',
   'Ar-Condicionado', 'LG', 'Dual Inverter 18000 BTU', 'SN-LG-AC18-001', 'Climatização',
   'SUBSTITUIR', 'Diretoria', 'Sala da Diretoria', 'Administrador',
   '2017-11-20', 3400.00, 'a1000000-0000-0000-0000-000000000001',
   '2019-11-20', 10, 10.00, 'LINEAR', TRUE, NOW(), NOW()),

  ('b1000000-0000-0000-0000-000000000012',
   'Nobreak', 'APC', 'Smart-UPS 1500VA', 'SN-APC-UPS15-001', 'Informática',
   'EXCELENTE', 'TI', 'Sala de Servidores', 'Administrador',
   '2025-08-01', 2850.00, 'a1000000-0000-0000-0000-000000000001',
   '2028-08-01', 5, 20.00, 'LINEAR', TRUE, NOW(), NOW());


INSERT INTO asset_movements (id, asset_id, type, from_department, to_department, responsible, date, observations, decommission, created_at)
VALUES (
  'c1000000-0000-0000-0000-000000000001',
  'b1000000-0000-0000-0000-000000000001',
  'TRANSFERENCIA', 'TI', 'Financeiro', 'Administrador',
  '2025-03-10',
  'Remanejamento por demanda operacional do setor financeiro.',
  FALSE, NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, responsible, date, observations, maintenance_type, service_provider, send_date, expected_return_date, estimated_cost, decommission, created_at)
VALUES (
  'c1000000-0000-0000-0000-000000000002',
  'b1000000-0000-0000-0000-000000000004',
  'MANUTENCAO', 'RH', 'Administrador',
  '2025-04-05',
  'Limpeza geral e troca do rolete de alimentação de papel.',
  'PREVENTIVA', 'HP Assistência Técnica Centro', '2025-04-05', '2025-04-20', 350.00,
  FALSE, NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, responsible, date, observations, new_conservation_status, decommission, created_at)
VALUES (
  'c1000000-0000-0000-0000-000000000003',
  'b1000000-0000-0000-0000-000000000007',
  'ESTADO', 'Financeiro', 'Administrador',
  '2025-05-20',
  'Equipamento com desempenho insuficiente para as demandas atuais do setor.',
  'SUBSTITUIR', FALSE, NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, responsible, date, observations, decommission, decommission_reason, final_destination, created_at)
VALUES (
  'c1000000-0000-0000-0000-000000000004',
  'b1000000-0000-0000-0000-000000000008',
  'ESTADO', 'Secretaria', 'Administrador',
  '2025-06-02',
  'Bem com estrutura comprometida sem viabilidade de reparo.',
  TRUE, 'Desgaste natural irreversível da estrutura metálica.',
  'Descarte conforme normas de resíduos sólidos do município.',
  NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, to_department, responsible, date, observations, decommission, created_at)
VALUES (
  'c1000000-0000-0000-0000-000000000005',
  'b1000000-0000-0000-0000-000000000009',
  'TRANSFERENCIA', 'TI', 'Financeiro', 'Administrador',
  '2025-09-15',
  'Empréstimo temporário ao Financeiro durante implantação de novo sistema.',
  FALSE, NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, responsible, date, observations, new_conservation_status, decommission, created_at)
VALUES (
  'c1000000-0000-0000-0000-000000000006',
  'b1000000-0000-0000-0000-000000000011',
  'ESTADO', 'Diretoria', 'Administrador',
  '2025-11-20',
  'Equipamento com mais de 8 anos de uso. Eficiência energética comprometida.',
  'SUBSTITUIR', FALSE, NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, to_department, responsible, date, observations, decommission, created_at)
VALUES (
  'c1000000-0000-0000-0000-000000000007',
  'b1000000-0000-0000-0000-000000000001',
  'TRANSFERENCIA', 'Financeiro', 'TI', 'Administrador',
  '2026-02-10',
  'Retorno ao setor de TI após conclusão do projeto no Financeiro.',
  FALSE, NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, to_department, responsible, date, observations, decommission, created_at)
VALUES (
  'c1000000-0000-0000-0000-000000000008',
  'b1000000-0000-0000-0000-000000000009',
  'TRANSFERENCIA', 'Financeiro', 'TI', 'Administrador',
  '2026-03-05',
  'Devolução após encerramento do projeto no Financeiro.',
  FALSE, NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, responsible, date, observations, maintenance_type, service_provider, send_date, expected_return_date, estimated_cost, decommission, created_at)
VALUES (
  'c1000000-0000-0000-0000-000000000009',
  'b1000000-0000-0000-0000-000000000012',
  'MANUTENCAO', 'TI', 'Administrador',
  '2026-04-18',
  'Manutenção preventiva anual com substituição de baterias.',
  'PREVENTIVA', 'APC Service Center', '2026-04-18', '2026-04-25', 420.00,
  FALSE, NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, to_department, responsible, date, observations, decommission, created_at)
VALUES (
  'c1000000-0000-0000-0000-000000000010',
  'b1000000-0000-0000-0000-000000000006',
  'TRANSFERENCIA', 'Diretoria', 'Secretaria', 'Administrador',
  '2026-06-02',
  'Remanejamento do projetor para atender à demanda de apresentações do setor.',
  FALSE, NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, responsible, date, observations, maintenance_type, service_provider, send_date, expected_return_date, estimated_cost, decommission, created_at)
VALUES (
  'c1000000-0000-0000-0000-000000000011',
  'b1000000-0000-0000-0000-000000000003',
  'MANUTENCAO', 'TI', 'Administrador',
  '2026-06-11',
  'Falha intermitente na captação de imagem. Encaminhado para reparo corretivo.',
  'CORRETIVA', 'Intelbras Service Center', '2026-06-11', '2026-06-25', 280.00,
  FALSE, NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, responsible, date, observations, new_conservation_status, decommission, created_at)
VALUES (
  'c1000000-0000-0000-0000-000000000012',
  'b1000000-0000-0000-0000-000000000005',
  'ESTADO', 'RH', 'Administrador',
  '2026-06-16',
  'Equipamento com mais de 4 anos de uso. Protocolo VoIP obsoleto e sem suporte do fabricante.',
  'SUBSTITUIR', FALSE, NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, responsible, date, observations, new_conservation_status, decommission, created_at)
VALUES (
  'c1000000-0000-0000-0000-000000000013',
  'b1000000-0000-0000-0000-000000000012',
  'ESTADO', 'TI', 'Administrador',
  '2026-06-03',
  'Retorno de manutenção aprovado. Nobreak em pleno funcionamento.',
  'EXCELENTE', FALSE, NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, to_department, responsible, date, observations, decommission, created_at)
VALUES (
  'c1000000-0000-0000-0000-000000000014',
  'b1000000-0000-0000-0000-000000000010',
  'TRANSFERENCIA', 'RH', 'Diretoria', 'Administrador',
  '2026-06-09',
  'Remanejamento para a Diretoria durante período de reuniões do conselho.',
  FALSE, NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, responsible, date, observations, maintenance_type, service_provider, send_date, expected_return_date, estimated_cost, decommission, created_at)
VALUES (
  'c1000000-0000-0000-0000-000000000015',
  'b1000000-0000-0000-0000-000000000002',
  'MANUTENCAO', 'TI', 'Administrador',
  '2026-06-18',
  'Manutenção preventiva semestral com atualização de firmware e limpeza interna.',
  'PREVENTIVA', 'Dell Service Center', '2026-06-18', '2026-06-30', 850.00,
  FALSE, NOW()
);


INSERT INTO inventory (id, name, brand, category, location, description, unit, min_stock, current_stock, active, created_at, updated_at)
VALUES
  ('d1000000-0000-0000-0000-000000000001',
   'Papel Sulfite A4', 'Chamex', 'Papelaria', 'Almoxarifado — Prateleira A1',
   'Resma 500 folhas 75g/m²', 'CX', 5, 22, TRUE, NOW(), NOW()),

  ('d1000000-0000-0000-0000-000000000002',
   'Caneta Esferográfica Azul', 'Bic', 'Papelaria', 'Almoxarifado — Prateleira A2',
   'Caixa com 50 unidades', 'CX', 3, 7, TRUE, NOW(), NOW()),

  ('d1000000-0000-0000-0000-000000000003',
   'Toner HP LaserJet', 'HP', 'Informática', 'Almoxarifado — Prateleira B1',
   'Cartucho original para HP LaserJet Pro M428', 'UN', 2, 6, TRUE, NOW(), NOW()),

  ('d1000000-0000-0000-0000-000000000004',
   'Detergente Neutro', 'Ypê', 'Limpeza', 'Almoxarifado — Prateleira C1',
   'Galão 5 litros', 'GL', 4, 12, TRUE, NOW(), NOW()),

  ('d1000000-0000-0000-0000-000000000005',
   'Álcool 70%', 'Rioquímica', 'Limpeza', 'Almoxarifado — Prateleira C2',
   'Frasco 1 litro', 'LT', 10, 18, TRUE, NOW(), NOW()),

  ('d1000000-0000-0000-0000-000000000006',
   'Pasta AZ Lombada Larga', 'Dello', 'Papelaria', 'Almoxarifado — Prateleira A3',
   'Tamanho ofício, lombada larga', 'UN', 5, 14, TRUE, NOW(), NOW()),

  ('d1000000-0000-0000-0000-000000000007',
   'Pilha Alcalina AA', 'Duracell', 'Informática', 'Almoxarifado — Prateleira B2',
   'Caixa com 24 unidades', 'CX', 8, 2, TRUE, NOW(), NOW()),

  ('d1000000-0000-0000-0000-000000000008',
   'Fita Adesiva Larga', 'Scotch', 'Papelaria', 'Almoxarifado — Prateleira A4',
   'Rolo 48mm x 50m', 'UN', 5, 0, TRUE, NOW(), NOW()),

  ('d1000000-0000-0000-0000-000000000009',
   'Sabonete Líquido', 'Dove', 'Higiene', 'Almoxarifado — Prateleira C3',
   'Refil 400ml', 'UN', 12, 3, TRUE, NOW(), NOW());


INSERT INTO inventory_movements (id, item_id, type, quantity, responsible, date, sector, observations, supplier_name, unit_value, total_value, created_at)
VALUES
  ('e1000000-0000-0000-0000-000000000001',
   'd1000000-0000-0000-0000-000000000001',
   'ENTRADA', 20, 'Administrador', '2025-01-15', 'Almoxarifado',
   'Recebimento conforme pedido de compra nº 001/2025.',
   'Suprimentos Total Ltda', 28.50, 570.00, NOW()),

  ('e1000000-0000-0000-0000-000000000002',
   'd1000000-0000-0000-0000-000000000003',
   'ENTRADA', 6, 'Administrador', '2025-02-03', 'Almoxarifado',
   'Reposição de toner para impressoras HP do parque de TI.',
   'Tech Solutions Ltda', 185.00, 1110.00, NOW()),

  ('e1000000-0000-0000-0000-000000000003',
   'd1000000-0000-0000-0000-000000000004',
   'ENTRADA', 12, 'Administrador', '2025-02-10', 'Almoxarifado',
   'Compra semestral de insumos de limpeza.',
   'Suprimentos Total Ltda', 22.00, 264.00, NOW()),

  ('e1000000-0000-0000-0000-000000000004',
   'd1000000-0000-0000-0000-000000000005',
   'ENTRADA', 30, 'Administrador', '2025-02-10', 'Almoxarifado',
   'Compra semestral de insumos de limpeza.',
   'Suprimentos Total Ltda', 8.90, 267.00, NOW()),

  ('e1000000-0000-0000-0000-000000000005',
   'd1000000-0000-0000-0000-000000000001',
   'SAIDA', 2, 'Administrador', '2025-03-05', 'RH',
   'Distribuição para o setor de RH.',
   NULL, NULL, NULL, NOW()),

  ('e1000000-0000-0000-0000-000000000006',
   'd1000000-0000-0000-0000-000000000002',
   'SAIDA', 1, 'Administrador', '2025-03-05', 'Financeiro',
   'Distribuição para o setor Financeiro.',
   NULL, NULL, NULL, NOW()),

  ('e1000000-0000-0000-0000-000000000007',
   'd1000000-0000-0000-0000-000000000003',
   'ENTRADA', 6, 'Administrador', '2025-06-01', 'Almoxarifado',
   'Reposição de estoque — pedido de compra nº 014/2025.',
   'Tech Solutions Ltda', 185.00, 1110.00, NOW()),

  ('e1000000-0000-0000-0000-000000000008',
   'd1000000-0000-0000-0000-000000000003',
   'SAIDA', 2, 'Administrador', '2025-06-10', 'TI',
   'Substituição de toner nas impressoras do setor de TI.',
   NULL, NULL, NULL, NOW()),

  ('e1000000-0000-0000-0000-000000000009',
   'd1000000-0000-0000-0000-000000000005',
   'SAIDA', 6, 'Administrador', '2025-04-15', 'Manutenção',
   'Reposição mensal para higienização de equipamentos.',
   NULL, NULL, NULL, NOW()),

  ('e1000000-0000-0000-0000-000000000010',
   'd1000000-0000-0000-0000-000000000007',
   'ENTRADA', 12, 'Administrador', '2025-07-10', 'Almoxarifado',
   'Compra de pilhas para controles e dispositivos sem fio.',
   'Suprimentos Total Ltda', 38.00, 456.00, NOW()),

  ('e1000000-0000-0000-0000-000000000011',
   'd1000000-0000-0000-0000-000000000007',
   'SAIDA', 5, 'Administrador', '2025-08-20', 'TI',
   'Distribuição para teclados e mouses sem fio do setor de TI.',
   NULL, NULL, NULL, NOW()),

  ('e1000000-0000-0000-0000-000000000012',
   'd1000000-0000-0000-0000-000000000009',
   'ENTRADA', 20, 'Administrador', '2025-09-05', 'Almoxarifado',
   'Compra trimestral de higiene pessoal.',
   'Suprimentos Total Ltda', 6.50, 130.00, NOW()),

  ('e1000000-0000-0000-0000-000000000013',
   'd1000000-0000-0000-0000-000000000009',
   'SAIDA', 8, 'Administrador', '2025-10-12', 'RH',
   'Distribuição para banheiros dos setores.',
   NULL, NULL, NULL, NOW()),

  ('e1000000-0000-0000-0000-000000000014',
   'd1000000-0000-0000-0000-000000000006',
   'ENTRADA', 10, 'Administrador', '2025-11-03', 'Almoxarifado',
   'Reposição de pastas para arquivo anual.',
   'Suprimentos Total Ltda', 14.90, 149.00, NOW()),

  ('e1000000-0000-0000-0000-000000000015',
   'd1000000-0000-0000-0000-000000000006',
   'SAIDA', 4, 'Administrador', '2025-11-20', 'Financeiro',
   'Arquivamento de documentos contábeis do exercício.',
   NULL, NULL, NULL, NOW()),

  ('e1000000-0000-0000-0000-000000000016',
   'd1000000-0000-0000-0000-000000000001',
   'ENTRADA', 15, 'Administrador', '2025-12-02', 'Almoxarifado',
   'Reposição de final de ano — pedido nº 031/2025.',
   'Suprimentos Total Ltda', 28.50, 427.50, NOW()),

  ('e1000000-0000-0000-0000-000000000017',
   'd1000000-0000-0000-0000-000000000005',
   'ENTRADA', 24, 'Administrador', '2025-12-05', 'Almoxarifado',
   'Compra semestral de álcool para higienização.',
   'Suprimentos Total Ltda', 8.90, 213.60, NOW()),

  ('e1000000-0000-0000-0000-000000000018',
   'd1000000-0000-0000-0000-000000000002',
   'ENTRADA', 8, 'Administrador', '2026-01-08', 'Almoxarifado',
   'Reposição anual de canetas — pedido nº 001/2026.',
   'Suprimentos Total Ltda', 52.00, 416.00, NOW()),

  ('e1000000-0000-0000-0000-000000000019',
   'd1000000-0000-0000-0000-000000000001',
   'SAIDA', 3, 'Administrador', '2026-01-15', 'RH',
   'Distribuição mensal para o setor de RH.',
   NULL, NULL, NULL, NOW()),

  ('e1000000-0000-0000-0000-000000000020',
   'd1000000-0000-0000-0000-000000000004',
   'ENTRADA', 10, 'Administrador', '2026-01-20', 'Almoxarifado',
   'Compra semestral de detergente — pedido nº 003/2026.',
   'Suprimentos Total Ltda', 22.00, 220.00, NOW()),

  ('e1000000-0000-0000-0000-000000000021',
   'd1000000-0000-0000-0000-000000000005',
   'SAIDA', 5, 'Administrador', '2026-02-05', 'Manutenção',
   'Higienização dos equipamentos do laboratório.',
   NULL, NULL, NULL, NOW()),

  ('e1000000-0000-0000-0000-000000000022',
   'd1000000-0000-0000-0000-000000000003',
   'ENTRADA', 4, 'Administrador', '2026-02-12', 'Almoxarifado',
   'Reposição de toner — pedido nº 005/2026.',
   'Tech Solutions Ltda', 185.00, 740.00, NOW()),

  ('e1000000-0000-0000-0000-000000000023',
   'd1000000-0000-0000-0000-000000000002',
   'SAIDA', 2, 'Administrador', '2026-02-18', 'Diretoria',
   'Distribuição para sala da Diretoria.',
   NULL, NULL, NULL, NOW()),

  ('e1000000-0000-0000-0000-000000000024',
   'd1000000-0000-0000-0000-000000000001',
   'SAIDA', 2, 'Administrador', '2026-03-04', 'TI',
   'Distribuição para o setor de TI.',
   NULL, NULL, NULL, NOW()),

  ('e1000000-0000-0000-0000-000000000025',
   'd1000000-0000-0000-0000-000000000006',
   'ENTRADA', 8, 'Administrador', '2026-03-10', 'Almoxarifado',
   'Reposição de pastas para o primeiro semestre.',
   'Suprimentos Total Ltda', 14.90, 119.20, NOW()),

  ('e1000000-0000-0000-0000-000000000026',
   'd1000000-0000-0000-0000-000000000004',
   'SAIDA', 3, 'Administrador', '2026-03-20', 'Limpeza',
   'Reposição mensal para equipe de limpeza.',
   NULL, NULL, NULL, NOW()),

  ('e1000000-0000-0000-0000-000000000027',
   'd1000000-0000-0000-0000-000000000005',
   'ENTRADA', 20, 'Administrador', '2026-04-02', 'Almoxarifado',
   'Compra semestral de álcool — pedido nº 009/2026.',
   'Suprimentos Total Ltda', 8.90, 178.00, NOW()),

  ('e1000000-0000-0000-0000-000000000028',
   'd1000000-0000-0000-0000-000000000003',
   'SAIDA', 2, 'Administrador', '2026-04-14', 'TI',
   'Substituição de toner na impressora do setor.',
   NULL, NULL, NULL, NOW()),

  ('e1000000-0000-0000-0000-000000000029',
   'd1000000-0000-0000-0000-000000000001',
   'ENTRADA', 12, 'Administrador', '2026-04-22', 'Almoxarifado',
   'Reposição de papel sulfite — pedido nº 010/2026.',
   'Suprimentos Total Ltda', 28.50, 342.00, NOW()),

  ('e1000000-0000-0000-0000-000000000030',
   'd1000000-0000-0000-0000-000000000006',
   'SAIDA', 3, 'Administrador', '2026-05-06', 'Financeiro',
   'Arquivamento de documentos fiscais.',
   NULL, NULL, NULL, NOW()),

  ('e1000000-0000-0000-0000-000000000031',
   'd1000000-0000-0000-0000-000000000002',
   'ENTRADA', 5, 'Administrador', '2026-05-14', 'Almoxarifado',
   'Reposição de canetas para o segundo trimestre.',
   'Suprimentos Total Ltda', 52.00, 260.00, NOW()),

  ('e1000000-0000-0000-0000-000000000032',
   'd1000000-0000-0000-0000-000000000005',
   'SAIDA', 4, 'Administrador', '2026-05-22', 'Manutenção',
   'Higienização mensal de equipamentos.',
   NULL, NULL, NULL, NOW()),

  ('e1000000-0000-0000-0000-000000000033',
   'd1000000-0000-0000-0000-000000000004',
   'ENTRADA', 8, 'Administrador', '2026-06-03', 'Almoxarifado',
   'Reposição de detergente — pedido nº 014/2026.',
   'Suprimentos Total Ltda', 22.00, 176.00, NOW()),

  ('e1000000-0000-0000-0000-000000000034',
   'd1000000-0000-0000-0000-000000000001',
   'SAIDA', 2, 'Administrador', '2026-06-05', 'Secretaria',
   'Distribuição para a Secretaria.',
   NULL, NULL, NULL, NOW()),

  ('e1000000-0000-0000-0000-000000000035',
   'd1000000-0000-0000-0000-000000000003',
   'SAIDA', 2, 'Administrador', '2026-06-10', 'RH',
   'Substituição de toner na impressora multifuncional de RH.',
   NULL, NULL, NULL, NOW());
