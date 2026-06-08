CREATE TABLE inventory (
    id UUID PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    codigo BIGSERIAL NOT NULL UNIQUE,
    brand VARCHAR(100),
    category VARCHAR(100) NOT NULL,
    location VARCHAR(255),
    description TEXT,
    unit VARCHAR(10) NOT NULL
        CHECK (unit IN ('UN', 'CX', 'PCT', 'KG', 'LT', 'RL', 'M', 'M2', 'PAR', 'FD', 'GL', 'SC')),
    min_stock INTEGER NOT NULL DEFAULT 0,
    current_stock INTEGER NOT NULL DEFAULT 0,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
