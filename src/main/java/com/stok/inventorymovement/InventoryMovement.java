package com.stok.inventorymovement;

import com.stok.inventory.Inventory;
import io.quarkus.hibernate.orm.panache.PanacheEntityBase;
import jakarta.persistence.*;
import org.hibernate.annotations.Generated;
import org.hibernate.generator.EventType;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "inventory_movements")
public class InventoryMovement extends PanacheEntityBase {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    public UUID id;

    @Generated(event = EventType.INSERT)
    @Column(nullable = false, unique = true, insertable = false, updatable = false)
    public long codigo;

    @ManyToOne
    @JoinColumn(name = "item_id", nullable = false)
    public Inventory item;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    public MovementType type;

    @Column(nullable = false)
    public int quantity;

    @Column(nullable = false)
    public String responsible;

    @Column(nullable = false)
    public LocalDate date;

    public String sector;

    @Column(columnDefinition = "TEXT")
    public String observations;

    @Column(name = "nf_number")
    public String nfNumber;

    @Column(name = "nf_emission_date")
    public LocalDate nfEmissionDate;

    @Column(name = "nf_access_key")
    public String nfAccessKey;

    @Column(name = "supplier_name")
    public String supplierName;

    @Column(name = "unit_value")
    public BigDecimal unitValue;

    @Column(name = "total_value")
    public BigDecimal totalValue;

    @Column(name = "created_at", nullable = false, updatable = false)
    public LocalDateTime createdAt;

    @PrePersist
    public void prePersist() {
        createdAt = LocalDateTime.now();
    }
}
