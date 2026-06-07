package com.stok.asset;

import com.stok.supplier.Supplier;
import io.quarkus.hibernate.orm.panache.PanacheEntityBase;
import jakarta.persistence.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "assets")
public class Asset extends PanacheEntityBase {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    public UUID id;

    @Column(nullable = false, unique = true)
    public long tombamento;

    @Column(nullable = false)
    public String name;

    public String specs;

    @Column(nullable = false)
    public String brand;

    @Column(nullable = false)
    public String model;

    @Column(name = "serial_number")
    public String serialNumber;

    @Column(nullable = false)
    public String category;

    @Enumerated(EnumType.STRING)
    @Column(name = "conservation_status", nullable = false)
    public ConservationStatus conservationStatus;

    @Column(nullable = false)
    public String department;

    public String location;

    public String responsible;

    @Column(name = "acquisition_date", nullable = false)
    public LocalDate acquisitionDate;

    @Column(name = "acquisition_value", nullable = false)
    public BigDecimal acquisitionValue;

    @ManyToOne
    @JoinColumn(name = "supplier_id")
    public Supplier supplier;

    @Column(name = "nf_number")
    public String nfNumber;

    @Column(name = "nf_emission_date")
    public LocalDate nfEmissionDate;

    @Column(name = "nf_access_key")
    public String nfAccessKey;

    @Column(name = "warranty_until")
    public LocalDate warrantyUntil;

    @Column(name = "useful_life_years")
    public Integer usefulLifeYears;

    @Column(name = "depreciation_rate")
    public BigDecimal depreciationRate;

    @Column(name = "residual_value")
    public BigDecimal residualValue;

    @Enumerated(EnumType.STRING)
    @Column(name = "depreciation_method")
    public DepreciationMethod depreciationMethod;

    @Column(nullable = false)
    public Boolean active;

    @Column(name = "created_at", nullable = false, updatable = false)
    public LocalDateTime createdAt;

    @Column(name = "updated_at", nullable = false)
    public LocalDateTime updatedAt;

    @PrePersist
    public void prePersist() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();

        if (active == null) {
            active = true;
        }
    }

    @PreUpdate
    public void preUpdate() {
        updatedAt = LocalDateTime.now();
    }
}
