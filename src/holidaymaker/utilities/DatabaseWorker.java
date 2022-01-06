package holidaymaker.utilities;

import holidaymaker.datamodels.Customer;

import java.sql.*;

public class DatabaseWorker {

    private Connection connection = null;

    public void connect() throws SQLException {
        connection = DriverManager.getConnection("jdbc:sqlite:Holidaymaker.db");
    }

    public int registerCustomer(String firstName, String lastName, String dateOfBirth, String phoneNumber, String emailAddress) {
        int id = 0;
        String query = "INSERT INTO Customers(First_name, Last_name, Date_of_birth, Phone_number, Email_address)" +
                "VALUES(?, ?, ?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, firstName);
            statement.setString(2, lastName);
            statement.setString(3, dateOfBirth);
            statement.setString(4, phoneNumber);
            statement.setString(5, emailAddress);
            statement.executeUpdate();
            ResultSet keys = statement.getGeneratedKeys();
            while (keys.next()){
                id = keys.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }

    public Customer selectCustomer(int option, String... values) {
        Customer customer = null;
        switch (option) {
            case 1:
                customer = selectCustomerById(values[0]);
                break;
            case 2:
                customer = selectCustomerByFullNameAndBirthDate(values);
                break;
            case 3:
                customer = selectCustomerByPhoneNumber(values[0]);
                break;
            case 4:
                customer = selectCustomerByEmailAddress(values[0]);
                break;
        }
        return customer;
    }

    private Customer selectCustomerByPhoneNumber(String value) {
        Customer customer = null;
        String query = "SELECT * FROM Customers WHERE Phone_number = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, value);
            ResultSet resultSet = statement.executeQuery();
            while( resultSet.next() ){
                customer = new Customer(resultSet.getInt("id"), resultSet.getString("First_name"),
                        resultSet.getString("Last_name"), resultSet.getString("Date_of_birth"),
                        resultSet.getString("Phone_number"), resultSet.getString("Email_address"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    private Customer selectCustomerByEmailAddress(String value) {
        Customer customer = null;
        String query = "SELECT * FROM Customers WHERE Email_address = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, value);
            ResultSet resultSet = statement.executeQuery();
            while( resultSet.next() ){
                customer = new Customer(resultSet.getInt("id"), resultSet.getString("First_name"),
                        resultSet.getString("Last_name"), resultSet.getString("Date_of_birth"),
                        resultSet.getString("Phone_number"), resultSet.getString("Email_address"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    private Customer selectCustomerByFullNameAndBirthDate(String[] values) {
        Customer customer = null;
        String query = "SELECT * FROM Customers WHERE First_name = ? AND Last_name = ? AND Date_of_birth = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, values[0]);
            statement.setString(2, values[1]);
            statement.setString(3, values[2]);
            ResultSet resultSet = statement.executeQuery();
            while( resultSet.next() ){
                customer = new Customer(resultSet.getInt("id"), resultSet.getString("First_name"),
                        resultSet.getString("Last_name"), resultSet.getString("Date_of_birth"),
                        resultSet.getString("Phone_number"), resultSet.getString("Email_address"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    private Customer selectCustomerById(String value) {
        Customer customer = null;
        String query = "SELECT * FROM Customers WHERE Id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, Integer.parseInt(value));
            ResultSet resultSet = statement.executeQuery();
            while( resultSet.next() ){
                customer = new Customer(resultSet.getInt("id"), resultSet.getString("First_name"),
                        resultSet.getString("Last_name"), resultSet.getString("Date_of_birth"),
                        resultSet.getString("Phone_number"), resultSet.getString("Email_address"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }
}
