package com.alfagift.models.entities;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "tb_master_user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "Nama harus di isi")
    @Column(nullable = false)
    private String nama;

    @NotEmpty(message = "Jenis kelamin harus di isi")
    @Column(name = "jenis_kelamin", nullable = false)
    private String jenisKelamin;

    @NotNull(message = "Tanggal lahir harus di isi")
    @Column(name = "tgl_lahir")
    private LocalDate tglLahir;

    @NotEmpty(message = "Alamat harus di isi")
    private String alamat;

    @NotEmpty(message = "Email harus di isi")
    @Email(message = "Email tidak valid")
    @Column(nullable = false, unique = true)
    private String email;

    @ManyToOne
    @NotNull(message = "Role harus di isi")
    @JoinColumn(name = "role_id", nullable = false)
    private UserRoles userRole;

    public User() {

    }

    // Constructors, getters, setters
    public User(Long id, String nama, String jenisKelamin, LocalDate tglLahir, String alamat, String email,
            UserRoles userRole) {
        this.id = id;
        this.nama = nama;
        this.jenisKelamin = jenisKelamin;
        this.tglLahir = tglLahir;
        this.alamat = alamat;
        this.email = email;
        this.userRole = userRole;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getJenisKelamin() {
        return jenisKelamin;
    }

    public void setJenisKelamin(String jenisKelamin) {
        this.jenisKelamin = jenisKelamin;
    }

    public LocalDate getTglLahir() {
        return tglLahir;
    }

    public void setTglLahir(LocalDate tglLahir) {
        this.tglLahir = tglLahir;
    }

    public String getAlamat() {
        return alamat;
    }

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public UserRoles getUserRole() {
        return userRole;
    }

    public void setUserRole(UserRoles userRole) {
        this.userRole = userRole;
    }
}