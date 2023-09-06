package modelo;

import java.sql.Date;

public class Sale {
    // Attributes
    private int id;
    private int serialNumber;
    private Date dateSale;
    private double total;
    private int _idClient;
    private int _idEmployee;

    // Constructors
    public Sale() {
    }
    public Sale(int id, int serialNumber, Date dateSale, double total, int _idClient, int _idEmployee) {
        this.id = id;
        this.serialNumber = serialNumber;
        this.dateSale = dateSale;
        this.total = total;
        this._idClient = _idClient;
        this._idEmployee = _idEmployee;
    }

    // Getters
    public int getId() {
        return id;
    }

    public int getSerialNumber() {
        return serialNumber;
    }

    public Date getDateSale() {
        return dateSale;
    }

    public double getTotal() {
        return total;
    }

    public int get_idClient() {
        return _idClient;
    }

    public int get_idEmployee() {
        return _idEmployee;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setSerialNumber(int serialNumber) {
        this.serialNumber = serialNumber;
    }

    public void setDateSale(Date dateSale) {
        this.dateSale = dateSale;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public void set_idClient(int _idClient) {
        this._idClient = _idClient;
    }

    public void set_idEmployee(int _idEmployee) {
        this._idEmployee = _idEmployee;
    }
}
