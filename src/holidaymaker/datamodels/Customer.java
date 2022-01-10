package holidaymaker.datamodels;

/**
 * Customer class provides a data model for the customers' data
 * @author Jan Beszterda
 */
public class Customer {

    private int id;
    private String firstName;
    private String lastName;
    private String dateOfBirth;
    private String phoneNumber;
    private String emailAddress;

    public Customer() {
    }

    public Customer(String firstName, String lastName, String dateOfBirth, String phoneNumber, String emailAddress) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.dateOfBirth = dateOfBirth;
        this.phoneNumber = phoneNumber;
        this.emailAddress = emailAddress;
    }

    public Customer(int id, String firstName, String lastName, String dateOfBirth, String phoneNumber, String emailAddress) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.dateOfBirth = dateOfBirth;
        this.phoneNumber = phoneNumber;
        this.emailAddress = emailAddress;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
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

    @Override
    public String toString() {
        return "Id: " + id +
                ", First name: " + firstName +
                ", Last name: " + lastName +
                ", Date of birth: " + dateOfBirth +
                ", Phone number: " + phoneNumber +
                ", Email address: " + emailAddress;
    }
}
