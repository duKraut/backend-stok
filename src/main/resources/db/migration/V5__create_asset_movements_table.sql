CREATE TABLE asset_movements (
    id UUID PRIMARY KEY,
    asset_id UUID NOT NULL,
    type VARCHAR(30) NOT NULL
        CHECK (type IN ('TRANSFERENCIA', 'MANUTENCAO', 'BAIXA')),
    from_department VARCHAR(100) NOT NULL,
    to_department VARCHAR(100),
    responsible VARCHAR(150) NOT NULL,
    date DATE NOT NULL,
    observations TEXT,
    service_order VARCHAR(100),
    maintenance_type VARCHAR(30)
        CHECK (maintenance_type IN ('PREVENTIVA', 'CORRETIVA', 'PREDITIVA')),
    service_provider VARCHAR(150),
    send_date DATE,
    expected_return_date DATE,
    estimated_cost NUMERIC(15,2),
    final_cost NUMERIC(15,2),
    problem_description TEXT,
    decommission_reason VARCHAR(255),
    decommission_term VARCHAR(100),
    alienation_value NUMERIC(15,2),
    technical_opinion VARCHAR(255),
    final_destination VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_movements_asset
        FOREIGN KEY (asset_id) REFERENCES assets(id)
);
