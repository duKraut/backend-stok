CREATE TABLE inventory_movements (
    id UUID PRIMARY KEY,
    item_id UUID NOT NULL,
    type VARCHAR(10) NOT NULL
        CHECK (type IN ('ENTRADA', 'SAIDA')),
    quantity INTEGER NOT NULL,
    responsible VARCHAR(150) NOT NULL,
    date DATE NOT NULL,
    sector VARCHAR(255),
    observations TEXT,
    nf_number VARCHAR(100),
    nf_emission_date DATE,
    nf_access_key VARCHAR(44),
    supplier_name VARCHAR(255),
    unit_value NUMERIC(15,2),
    total_value NUMERIC(15,2),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_inventory_movements_item
        FOREIGN KEY (item_id) REFERENCES inventory(id)
);
