package com.stok.assetmovement;

import com.stok.asset.Asset;
import com.stok.asset.ConservationStatus;
import io.quarkus.hibernate.orm.panache.PanacheEntityBase;
import jakarta.persistence.*;
import org.hibernate.annotations.Generated;
import org.hibernate.generator.EventType;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "asset_movements")
public class AssetMovement extends PanacheEntityBase {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    public UUID id;

    @Generated(event = EventType.INSERT)
    @Column(nullable = false, unique = true, insertable = false, updatable = false)
    public long codigo;

    @ManyToOne
    @JoinColumn(name = "asset_id", nullable = false)
    public Asset asset;

    @Enumerated(EnumType.STRING)
    @Column(name = "type", nullable = false)
    public MovementType type;

    @Column(name = "from_department", nullable = false)
    public String fromDepartment;

    @Column(name = "to_department")
    public String toDepartment;

    @Column(nullable = false)
    public String responsible;

    @Column(nullable = false)
    public LocalDate date;

    public String observations;

    @Column(name = "service_order")
    public String serviceOrder;

    @Enumerated(EnumType.STRING)
    @Column(name = "maintenance_type")
    public MaintenanceType maintenanceType;

    @Column(name = "service_provider")
    public String serviceProvider;

    @Column(name = "send_date")
    public LocalDate sendDate;

    @Column(name = "expected_return_date")
    public LocalDate expectedReturnDate;

    @Column(name = "estimated_cost")
    public BigDecimal estimatedCost;

    @Column(name = "final_cost")
    public BigDecimal finalCost;

    @Column(name = "problem_description")
    public String problemDescription;

    @Column(name = "decommission_reason")
    public String decommissionReason;

    @Column(name = "decommission_term")
    public String decommissionTerm;

    @Column(name = "alienation_value")
    public BigDecimal alienationValue;

    @Column(name = "technical_opinion")
    public String technicalOpinion;

    @Column(name = "final_destination")
    public String finalDestination;

    @Column(nullable = false)
    public Boolean decommission = false;

    @Enumerated(EnumType.STRING)
    @Column(name = "new_conservation_status")
    public ConservationStatus newConservationStatus;

    @Column(name = "created_at", nullable = false, updatable = false)
    public LocalDateTime createdAt;

    @PrePersist
    public void prePersist() {
        createdAt = LocalDateTime.now();
    }
}
