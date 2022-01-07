package holidaymaker.utilities;

import holidaymaker.datamodels.Customer;
import holidaymaker.datamodels.Hotel;
import holidaymaker.datamodels.Room;
import holidaymaker.datamodels.SearchResult;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;

public class DatabaseWorker {

    private Connection connection = null;

    public void connect() throws SQLException {
        connection = DriverManager.getConnection("jdbc:sqlite:Holidaymaker.db");
    }

    public void disconnect() throws SQLException {
        if (connection != null) {
            connection.close();
        }
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

    public SearchResult searchForRooms(int numberOfBeds, String startDate, String endDate, boolean pool, boolean restaurant, boolean childrenClub, boolean entertainment) {
        ArrayList<Room> rooms = new ArrayList<>();
        ArrayList<Hotel> hotels = new ArrayList<>();
        ArrayList<String> columns = new ArrayList<>();
        String roomQuery = "SELECT Room.Id AS 'Room Id', Room.Name AS 'Room Type', Room.Number_of_beds AS 'Number of beds', " +
                "Room.Hotel_Id, Room.Number AS 'Room number', Hotel.Id AS 'Hotel Id', Hotel.Name AS 'Hotel Name', " +
                "Hotel.Address AS 'Hotel Address', Hotel.Pool AS Pool, Hotel.Restaurant AS Restaurant, Hotel.Children_club AS 'Children Club', " +
                "Hotel.Entertainment AS Entertainment FROM Room " +
                "INNER JOIN Hotel ON Room.Hotel_Id = Hotel.Id " +
                "WHERE Room.Number_of_beds = ? AND Room.Id NOT IN " +
                "(SELECT Room.Id FROM Booking_details WHERE Start_date < ? AND End_date > ?)";
        if (pool) {
            roomQuery += " AND Hotel.Pool = 'Yes'";
        }
        if (restaurant) {
            roomQuery += " AND Hotel.Restaurant = 'Yes'";
        }
        if (childrenClub) {
            roomQuery += " AND Hotel.Children_club = 'Yes'";
        }
        if (entertainment) {
            roomQuery += " AND Hotel.Entertainment = 'Yes'";
        }
        try {
            PreparedStatement statement = connection.prepareStatement(roomQuery);
            statement.setInt(1, numberOfBeds);
            statement.setString(2, endDate);
            statement.setString(3, startDate);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                ResultSetMetaData metaData = resultSet.getMetaData();
                for (int i = 1; i <= metaData.getColumnCount(); i++) {
                    columns.add(metaData.getColumnName(i));
                }
                rooms.add(new Room(resultSet.getInt(1), resultSet.getString(2), resultSet.getInt(3),
                        resultSet.getInt(4), resultSet.getInt(5)));
                hotels.add(new Hotel(resultSet.getInt(6), resultSet.getString(7), resultSet.getString(8),
                        resultSet.getString(9), resultSet.getString(10), resultSet.getString(11), resultSet.getString(12)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return new SearchResult(rooms, hotels, columns);
    }

    public void bookRooms(int customerId, HashMap<Integer, Integer> selectedRooms, String startDate, String endDate) {
        int bookingId = 0;
        String query = "INSERT INTO Booking (Customer_Id, Timestamp) VALUES(?, ?)";
        Calendar c = Calendar.getInstance(TimeZone.getTimeZone("UTC"));
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setCalendar(c);
        String timestamp = dateFormat.format(c.getTime());
        try{
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, customerId);
            statement.setString(2, timestamp);
            statement.executeUpdate();
            ResultSet keys = statement.getGeneratedKeys();
            while (keys.next()){
                bookingId = keys.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        query = "INSERT INTO Booking_details (Booking_Id, Hotel_Id, Room_Id, Start_date, End_date) VALUES(?, ?, ?, ?, ?)";
        for (Map.Entry<Integer, Integer> entry: selectedRooms.entrySet()) {
            try {
                PreparedStatement statement = connection.prepareStatement(query);
                statement.setInt(1, bookingId);
                statement.setInt(1, entry.getValue());
                statement.setInt(1, entry.getKey());
                statement.setString(2, startDate);
                statement.setString(2, endDate);
                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
