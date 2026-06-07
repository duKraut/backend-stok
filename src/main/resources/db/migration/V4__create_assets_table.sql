CREATE TABLE assets (
    id UUID PRIMARY KEY,
    tombamento BIGSERIAL NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    specs TEXT,
    brand VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    serial_number VARCHAR(100),
    category VARCHAR(100) NOT NULL,
    conservation_status VARCHAR(30) NOT NULL
        CHECK (
            conservation_status IN (
                'EXCELENTE',
                'BOM',
                'REGULAR',
                'MANUTENCAO',
                'SUBSTITUIR'
            )
        ),
    department VARCHAR(100) NOT NULL,
    location VARCHAR(255),
    responsible VARCHAR(150),
    acquisition_date DATE NOT NULL,
    acquisition_value NUMERIC(15,2) NOT NULL,
    supplier_id UUID,
    nf_number VARCHAR(100),
    nf_emission_date DATE,
    nf_access_key VARCHAR(44),
    warranty_until DATE,
    useful_life_years INTEGER,
    depreciation_rate NUMERIC(5,2),
    residual_value NUMERIC(15,2),
    depreciation_method VARCHAR(50)
        CHECK (
            depreciation_method IN (
                'LINEAR',
                'SOMA_DIGITOS',
                'UNIDADES_PRODUZIDAS'
            )
        ),
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_assets_supplier
        FOREIGN KEY (supplier_id)
        REFERENCES suppliers(id)
);