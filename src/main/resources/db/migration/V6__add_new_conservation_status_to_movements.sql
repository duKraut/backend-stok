ALTER TABLE asset_movements
    ADD COLUMN new_conservation_status VARCHAR(30)
        CHECK (new_conservation_status IN ('EXCELENTE', 'BOM', 'REGULAR'));
