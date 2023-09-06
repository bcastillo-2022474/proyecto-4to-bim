package modelo;

public class Client {
    // Attributes
    private int id;
    private String DPI;
    private String names;
    private String address;

    // Constructor
    public Client() {
    }

    public Client(int id, String DPI, String names, String address) {
        this.id = id;
        this.DPI = DPI;
        this.names = names;
        this.address = address;
    }

    // Getters
    public int getId() {
        return id;
    }

    public String getDPI() {
        return DPI;
    }

    public String getNames() {
        return names;
    }

    public String getAddress() {
        return address;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setDPI(String DPI) {
        this.DPI = DPI;
    }

    public void setNames(String names) {
        this.names = names;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
