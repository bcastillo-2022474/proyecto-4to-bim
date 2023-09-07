package modelo;

public class Venta {
     //Atributos
    private int codigoVenta;
    private int item;
    private int codigoCliente;
    private int codigoEmpleado;
    private int codigoProducto;
    private String numeroSerie;
    private String descripcionProd;
    private String fecha;
    private Double precio;
    private int cantidad;
    private Double monto;
    private String estado;
    private double subTotal;



    public Venta() {}

    public Venta(int codigoVenta, int item, int codigoCliente, int codigoEmpleado, int codigoProducto, String numeroSerie, String descripcionProd, String fecha, Double precio, int cantidad, Double subTotal, Double monto, String estado) {
        this.codigoVenta = codigoVenta;
        this.item = item;
        this.codigoCliente = codigoCliente;
        this.codigoEmpleado = codigoEmpleado;
        this.codigoProducto = codigoProducto;
        this.numeroSerie = numeroSerie;
        this.descripcionProd = descripcionProd;
        this.fecha = fecha;
        this.precio = precio;
        this.cantidad = cantidad;
        this.subTotal = subTotal;
        this.monto = monto;
        this.estado = estado;
    }

    public int getCodigoVenta() {
        return codigoVenta;
    }

    public void setCodigoVenta(int codigoVente) {
        this.codigoVenta = codigoVente;
    }

    public int getItem() {
        return item;
    }

    public void setItem(int item) {
        this.item = item;
    }

    public int getCodigoCliente() {
        return codigoCliente;
    }

    public void setCodigoCliente(int codigoCliente) {
        this.codigoCliente = codigoCliente;
    }

    public int getCodigoEmpleado() {
        return codigoEmpleado;
    }

    public void setCodigoEmpleado(int codigoEmpleado) {
        this.codigoEmpleado = codigoEmpleado;
    }

    public int getCodigoProducto() {
        return codigoProducto;
    }

    public void setCodigoProducto(int codigoProducto) {
        this.codigoProducto = codigoProducto;
    }

    public String getNumeroSerie() {
        return numeroSerie;
    }

    public void setNumeroSerie(String numeroSerie) {
        this.numeroSerie = numeroSerie;
    }

    public String getDescripcionProd() {
        return descripcionProd;
    }

    public void setDescripcionProd(String descripcionProd) {
        this.descripcionProd = descripcionProd;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Double getMonto() {
        return monto;
    }

    public void setMonto(Double monto) {
        this.monto = monto;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(Double subTotal) {
        this.subTotal = subTotal;
    }
}
