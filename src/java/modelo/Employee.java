package modelo;

public class Employee {
    // Attributes
    private int id;
    private String DPI;
    private String phoneNumber;
    private String names;
    private String address;
    private String username;
    private String imgPath;
    private String selfDescription;

    // Constructor
    public Employee() {
    }

    public Employee(int id, String DPI, String phoneNumber, String names, String address, String username, String imgPath, String selfDescription) {
        this.id = id;
        this.DPI = DPI;
        this.phoneNumber = phoneNumber;
        this.names = names;
        this.address = address;
        this.username = username;
        this.imgPath = imgPath;
        this.selfDescription = selfDescription;
    }

    // Getters
    public int getId() {
        return id;
    }

    public String getDPI() {
        return DPI;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getNames() {
        return names;
    }

    public String getAddress() {
        return address;
    }

    public String getUsername() {
        return username;
    }

    public String getImgPath() {
        return imgPath;
    }

    public String getSelfDescription() {
        return selfDescription;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setDPI(String DPI) {
        this.DPI = DPI;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setNames(String names) {
        this.names = names;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public void setSelfDescription(String selfDescription) {
        this.selfDescription = selfDescription;
    }
}
