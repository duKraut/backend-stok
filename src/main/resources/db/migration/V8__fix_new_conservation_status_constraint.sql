ALTER TABLE asset_movements DROP CONSTRAINT IF EXISTS asset_movements_new_conservation_status_check;

ALTER TABLE asset_movements
    ADD CONSTRAINT asset_movements_new_conservation_status_check
        CHECK (new_conservation_status IN ('EXCELENTE', 'BOM', 'REGULAR', 'SUBSTITUIR'));
