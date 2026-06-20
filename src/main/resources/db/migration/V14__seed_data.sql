INSERT INTO suppliers (id, name, document, category, person_type, contact_name, email, phone, address, zip_code, city, neighborhood, active, created_at, updated_at)
VALUES
  ('9d1f6264-fb71-46dc-9683-381a5e290690',
   'Tech Solutions Ltda', '12.345.678/0001-90', 'Tecnologia', 'PJ',
   'Marcos Oliveira', 'vendas@techsolutions.com.br', '(11) 3344-5566',
   'Av. Paulista, 1000', '01310-100', 'São Paulo', 'Bela Vista',
   TRUE, NOW(), NOW()),

  ('b11f4faa-d179-4bba-82a5-881a4f1eef48',
   'Escritório Design S/A', '23.456.789/0001-01', 'Mobiliário', 'PJ',
   'Fernanda Lima', 'contato@escritoriodesign.com.br', '(11) 4455-6677',
   'Rua Augusta, 500', '01305-000', 'São Paulo', 'Consolação',
   TRUE, NOW(), NOW()),

  ('1013d2b7-82d9-4203-9463-ab93a25d2db4',
   'Suprimentos Total Ltda', '34.567.890/0001-12', 'Almoxarifado', 'PJ',
   'Roberto Santos', 'comercial@suprimentostotal.com.br', '(11) 5566-7788',
   'Rua das Flores, 200', '04022-000', 'São Paulo', 'Vila Mariana',
   TRUE, NOW(), NOW());


INSERT INTO assets (id, name, brand, model, serial_number, category, conservation_status, department, location, responsible, acquisition_date, acquisition_value, supplier_id, warranty_until, useful_life_years, depreciation_rate, depreciation_method, active, created_at, updated_at)
VALUES
  ('cec87c04-2c61-4a50-ac99-bfdcf334efbd',
   'Notebook', 'Dell', 'Latitude 5530', 'SN-DL5530-001', 'Informática',
   'BOM', 'TI', 'Sala 101', 'Administrador',
   '2023-03-15', 4850.00, '9d1f6264-fb71-46dc-9683-381a5e290690',
   '2026-03-15', 5, 20.00, 'LINEAR', TRUE, NOW(), NOW()),

  ('ec278511-4011-4563-a5d9-4b845ea93455',
   'Servidor', 'Dell', 'PowerEdge R750', 'SN-PE750-001', 'Informática',
   'MANUTENCAO', 'TI', 'Sala de Servidores', 'Administrador',
   '2024-01-10', 38500.00, '9d1f6264-fb71-46dc-9683-381a5e290690',
   '2027-01-10', 10, 10.00, 'LINEAR', TRUE, NOW(), NOW()),

  ('ce883c7f-5fc8-4fb1-9679-38b6bc3a210a',
   'Câmera IP', 'Intelbras', 'VIP 1130 B', 'SN-INT1130-001', 'Segurança',
   'MANUTENCAO', 'TI', 'Corredor Principal', 'Administrador',
   '2023-08-20', 620.00, '9d1f6264-fb71-46dc-9683-381a5e290690',
   '2025-08-20', 5, 20.00, 'LINEAR', TRUE, NOW(), NOW()),

  ('f0a03676-4721-4b5d-8a7a-15338297bd73',
   'Impressora Multifuncional', 'HP', 'LaserJet Pro M428', 'SN-HP428-001', 'Informática',
   'MANUTENCAO', 'RH', 'Sala de Impressão', 'Administrador',
   '2021-06-10', 2100.00, '9d1f6264-fb71-46dc-9683-381a5e290690',
   '2023-06-10', 5, 20.00, 'LINEAR', TRUE, NOW(), NOW()),

  ('b4c66162-4835-4f75-9ec4-beeb25acc5dc',
   'Telefone IP', 'Cisco', '7841', 'SN-CS7841-001', 'Telefonia',
   'SUBSTITUIR', 'RH', 'Recepção', 'Administrador',
   '2022-11-05', 890.00, '9d1f6264-fb71-46dc-9683-381a5e290690',
   '2024-11-05', 5, 20.00, 'LINEAR', TRUE, NOW(), NOW()),

  ('aeef4f9f-f6e9-47ea-a658-28e4f1e19395',
   'Projetor', 'Epson', 'PowerLite X49', 'SN-EPX49-001', 'Audiovisual',
   'EXCELENTE', 'Secretaria', 'Sala de Reunião', 'Administrador',
   '2024-02-20', 3200.00, '9d1f6264-fb71-46dc-9683-381a5e290690',
   '2027-02-20', 5, 20.00, 'LINEAR', TRUE, NOW(), NOW()),

  ('092b933c-bb30-4dd4-ae8b-e20d3cd75a8b',
   'Computador Desktop', 'Lenovo', 'ThinkCentre M70q', 'SN-LNM70Q-001', 'Informática',
   'SUBSTITUIR', 'Financeiro', 'Sala Financeiro', 'Administrador',
   '2018-05-12', 1800.00, '9d1f6264-fb71-46dc-9683-381a5e290690',
   '2020-05-12', 5, 20.00, 'LINEAR', TRUE, NOW(), NOW()),

  ('fd091cfe-2dc3-4d14-88ea-437bd392076b',
   'Mesa de Reunião', 'Flex', 'Executive 200', 'SN-FXEX200-001', 'Mobiliário',
   'BOM', 'Secretaria', 'Sala de Reunião', 'Administrador',
   '2020-09-01', 1450.00, 'b11f4faa-d179-4bba-82a5-881a4f1eef48',
   NULL, 10, 10.00, 'LINEAR', FALSE, NOW(), NOW()),

  ('7e146f74-7f92-4605-84ae-72af3e1ef8c1',
   'Monitor', 'Samsung', 'Odyssey G5 27"', 'SN-SAM-G527-001', 'Informática',
   'BOM', 'TI', 'Sala 101', 'Administrador',
   '2024-05-10', 2200.00, '9d1f6264-fb71-46dc-9683-381a5e290690',
   '2027-05-10', 5, 20.00, 'LINEAR', TRUE, NOW(), NOW()),

  ('627905ef-2b35-4075-8a87-b1aeabf46661',
   'Cadeira Ergonômica', 'Flexform', 'Presidente Plus', 'SN-FFP-001', 'Mobiliário',
   'EXCELENTE', 'Diretoria', 'Sala da Diretoria', 'Administrador',
   '2025-02-14', 980.00, 'b11f4faa-d179-4bba-82a5-881a4f1eef48',
   '2028-02-14', 10, 10.00, 'LINEAR', TRUE, NOW(), NOW()),

  ('0f1f75bc-7b3a-4ca5-ae75-817b4741a830',
   'Ar-Condicionado', 'LG', 'Dual Inverter 18000 BTU', 'SN-LG-AC18-001', 'Climatização',
   'SUBSTITUIR', 'Diretoria', 'Sala da Diretoria', 'Administrador',
   '2017-11-20', 3400.00, '9d1f6264-fb71-46dc-9683-381a5e290690',
   '2019-11-20', 10, 10.00, 'LINEAR', TRUE, NOW(), NOW()),

  ('03cc1675-1bc6-49c8-ba5a-b73411f251f5',
   'Nobreak', 'APC', 'Smart-UPS 1500VA', 'SN-APC-UPS15-001', 'Informática',
   'EXCELENTE', 'TI', 'Sala de Servidores', 'Administrador',
   '2025-08-01', 2850.00, '9d1f6264-fb71-46dc-9683-381a5e290690',
   '2028-08-01', 5, 20.00, 'LINEAR', TRUE, NOW(), NOW());


INSERT INTO asset_movements (id, asset_id, type, from_department, to_department, responsible, date, observations, decommission, created_at)
VALUES (
  'bbeef640-0a95-4f20-a58e-f10337dc7430',
  'cec87c04-2c61-4a50-ac99-bfdcf334efbd',
  'TRANSFERENCIA', 'TI', 'Financeiro', 'Administrador',
  '2025-03-10',
  'Remanejamento por demanda operacional do setor financeiro.',
  FALSE, NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, responsible, date, observations, maintenance_type, service_provider, send_date, expected_return_date, estimated_cost, decommission, created_at)
VALUES (
  '184e51bd-da92-4484-a5e0-18feba31e41a',
  'f0a03676-4721-4b5d-8a7a-15338297bd73',
  'MANUTENCAO', 'RH', 'Administrador',
  '2025-04-05',
  'Limpeza geral e troca do rolete de alimentação de papel.',
  'PREVENTIVA', 'HP Assistência Técnica Centro', '2025-04-05', '2025-04-20', 350.00,
  FALSE, NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, responsible, date, observations, new_conservation_status, decommission, created_at)
VALUES (
  'f38c3e2f-9aee-4d85-9798-7b9b46389145',
  '092b933c-bb30-4dd4-ae8b-e20d3cd75a8b',
  'ESTADO', 'Financeiro', 'Administrador',
  '2025-05-20',
  'Equipamento com desempenho insuficiente para as demandas atuais do setor.',
  'SUBSTITUIR', FALSE, NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, responsible, date, observations, decommission, decommission_reason, final_destination, created_at)
VALUES (
  '7406980a-0f83-45fb-bf72-8cdecd8a6d91',
  'fd091cfe-2dc3-4d14-88ea-437bd392076b',
  'ESTADO', 'Secretaria', 'Administrador',
  '2025-06-02',
  'Bem com estrutura comprometida sem viabilidade de reparo.',
  TRUE, 'Desgaste natural irreversível da estrutura metálica.',
  'Descarte conforme normas de resíduos sólidos do município.',
  NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, to_department, responsible, date, observations, decommission, created_at)
VALUES (
  '07de79c9-d8f7-4c91-ac4e-c16d670da5ff',
  '7e146f74-7f92-4605-84ae-72af3e1ef8c1',
  'TRANSFERENCIA', 'TI', 'Financeiro', 'Administrador',
  '2025-09-15',
  'Empréstimo temporário ao Financeiro durante implantação de novo sistema.',
  FALSE, NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, responsible, date, observations, new_conservation_status, decommission, created_at)
VALUES (
  'd42409a2-d039-4326-83bc-1ca7a984337d',
  '0f1f75bc-7b3a-4ca5-ae75-817b4741a830',
  'ESTADO', 'Diretoria', 'Administrador',
  '2025-11-20',
  'Equipamento com mais de 8 anos de uso. Eficiência energética comprometida.',
  'SUBSTITUIR', FALSE, NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, to_department, responsible, date, observations, decommission, created_at)
VALUES (
  'f6c2ffd9-edef-4056-8730-27cffe7bb174',
  'cec87c04-2c61-4a50-ac99-bfdcf334efbd',
  'TRANSFERENCIA', 'Financeiro', 'TI', 'Administrador',
  '2026-02-10',
  'Retorno ao setor de TI após conclusão do projeto no Financeiro.',
  FALSE, NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, to_department, responsible, date, observations, decommission, created_at)
VALUES (
  'fab12909-a092-4ad8-b8e4-b3a2c5d9d7de',
  '7e146f74-7f92-4605-84ae-72af3e1ef8c1',
  'TRANSFERENCIA', 'Financeiro', 'TI', 'Administrador',
  '2026-03-05',
  'Devolução após encerramento do projeto no Financeiro.',
  FALSE, NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, responsible, date, observations, maintenance_type, service_provider, send_date, expected_return_date, estimated_cost, decommission, created_at)
VALUES (
  'd7a6b904-ec2b-4ef7-9eca-7c4a2f6b164f',
  '03cc1675-1bc6-49c8-ba5a-b73411f251f5',
  'MANUTENCAO', 'TI', 'Administrador',
  '2026-04-18',
  'Manutenção preventiva anual com substituição de baterias.',
  'PREVENTIVA', 'APC Service Center', '2026-04-18', '2026-04-25', 420.00,
  FALSE, NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, to_department, responsible, date, observations, decommission, created_at)
VALUES (
  '75d2c31d-e2c4-44b8-aff2-994e4eae8bca',
  'aeef4f9f-f6e9-47ea-a658-28e4f1e19395',
  'TRANSFERENCIA', 'Diretoria', 'Secretaria', 'Administrador',
  '2026-06-02',
  'Remanejamento do projetor para atender à demanda de apresentações do setor.',
  FALSE, NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, responsible, date, observations, maintenance_type, service_provider, send_date, expected_return_date, estimated_cost, decommission, created_at)
VALUES (
  'c7b82910-8340-4f22-b6fa-164f68dcc802',
  'ce883c7f-5fc8-4fb1-9679-38b6bc3a210a',
  'MANUTENCAO', 'TI', 'Administrador',
  '2026-06-11',
  'Falha intermitente na captação de imagem. Encaminhado para reparo corretivo.',
  'CORRETIVA', 'Intelbras Service Center', '2026-06-11', '2026-06-25', 280.00,
  FALSE, NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, responsible, date, observations, new_conservation_status, decommission, created_at)
VALUES (
  '6e49856f-7f79-427d-b305-c858fd0f4728',
  'b4c66162-4835-4f75-9ec4-beeb25acc5dc',
  'ESTADO', 'RH', 'Administrador',
  '2026-06-16',
  'Equipamento com mais de 4 anos de uso. Protocolo VoIP obsoleto e sem suporte do fabricante.',
  'SUBSTITUIR', FALSE, NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, responsible, date, observations, new_conservation_status, decommission, created_at)
VALUES (
  'd1902c6e-126c-4e88-bd06-efe3928b2825',
  '03cc1675-1bc6-49c8-ba5a-b73411f251f5',
  'ESTADO', 'TI', 'Administrador',
  '2026-06-03',
  'Retorno de manutenção aprovado. Nobreak em pleno funcionamento.',
  'EXCELENTE', FALSE, NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, to_department, responsible, date, observations, decommission, created_at)
VALUES (
  'ef99c5f3-1af9-4dfb-9074-f76da0b25556',
  '627905ef-2b35-4075-8a87-b1aeabf46661',
  'TRANSFERENCIA', 'RH', 'Diretoria', 'Administrador',
  '2026-06-09',
  'Remanejamento para a Diretoria durante período de reuniões do conselho.',
  FALSE, NOW()
);

INSERT INTO asset_movements (id, asset_id, type, from_department, responsible, date, observations, maintenance_type, service_provider, send_date, expected_return_date, estimated_cost, decommission, created_at)
VALUES (
  'ebb7fbe8-dc9d-4dba-8abb-ea83b8adbfd1',
  'ec278511-4011-4563-a5d9-4b845ea93455',
  'MANUTENCAO', 'TI', 'Administrador',
  '2026-06-18',
  'Manutenção preventiva semestral com atualização de firmware e limpeza interna.',
  'PREVENTIVA', 'Dell Service Center', '2026-06-18', '2026-06-30', 850.00,
  FALSE, NOW()
);


INSERT INTO inventory (id, name, brand, category, location, description, unit, min_stock, current_stock, active, created_at, updated_at)
VALUES
  ('2df4961d-99c2-4c3d-924f-e304f0e42443',
   'Papel Sulfite A4', 'Chamex', 'Papelaria', 'Almoxarifado — Prateleira A1',
   'Resma 500 folhas 75g/m²', 'CX', 5, 22, TRUE, NOW(), NOW()),

  ('cc23fe03-f165-44ac-83f0-885a6ffc540b',
   'Caneta Esferográfica Azul', 'Bic', 'Papelaria', 'Almoxarifado — Prateleira A2',
   'Caixa com 50 unidades', 'CX', 3, 7, TRUE, NOW(), NOW()),

  ('0fed70ee-423c-44e5-87f9-d57b9c76290e',
   'Toner HP LaserJet', 'HP', 'Informática', 'Almoxarifado — Prateleira B1',
   'Cartucho original para HP LaserJet Pro M428', 'UN', 2, 6, TRUE, NOW(), NOW()),

  ('b5254ff4-8eef-4e82-a4fe-0b08f789e2bd',
   'Detergente Neutro', 'Ypê', 'Limpeza', 'Almoxarifado — Prateleira C1',
   'Galão 5 litros', 'GL', 4, 12, TRUE, NOW(), NOW()),

  ('334a2930-634b-4786-afd7-5ccc0e738f31',
   'Álcool 70%', 'Rioquímica', 'Limpeza', 'Almoxarifado — Prateleira C2',
   'Frasco 1 litro', 'LT', 10, 18, TRUE, NOW(), NOW()),

  ('cfa14433-76d9-4457-b13a-4bad69cb792a',
   'Pasta AZ Lombada Larga', 'Dello', 'Papelaria', 'Almoxarifado — Prateleira A3',
   'Tamanho ofício, lombada larga', 'UN', 5, 14, TRUE, NOW(), NOW()),

  ('1aa9cc0e-5ba7-4a24-921c-5a86a78cd247',
   'Pilha Alcalina AA', 'Duracell', 'Informática', 'Almoxarifado — Prateleira B2',
   'Caixa com 24 unidades', 'CX', 8, 2, TRUE, NOW(), NOW()),

  ('455df34b-ad34-4742-986b-df4bb1eaf841',
   'Fita Adesiva Larga', 'Scotch', 'Papelaria', 'Almoxarifado — Prateleira A4',
   'Rolo 48mm x 50m', 'UN', 5, 0, TRUE, NOW(), NOW()),

  ('8dd17d92-fd51-48b0-8bee-750c28db2b1d',
   'Sabonete Líquido', 'Dove', 'Higiene', 'Almoxarifado — Prateleira C3',
   'Refil 400ml', 'UN', 12, 3, TRUE, NOW(), NOW());


INSERT INTO inventory_movements (id, item_id, type, quantity, responsible, date, sector, observations, supplier_name, unit_value, total_value, created_at)
VALUES
  ('89294c54-ee7b-4c43-9459-dca567c3a773',
   '2df4961d-99c2-4c3d-924f-e304f0e42443',
   'ENTRADA', 20, 'Administrador', '2025-01-15', 'Almoxarifado',
   'Recebimento conforme pedido de compra nº 001/2025.',
   'Suprimentos Total Ltda', 28.50, 570.00, NOW()),

  ('bf8464c2-6889-483d-b305-753d699258c7',
   '0fed70ee-423c-44e5-87f9-d57b9c76290e',
   'ENTRADA', 6, 'Administrador', '2025-02-03', 'Almoxarifado',
   'Reposição de toner para impressoras HP do parque de TI.',
   'Tech Solutions Ltda', 185.00, 1110.00, NOW()),

  ('1b8832fc-45f9-4148-83e4-b744e632dbcd',
   'b5254ff4-8eef-4e82-a4fe-0b08f789e2bd',
   'ENTRADA', 12, 'Administrador', '2025-02-10', 'Almoxarifado',
   'Compra semestral de insumos de limpeza.',
   'Suprimentos Total Ltda', 22.00, 264.00, NOW()),

  ('f92cf0be-2412-4f09-b385-c4033972c8d6',
   '334a2930-634b-4786-afd7-5ccc0e738f31',
   'ENTRADA', 30, 'Administrador', '2025-02-10', 'Almoxarifado',
   'Compra semestral de insumos de limpeza.',
   'Suprimentos Total Ltda', 8.90, 267.00, NOW()),

  ('82e5d7d0-cfb9-476a-9a17-6f116d5ed9cf',
   '2df4961d-99c2-4c3d-924f-e304f0e42443',
   'SAIDA', 2, 'Administrador', '2025-03-05', 'RH',
   'Distribuição para o setor de RH.',
   NULL, NULL, NULL, NOW()),

  ('f11417a7-386e-4ac0-ad32-f2951001a42e',
   'cc23fe03-f165-44ac-83f0-885a6ffc540b',
   'SAIDA', 1, 'Administrador', '2025-03-05', 'Financeiro',
   'Distribuição para o setor Financeiro.',
   NULL, NULL, NULL, NOW()),

  ('c7081459-b616-4fc3-a147-c49ad7a4af35',
   '0fed70ee-423c-44e5-87f9-d57b9c76290e',
   'ENTRADA', 6, 'Administrador', '2025-06-01', 'Almoxarifado',
   'Reposição de estoque — pedido de compra nº 014/2025.',
   'Tech Solutions Ltda', 185.00, 1110.00, NOW()),

  ('d5c448a2-bed1-4ad3-acfc-f8bbbce718a5',
   '0fed70ee-423c-44e5-87f9-d57b9c76290e',
   'SAIDA', 2, 'Administrador', '2025-06-10', 'TI',
   'Substituição de toner nas impressoras do setor de TI.',
   NULL, NULL, NULL, NOW()),

  ('947713d6-1fb9-4094-84b3-a3392c017da6',
   '334a2930-634b-4786-afd7-5ccc0e738f31',
   'SAIDA', 6, 'Administrador', '2025-04-15', 'Manutenção',
   'Reposição mensal para higienização de equipamentos.',
   NULL, NULL, NULL, NOW()),

  ('ea2b6006-5452-4be9-967d-e88a7028d5b4',
   '1aa9cc0e-5ba7-4a24-921c-5a86a78cd247',
   'ENTRADA', 12, 'Administrador', '2025-07-10', 'Almoxarifado',
   'Compra de pilhas para controles e dispositivos sem fio.',
   'Suprimentos Total Ltda', 38.00, 456.00, NOW()),

  ('94fcc8a9-cbb2-418a-9d39-9c8c1032f874',
   '1aa9cc0e-5ba7-4a24-921c-5a86a78cd247',
   'SAIDA', 5, 'Administrador', '2025-08-20', 'TI',
   'Distribuição para teclados e mouses sem fio do setor de TI.',
   NULL, NULL, NULL, NOW()),

  ('32131a2f-d181-43a4-a767-e0e6dda92c9f',
   '8dd17d92-fd51-48b0-8bee-750c28db2b1d',
   'ENTRADA', 20, 'Administrador', '2025-09-05', 'Almoxarifado',
   'Compra trimestral de higiene pessoal.',
   'Suprimentos Total Ltda', 6.50, 130.00, NOW()),

  ('cd7b2633-1a29-4fa0-a7de-e7d6868b4255',
   '8dd17d92-fd51-48b0-8bee-750c28db2b1d',
   'SAIDA', 8, 'Administrador', '2025-10-12', 'RH',
   'Distribuição para banheiros dos setores.',
   NULL, NULL, NULL, NOW()),

  ('85503288-f9f3-4066-a93f-bf0e44349f5a',
   'cfa14433-76d9-4457-b13a-4bad69cb792a',
   'ENTRADA', 10, 'Administrador', '2025-11-03', 'Almoxarifado',
   'Reposição de pastas para arquivo anual.',
   'Suprimentos Total Ltda', 14.90, 149.00, NOW()),

  ('6755e4e8-3d6b-4193-b027-b6d7ddc6cc9c',
   'cfa14433-76d9-4457-b13a-4bad69cb792a',
   'SAIDA', 4, 'Administrador', '2025-11-20', 'Financeiro',
   'Arquivamento de documentos contábeis do exercício.',
   NULL, NULL, NULL, NOW()),

  ('e1ecd246-f2c6-4d5e-a51f-d2ec71e53681',
   '2df4961d-99c2-4c3d-924f-e304f0e42443',
   'ENTRADA', 15, 'Administrador', '2025-12-02', 'Almoxarifado',
   'Reposição de final de ano — pedido nº 031/2025.',
   'Suprimentos Total Ltda', 28.50, 427.50, NOW()),

  ('a7e17eff-458b-45d2-87ee-f25e40833f5d',
   '334a2930-634b-4786-afd7-5ccc0e738f31',
   'ENTRADA', 24, 'Administrador', '2025-12-05', 'Almoxarifado',
   'Compra semestral de álcool para higienização.',
   'Suprimentos Total Ltda', 8.90, 213.60, NOW()),

  ('31580feb-0440-4fcc-8209-14397d844e8c',
   'cc23fe03-f165-44ac-83f0-885a6ffc540b',
   'ENTRADA', 8, 'Administrador', '2026-01-08', 'Almoxarifado',
   'Reposição anual de canetas — pedido nº 001/2026.',
   'Suprimentos Total Ltda', 52.00, 416.00, NOW()),

  ('bb389b93-a39b-4ccd-a5af-71d0352e8e9a',
   '2df4961d-99c2-4c3d-924f-e304f0e42443',
   'SAIDA', 3, 'Administrador', '2026-01-15', 'RH',
   'Distribuição mensal para o setor de RH.',
   NULL, NULL, NULL, NOW()),

  ('f4e675e4-ff09-4d2b-84ed-4d9b0fb8a87b',
   'b5254ff4-8eef-4e82-a4fe-0b08f789e2bd',
   'ENTRADA', 10, 'Administrador', '2026-01-20', 'Almoxarifado',
   'Compra semestral de detergente — pedido nº 003/2026.',
   'Suprimentos Total Ltda', 22.00, 220.00, NOW()),

  ('fe2ed93c-433d-4d90-81f5-1a785907e987',
   '334a2930-634b-4786-afd7-5ccc0e738f31',
   'SAIDA', 5, 'Administrador', '2026-02-05', 'Manutenção',
   'Higienização dos equipamentos do laboratório.',
   NULL, NULL, NULL, NOW()),

  ('112c1836-53eb-4d61-90f5-c5d692b464b9',
   '0fed70ee-423c-44e5-87f9-d57b9c76290e',
   'ENTRADA', 4, 'Administrador', '2026-02-12', 'Almoxarifado',
   'Reposição de toner — pedido nº 005/2026.',
   'Tech Solutions Ltda', 185.00, 740.00, NOW()),

  ('466c5a02-386b-4c4a-a6bf-e1d858d49d9b',
   'cc23fe03-f165-44ac-83f0-885a6ffc540b',
   'SAIDA', 2, 'Administrador', '2026-02-18', 'Diretoria',
   'Distribuição para sala da Diretoria.',
   NULL, NULL, NULL, NOW()),

  ('5b7ea716-ac39-4b93-892b-3c5e38b6b997',
   '2df4961d-99c2-4c3d-924f-e304f0e42443',
   'SAIDA', 2, 'Administrador', '2026-03-04', 'TI',
   'Distribuição para o setor de TI.',
   NULL, NULL, NULL, NOW()),

  ('f10bb585-9b67-45e0-8a93-119b7f10f416',
   'cfa14433-76d9-4457-b13a-4bad69cb792a',
   'ENTRADA', 8, 'Administrador', '2026-03-10', 'Almoxarifado',
   'Reposição de pastas para o primeiro semestre.',
   'Suprimentos Total Ltda', 14.90, 119.20, NOW()),

  ('72534459-3344-4776-ab75-b90a16976f16',
   'b5254ff4-8eef-4e82-a4fe-0b08f789e2bd',
   'SAIDA', 3, 'Administrador', '2026-03-20', 'Limpeza',
   'Reposição mensal para equipe de limpeza.',
   NULL, NULL, NULL, NOW()),

  ('2a6e6c08-5924-4873-9a15-7017b24f46bb',
   '334a2930-634b-4786-afd7-5ccc0e738f31',
   'ENTRADA', 20, 'Administrador', '2026-04-02', 'Almoxarifado',
   'Compra semestral de álcool — pedido nº 009/2026.',
   'Suprimentos Total Ltda', 8.90, 178.00, NOW()),

  ('4aa0d8ce-53e7-4728-90bc-5d42efde0ede',
   '0fed70ee-423c-44e5-87f9-d57b9c76290e',
   'SAIDA', 2, 'Administrador', '2026-04-14', 'TI',
   'Substituição de toner na impressora do setor.',
   NULL, NULL, NULL, NOW()),

  ('e5f28732-51ca-40ba-b31b-b7a50abdfc9b',
   '2df4961d-99c2-4c3d-924f-e304f0e42443',
   'ENTRADA', 12, 'Administrador', '2026-04-22', 'Almoxarifado',
   'Reposição de papel sulfite — pedido nº 010/2026.',
   'Suprimentos Total Ltda', 28.50, 342.00, NOW()),

  ('5b8dad05-dcfd-4772-818a-aaa717f2e84c',
   'cfa14433-76d9-4457-b13a-4bad69cb792a',
   'SAIDA', 3, 'Administrador', '2026-05-06', 'Financeiro',
   'Arquivamento de documentos fiscais.',
   NULL, NULL, NULL, NOW()),

  ('e0b83a49-82a9-482e-b18a-6cb908ce7169',
   'cc23fe03-f165-44ac-83f0-885a6ffc540b',
   'ENTRADA', 5, 'Administrador', '2026-05-14', 'Almoxarifado',
   'Reposição de canetas para o segundo trimestre.',
   'Suprimentos Total Ltda', 52.00, 260.00, NOW()),

  ('d11420b3-33a0-4159-a171-78a9ccff97c8',
   '334a2930-634b-4786-afd7-5ccc0e738f31',
   'SAIDA', 4, 'Administrador', '2026-05-22', 'Manutenção',
   'Higienização mensal de equipamentos.',
   NULL, NULL, NULL, NOW()),

  ('8b0df73b-a7b9-4713-a62a-d6bfa02ff733',
   'b5254ff4-8eef-4e82-a4fe-0b08f789e2bd',
   'ENTRADA', 8, 'Administrador', '2026-06-03', 'Almoxarifado',
   'Reposição de detergente — pedido nº 014/2026.',
   'Suprimentos Total Ltda', 22.00, 176.00, NOW()),

  ('ec2fea8a-68e2-4972-8339-2445cd41e8f8',
   '2df4961d-99c2-4c3d-924f-e304f0e42443',
   'SAIDA', 2, 'Administrador', '2026-06-05', 'Secretaria',
   'Distribuição para a Secretaria.',
   NULL, NULL, NULL, NOW()),

  ('6ea6f4d1-c340-4073-bce6-32d28c8abfa3',
   '0fed70ee-423c-44e5-87f9-d57b9c76290e',
   'SAIDA', 2, 'Administrador', '2026-06-10', 'RH',
   'Substituição de toner na impressora multifuncional de RH.',
   NULL, NULL, NULL, NOW());
