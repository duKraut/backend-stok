package com.stok.supplier;

import io.quarkus.hibernate.orm.panache.PanacheEntityBase;
import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "suppliers")
public class Supplier extends PanacheEntityBase {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    public UUID id;

    @Column(nullable = false, unique = true)
    public Long code;

    @Column(nullable = false)
    public String name;

    @Column(nullable = false, unique = true)
    public String document;

    public String category;

    @Column(name = "person_type", nullable = false)
    public String personType;

    @Column(name = "contact_name")
    public String contactName;

    public String email;

    public String phone;

    public String address;

    @Column(name = "zip_code")
    public String zipCode;

    public String city;

    public String neighborhood;

    public Boolean active = true;

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