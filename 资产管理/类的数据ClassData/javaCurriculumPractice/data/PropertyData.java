package javaCurriculumPractice.data;

public class PropertyData{
    private double price;
    private long number;
    private String propertyName;

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public long getNumber() {
        return number;
    }

    public void setNumber(long number) {
        this.number = number;
    }

    public String getpropertyName() {
        return propertyName;
    }

    public void setpropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    public long getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(long propertyId) {
        this.propertyId = propertyId;
    }

    private long propertyId;
}
