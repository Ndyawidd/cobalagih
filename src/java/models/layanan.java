/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Lenovo
 */
public class layanan extends Model implements Notification{
    private int id;
    private String name;
    private String deskripsi;
    private double price;
    private int durasi;

    public layanan() {
        // (#1.2) Sesuaikan nilai table dan primaryKey
        this.table = "layanans";
        this.primaryKey = "id";
    }
    
    public layanan(int id, String name, double price, String deskripsi, int durasi) {
        // (#1.3) Sesuaikan nilai table dan primaryKey serta konstruktor dari parameter yang telah diberikan
        this.table = "layanans";
        this.primaryKey = "id";
        this.id = id;
        this.deskripsi = deskripsi;
        this.name = name;
        this.price = price;
        this.durasi = durasi;
    }

    @Override
    public layanan toModel(ResultSet rs) {
        try {
            return new layanan(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getDouble("price"),
                rs.getString("deskripsi"),
                rs.getInt("durasi")
            );
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        }
}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDeskripsi() {
        return deskripsi;
    }

    public void setDeskripsi(String deskripsi) {
        this.deskripsi = deskripsi;
    }

    public int getDurasi() {
        return durasi;
    }

    public void setDurasi(int durasi) {
        this.durasi = durasi;
    }

    @Override
    public void getNotification() {
        System.out.println("Layanan '" + this.name +"' telah berhasil diproses");
    }
    
}
