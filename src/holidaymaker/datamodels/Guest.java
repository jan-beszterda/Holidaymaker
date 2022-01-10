package holidaymaker.datamodels;

/**
 * Guest class provides data model for guests' information
 * @author Jan Beszterda
 */
public class Guest {

    private int id;
    private int bookingId;
    private String firstName;
    private String lastName;
    private String phoneNumber;
    private String emailAddress;
    private String dateOfBirth;

    public Guest() {
    }

    public Guest(int bookingId, String firstName, String lastName, String phoneNumber, String emailAddress, String dateOfBirth) {
        this.bookingId = bookingId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phoneNumber = phoneNumber;
        this.emailAddress = emailAddress;
        this.dateOfBirth = dateOfBirth;
    }

    public Guest(int id, int bookingId, String firstName, String lastName, String phoneNumber, String emailAddress, String dateOfBirth) {
        this.id = id;
        this.bookingId = bookingId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phoneNumber = phoneNumber;
        this.emailAddress = emailAddress;
        this.dateOfBirth = dateOfBirth;
    }

    @Override
    public String toString() {
        return "Id: " + id +
                ", Booking Id: " + bookingId +
                ", First name: " + firstName +
                ", Last name: " + lastName +
                ", Date of birth: " + dateOfBirth +
                ", Phone number: " + phoneNumber +
                ", Email address: " + emailAddress;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
}
