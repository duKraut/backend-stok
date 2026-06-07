ALTER TABLE asset_movements
    DROP CONSTRAINT IF EXISTS asset_movements_type_check;

ALTER TABLE asset_movements
    ADD CONSTRAINT asset_movements_type_check
        CHECK (type IN ('TRANSFERENCIA', 'MANUTENCAO', 'ESTADO'));

ALTER TABLE asset_movements
    ADD COLUMN IF NOT EXISTS decommission BOOLEAN NOT NULL DEFAULT FALSE;
