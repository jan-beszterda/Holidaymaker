package holidaymaker.utilities;

import holidaymaker.datamodels.*;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;


/**
 * DatabaseWorker class is responsible for interacting with the database and execute operations on the database.
 * @author Jan Beszterda
 */
public class DatabaseWorker {

    private Connection connection = null;

    /**
     * Method responsible for establishing connection with the database and enabling foreign key constraints
     * @throws SQLException exception thrown if the connection or statement execution fails
     */
    public void connect() throws SQLException {
        connection = DriverManager.getConnection("jdbc:sqlite:Holidaymaker.db");
        Statement s = connection.createStatement();
        s.executeUpdate("PRAGMA foreign_keys = ON; ");
    }

    /**
     * Method responsible for closing the connection with the database
     * @throws SQLException exception thrown if closing the connection fails
     */
    public void disconnect() throws SQLException {
        if (connection != null) {
            connection.close();
        }
    }

    /**
     * Method responsible for inserting customer's data into the database
     * @param firstName customer's first name
     * @param lastName customer's last name
     * @param dateOfBirth customer's date of birth
     * @param phoneNumber customer's phone number
     * @param emailAddress customer's email address
     * @return id number generated for the newly registered customer
     */
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

    /**
     * Entry method responsible for searching through the database for specific customer
     * @param option search option chosen by the user
     * @param values search values provided by the user
     * @return customer's data from the database as a customer object
     */
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

    /**
     * Method responsible for finding customer in the database by their phone number
     * @param value the phone number typed in by the user
     * @return customer's data from the database as a customer object
     */
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

    /**
     * Method responsible for finding customer in the database by their email address
     * @param value the email address typed in by the user
     * @return customer's data from the database as a customer object
     */
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

    /**
     * Method responsible for finding customer in the database by their first name, last name and date of birth combination
     * @param values customer's first name, last name and date of birth combination typed in by the user
     * @return customer's data from the database as a customer object
     */
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

    /**
     * Method responsible for finding customer in the database by their id number
     * @param value the id number typed in by the user
     * @return customer's data from the database as a customer object
     */
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

    /**
     * Method responsible for finding available rooms based on the conditions typed in by the user
     * @param numberOfBeds number of beds in the room
     * @param startDate check-in date
     * @param endDate check-out date
     * @param pool access to the pool (true/false)
     * @param restaurant access to the restaurant (true/false)
     * @param childrenClub access to the children club (true/false)
     * @param entertainment access to the entertainment (true/false)
     * @return object containing search results
     */
    public RoomSearchResult searchForRooms(int numberOfBeds, String startDate, String endDate, boolean pool, boolean restaurant, boolean childrenClub, boolean entertainment) {
        ArrayList<Room> rooms = new ArrayList<>();
        ArrayList<Hotel> hotels = new ArrayList<>();
        ArrayList<String> columns = new ArrayList<>();
        String roomQuery = "SELECT Room.Id AS 'Room Id', Room.Name AS 'Room Type', Room.Number_of_beds AS 'Number of beds', " +
                "Room.Hotel_Id, Room.Number AS 'Room number', Hotel.Id AS 'Hotel Id', Hotel.Name AS 'Hotel Name', " +
                "Hotel.Address AS 'Hotel Address', Hotel.Pool AS Pool, Hotel.Restaurant AS Restaurant, Hotel.Children_club AS 'Children Club', " +
                "Hotel.Entertainment AS Entertainment FROM Room " +
                "INNER JOIN Hotel ON Room.Hotel_Id = Hotel.Id " +
                "WHERE Room.Number_of_beds = ? AND Room.Id NOT IN " +
                "(SELECT Room_Id FROM Booking_details WHERE Start_date < ? AND End_date > ?)";
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
        return new RoomSearchResult(rooms, hotels, columns);
    }

    /**
     * Method responsible for creating the booking
     * @param customerId id number of the customer making the booking
     * @param selectedRooms map of room-hotel id pairs selected by the customer
     * @param startDate check-in date
     * @param endDate check-out date
     * @return booking id number
     */
    public int bookRooms(int customerId, HashMap<Integer, Integer> selectedRooms, String startDate, String endDate) {
        int bookingId = 0;
        String query = "INSERT INTO Booking (Customer_Id, Timestamp) VALUES(?, ?)";
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try{
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, customerId);
            Calendar c = Calendar.getInstance(TimeZone.getTimeZone("UTC"));
            dateFormat.setCalendar(c);
            statement.setString(2, dateFormat.format(c.getTime()));
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
                statement.setInt(2, entry.getValue());
                statement.setInt(3, entry.getKey());
                statement.setString(4, startDate);
                statement.setString(5, endDate);
                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return bookingId;
    }

    /**
     * Method responsible for inserting guests data into the database
     * @param bookingId booking id number guest belong to
     * @param firstName guest's first name
     * @param lastName guest's last name
     * @param phoneNumber guest's phone number
     * @param emailAddress guest's email address
     * @param dateOfBirth guest's date of birth
     */
    public void registerGuest(int bookingId, String firstName, String lastName, String phoneNumber, String emailAddress, String dateOfBirth) {
        String query = "INSERT INTO Guests(Booking_Id, First_name, Last_name, Phone_number, Email_address, Date_of_birth)" +
                "VALUES(?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, bookingId);
            statement.setString(2, firstName);
            statement.setString(3, lastName);
            statement.setString(4, phoneNumber);
            statement.setString(5, emailAddress);
            statement.setString(6, dateOfBirth);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * Method responsible for searching through the database for bookings made by specific customer
     * @param id customer's id number
     * @return object containing search results
     */
    public BookingSearchResult searchForBookings(int id) {
        ArrayList<Booking> bookings = new ArrayList<>();
        ArrayList<BookingDetail> bookingDetails = new ArrayList<>();
        ArrayList<String> columns = new ArrayList<>();
        String query = "SELECT Booking.Id AS 'Booking Id', Booking.Customer_Id AS'Customer Id', Timestamp, Booking_details.Id, " +
                "Booking_details.Booking_Id, Booking_details.Hotel_Id AS 'Hotel Id', Booking_details.Room_Id AS 'Room Id', " +
                "Booking_details.Start_date AS 'Start date', Booking_details.End_date AS 'End date' FROM Booking " +
                "INNER JOIN Booking_details ON Booking.Id = Booking_details.Booking_Id WHERE Booking.Customer_Id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                ResultSetMetaData metaData = resultSet.getMetaData();
                for (int i = 1; i <= metaData.getColumnCount(); i++) {
                    columns.add(metaData.getColumnName(i));
                }
                bookings.add(new Booking(resultSet.getInt(1), resultSet.getInt(2), resultSet.getString(3)));
                bookingDetails.add(new BookingDetail(resultSet.getInt(4), resultSet.getInt(5), resultSet.getInt(6),
                        resultSet.getInt(7), resultSet.getString(8), resultSet.getString(9)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return new BookingSearchResult(bookings, bookingDetails, columns);
    }

    /**
     * Method responsible for cancelling the bookings and deleting all related information from the database
     * @param bookingIds list of booking id numbers to cancel
     */
    public void cancelBookings(ArrayList<Integer> bookingIds) {
        String query = "DELETE FROM Booking WHERE Id IN (";
        for (int i = 0; i < bookingIds.size(); i++) {
            if (i != bookingIds.size()-1) {
                query += "?, ";
            } else {
                query += "?";
            }
        }
        query += ")";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            for (int i = 1; i <= bookingIds.size(); i++) {
                statement.setInt(i, bookingIds.get(i-1));
            }
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
