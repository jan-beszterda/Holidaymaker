package holidaymaker.datamodels;

/**
 * Booking class provides data model for booking information
 * @author Jan Beszterda
 */
public class Booking {

    private int id;
    private int customerId;
    private String timestamp;

    public Booking(int id, int customerId, String timestamp) {
        this.id = id;
        this.customerId = customerId;
        this.timestamp = timestamp;
    }

    public int getId() {
        return id;
    }

    public int getCustomerId() {
        return customerId;
    }

    public String getTimestamp() {
        return timestamp;
    }
}
