package holidaymaker.console;

import holidaymaker.datamodels.*;
import holidaymaker.utilities.DatabaseWorker;
import holidaymaker.utilities.Dialogs;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * HolidaymakerConsole class responsible for interacting between the user and database.
 * @author Jan Beszterda
 */
public class HolidaymakerConsole {

    private Customer selectedCustomer;
    private DatabaseWorker databaseWorker;

    /**
     * Constructor of the HolidaymakerConsole objects. Initialises the application and transfers user to main menu.
     */
    public HolidaymakerConsole() {
        this.selectedCustomer = null;
        this.databaseWorker = new DatabaseWorker();
        initialiseConsole();
        showMainMenu();
    }

    /**
     * Method initialises connection with the database and displays welcome message.
     */
    private void initialiseConsole() {
        System.out.print("Connecting to the database");
        for (int i = 0; i < 5; i++) {
            try {
                Thread.sleep(200);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.print(".");
        }
        try {
            databaseWorker.connect();
            System.out.print(" Connection established!\n");
        } catch (SQLException ignore) {
            System.out.println("An error occurred while establishing connection to database. Closing console...");
            System.exit(1);
        }

        String welcomeMessage = "Welcome to Holidaymaker administrator console";
        String welcomeInfo = """
                This travel administrator console allows to
                save customer, guest and booking data
                as well as to search and display such data.
                
                You can use this console to:
                * register new customers
                * select one of the existing customers
                * search for available rooms and book them
                * cancel bookings""";
        System.out.println("-".repeat(welcomeMessage.length()));
        System.out.println(welcomeMessage);
        System.out.println("-".repeat(welcomeMessage.length()));
        System.out.println(welcomeInfo);
        System.out.println("-".repeat(welcomeMessage.length()));
    }

    /**
     * Method displays main menu and processes user's choice of further action.
     */
    private void showMainMenu() {
        if (this.selectedCustomer != null) {
            String customerInfo = this.selectedCustomer.toString();
            System.out.println("-".repeat(customerInfo.length()));
            System.out.println("Selected customer:");
            System.out.println(customerInfo);
            System.out.println("-".repeat(customerInfo.length()));
        }
        int input = Dialogs.showDialog("MAIN MENU", "Register new customer",
                "Select existing customer", "Search and book available rooms", "Cancel existing booking", "Quit");
        switch(input) {
            case 1:
                registerCustomer();
                break;
            case 2:
                selectCustomer();
                break;
            case 3:
                searchForRooms();
                break;
            case 4:
                input = Dialogs.showDialog("Do you know Id number of the booking to cancel?", "Yes", "No");
                if (input == 1) {
                    editBooking(null);
                } else {
                    System.out.println("You will now proceed to select a customer to view their bookings...");
                    selectCustomer();
                }
                break;
            case 5:
                quit();
        }
    }

    /**
     * Method finalises the application, disconnects the database and displays goodbye message.
     */
    private void quit() {
        String goodbyeMessage = "Closing connection with the database...";
        try {
            System.out.print("-".repeat(goodbyeMessage.length()));
            System.out.println();
            System.out.println(goodbyeMessage);
            databaseWorker.disconnect();
            Thread.sleep(500);
            System.out.println("Connection closed. Closing console...");
            System.out.println("Goodbye!");
            System.exit(0);
        } catch (SQLException ignore) {
            System.out.println("An error occurred while closing the connection with the database. Closing console...");
            System.exit(1);
        } catch (InterruptedException ignore) {
            System.exit(2);
        }
    }

    /**
     * Method allows user to register new customer in the database.
     */
    private void registerCustomer() {
        String firstName = Dialogs.readStringInput("Please input customer's first name", "^[A-Z\\p{L}][a-z\\p{L}]+(?>[ -]?[A-Z\\p{L}][a-z\\p{L}]+){0,2}$");
        String lastName = Dialogs.readStringInput("Please input customer's last name", "^[A-Z\\p{L}][']?[a-z\\p{L}]+(?>[ -]?[A-Z\\p{L}][a-z\\p{L}]+){0,3}$");
        String dateOfBirth = Dialogs.readStringInput("Please input customer's date of birth", "^[0-9]{4}-[0-9]{2}-[0-9]{2}$");
        String phoneNumber = Dialogs.readStringInput("Please input customer's phone number", "^[+][0-9]{1,3}[ -]?[0-9]{1,4}[ -]?[0-9]{2,4}[ -]?[0-9]{2,4}$");
        String emailAddress = Dialogs.readStringInput("Please input customer's email address", "^[a-zA-Z0-9._]{2,}[@][a-zA-Z0-9-]*[.]?[a-zA-Z0-9-]{2,}[.][a-z]{2,}$");
        int option = Dialogs.showDialog("Confirm registration?", "Yes", "No, go back to main menu");
        switch (option) {
            case 1:
                int id = databaseWorker.registerCustomer(firstName, lastName, dateOfBirth, phoneNumber, emailAddress);
                System.out.println("Customer registered in the database.");
                this.selectedCustomer = new Customer(firstName, lastName, dateOfBirth, phoneNumber, emailAddress);
                this.selectedCustomer.setId(id);
                showMainMenu();
                break;
            case 2:
                showMainMenu();
                break;
        }
    }

    /**
     * Method allows user to select an existing customer from the database.
     */
    private void selectCustomer() {
        ArrayList<String> values = new ArrayList<>();
        int option = Dialogs.showDialog("Please select a search option", "Find customer by Id",
                "Find customer by name and date of birth", "Find customer by phone number", "Find customer by email address", "Go back to main menu");
        switch (option) {
            case 1:
                int input = Dialogs.readIntInput("Please enter customer Id");
                values.add(Integer.toString(input));
                break;
            case 2:
                values.add(Dialogs.readStringInput("Please enter customer's first name"));
                values.add(Dialogs.readStringInput("Please enter customer's last name"));
                values.add(Dialogs.readStringInput("Please enter customer's date of birth"));
                break;
            case 3:
                values.add(Dialogs.readStringInput("Please enter customer's phone number"));
                break;
            case 4:
                values.add(Dialogs.readStringInput("Please enter customer's email address"));
                break;
            case 5:
                showMainMenu();
                break;
        }
        this.selectedCustomer = databaseWorker.selectCustomer(option, values.toArray(new String[0]));
        if (this.selectedCustomer != null) {
            System.out.println("Selected customer:");
            System.out.println(this.selectedCustomer);
            option = Dialogs.showDialog("What do you want to do now?", "Search for rooms to book",
                    "View customer's bookings", "Go back to main menu");
            switch (option) {
                case 1:
                    searchForRooms();
                    break;
                case 2:
                    viewBookings(this.selectedCustomer.getId());
                    break;
                case 3:
                    showMainMenu();
                    break;
            }
        } else {
            System.out.println("Customer not found in the database.");
            showMainMenu();
        }
    }

    /**
     * Method allows user to search for bookings of specific customer.
     * @param id customer's id number
     */
    private void viewBookings(int id) {
        BookingSearchResult bookingSearchResult = databaseWorker.searchForBookings(id);
        if (bookingSearchResult.getColumns().isEmpty()) {
            System.out.println("-".repeat(36));
            System.out.println("No bookings found for this customer.");
            showMainMenu();
        }
        displayBookingSearchResults(bookingSearchResult);
        int answer = Dialogs.showDialog("Do you want to cancel customer's booking", "Yes", "No, go back to main menu");
        if (answer == 1) {
            ArrayList<Integer> bookingIds = selectBookings(bookingSearchResult.getBookings());
            editBooking(bookingIds);
        } else {
            showMainMenu();
        }
    }

    /**
     * Method allows user to search for available rooms based on provided search conditions.
     */
    private void searchForRooms() {
        int input;
        if (this.selectedCustomer == null) {
            input = Dialogs.showDialog("A customer needs to be selected prior to creating a booking. You can still search for available rooms.",
                    "Search for available rooms", "Go back to main menu");
            if (input == 2) {
                showMainMenu();
            }
        }
        int numberOfGuests = Dialogs.readIntInput("Please enter number of guests", 1, Integer.MAX_VALUE);
        int numberOfBeds = Dialogs.readIntInput("Please enter number of beds in the room(s) (1-4)", 1, 4);
        String startDate = Dialogs.readStringInput("Please enter availability start date", "^[0-9]{4}-[0-9]{2}-[0-9]{2}$");
        String endDate = Dialogs.readStringInput("Please enter availability end date", "^[0-9]{4}-[0-9]{2}-[0-9]{2}$");
        input = Dialogs.showDialog("Do you need access to pool", "Yes", "No");
        boolean pool = false;
        if (input == 1) {
            pool = true;
        }
        input = Dialogs.showDialog("Do you need access to restaurant", "Yes", "No");
        boolean restaurant = false;
        if (input == 1) {
            restaurant = true;
        }
        input = Dialogs.showDialog("Do you need access to children club", "Yes", "No");
        boolean childrenClub = false;
        if (input == 1) {
            childrenClub = true;
        }
        input = Dialogs.showDialog("Do you need access to entertainment", "Yes", "No");
        boolean entertainment = false;
        if (input == 1) {
            entertainment = true;
        }
        RoomSearchResult roomSearchResult = databaseWorker.searchForRooms(numberOfBeds, startDate, endDate, pool, restaurant, childrenClub, entertainment);
        if (roomSearchResult.getColumns().isEmpty()) {
            System.out.println("-".repeat(43));
            System.out.println("No rooms found with selected options/dates.");
            showMainMenu();
        }
        displayRoomSearchResults(roomSearchResult);
        if (this.selectedCustomer != null) {
            int answer = Dialogs.showDialog("Do you want to select and book rooms", "Yes", "No, go back to main menu");
            if (answer == 1) {
                createBooking(numberOfGuests, startDate, endDate, roomSearchResult);
            } else {
                showMainMenu();
            }
        } else {
            System.out.println("No customer registered or selected. You need to register or select existing customer to create a booking...");
            int answer = Dialogs.showDialog("What do you want to do", "Register new customer", "Select existing customer", "Go back to main menu");
            switch (answer) {
                case 1:
                    registerCustomer();
                    break;
                case 2:
                    selectCustomer();
                    break;
                case 3:
                    showMainMenu();
                    break;
            }
        }
    }

    /**
     * Method allows to create a booking in the database.
     * @param numberOfGuests number of guests to register in the booking
     * @param startDate check-in date
     * @param endDate check-out date
     * @param roomSearchResult result object of the search method containing data about available rooms and hotels
     */
    private void createBooking(int numberOfGuests, String startDate, String endDate, RoomSearchResult roomSearchResult) {
        int bookingId;
        HashMap<Integer, Integer> selectedRooms = selectRooms(roomSearchResult.getRooms());
        bookingId = databaseWorker.bookRooms(this.selectedCustomer.getId(), selectedRooms, startDate, endDate);
        registerGuests(bookingId, numberOfGuests);
        String confirmation = "Booking with id: " + bookingId + " is registered!";
        System.out.println("-".repeat(confirmation.length()));
        System.out.println(confirmation);
        showMainMenu();
    }

    /**
     * Method allows the user to register guests details in the booking
     * @param bookingId booking number these guests belong to
     * @param maxGuestsNumber maximum number of guests to register as provided by customer
     */
    private void registerGuests(int bookingId, int maxGuestsNumber) {
        int answer = 0;
        databaseWorker.registerGuest(bookingId, this.selectedCustomer.getFirstName(), this.selectedCustomer.getLastName(), this.selectedCustomer.getPhoneNumber(), this.selectedCustomer.getEmailAddress(), this.selectedCustomer.getDateOfBirth());
        if (maxGuestsNumber > 1) {
            for (int i = 1; i < maxGuestsNumber; i++) {
                answer = Dialogs.showDialog("Do you want to register another guest (remaining guests to register: " + (maxGuestsNumber - i) + ")", "Yes", "No, finish booking");
                if (answer == 1) {
                    String firstName = Dialogs.readStringInput("Please enter guest's first name", "^[A-Z\\p{L}][a-z\\p{L}]+(?>[ -]?[A-Z\\p{L}][a-z\\p{L}]+){0,2}$");
                    String lastName = Dialogs.readStringInput("Please enter guest's last name", "^[A-Z\\p{L}][']?[a-z\\p{L}]+(?>[ -]?[A-Z\\p{L}][a-z\\p{L}]+){0,3}$");
                    String phoneNumber = Dialogs.readStringInput("Please enter guest's phone number", "^[+][0-9]{1,3}[ -]?[0-9]{1,4}[ -]?[0-9]{2,4}[ -]?[0-9]{2,4}$");
                    String emailAddress = Dialogs.readStringInput("Please enter guest's email address", "^[a-zA-Z0-9._]{2,}[@][a-zA-Z0-9-]*[.]?[a-zA-Z0-9-]{2,}[.][a-z]{2,}$");
                    String dateOfBirth = Dialogs.readStringInput("Please enter guest's date of birth", "^[0-9]{4}-[0-9]{2}-[0-9]{2}$");
                    databaseWorker.registerGuest(bookingId, firstName, lastName, phoneNumber, emailAddress, dateOfBirth);
                } else {
                    break;
                }
            }
        }
    }

    /**
     * Method allows the user to select booking numbers to cancel
     * @param bookings list of bookings of a selected customer
     * @return list of booking id numbers
     */
    private ArrayList<Integer> selectBookings(ArrayList<Booking> bookings) {
        ArrayList<Integer> selectedBookings = new ArrayList<>();
        int answer = 0;
        do {
            int input = Dialogs.readIntInput("Please enter Id of the booking");
            boolean selected = false;
            for (Booking b : bookings) {
                if (b.getId() == input) {
                    selectedBookings.add(b.getId());
                    selected = true;
                    break;
                }
            }
            if (!selected) {
                System.out.println("Wrong input!");
            } else {
                answer = Dialogs.showDialog("Do you want to select more bookings", "Yes", "No, proceed with editing", "No, cancel selection and return to main menu");
            }
        } while (answer == 1);
        if (answer == 3) {
            showMainMenu();
        }
        return selectedBookings;
    }

    /**
     * Method allows the user to select room-hotel id pairs to book
     * @param rooms List of rooms found by search method
     * @return map of room-hotel id pairs
     */
    private HashMap<Integer, Integer> selectRooms(ArrayList<Room> rooms) {
        HashMap<Integer, Integer> selectedRooms = new HashMap<>();
        int answer = 0;
        do {
            int input = Dialogs.readIntInput("Please enter Id of the room to book");
            boolean selected = false;
            for (Room r : rooms) {
                if (r.getId() == input) {
                    selectedRooms.put(r.getId(), r.getHotelId());
                    selected = true;
                    break;
                }
            }
            if (!selected) {
                System.out.println("Wrong input!");
            } else {
                answer = Dialogs.showDialog("Do you want to select more rooms", "Yes", "No, proceed with booking", "No, cancel selection and return to main menu");
            }
        } while (answer == 1);
        if (answer == 3) {
            showMainMenu();
        }
        return selectedRooms;
    }

    /**
     * Method responsible for processing and displaying room search result
     * @param roomSearchResult result of the room search
     */
    private void displayRoomSearchResults(RoomSearchResult roomSearchResult) {
        System.out.print("-".repeat(225));
        System.out.println();
        System.out.printf("%-10s%-16s%-16s%-10s%-36s%-90s%-6s%-12s%-15s%-14s", roomSearchResult.getColumns().get(0),
                roomSearchResult.getColumns().get(1), roomSearchResult.getColumns().get(2), roomSearchResult.getColumns().get(5),
                roomSearchResult.getColumns().get(6), roomSearchResult.getColumns().get(7), roomSearchResult.getColumns().get(8),
                roomSearchResult.getColumns().get(9), roomSearchResult.getColumns().get(10), roomSearchResult.getColumns().get(11));
        System.out.println();
        System.out.print("-".repeat(225));
        System.out.println();
        for (int i = 0; i < roomSearchResult.getRooms().size(); i++) {
            System.out.printf("%-10d%-16s%-16d%-10d%-36s%-90s%-6s%-12s%-15s%-14s", roomSearchResult.getRooms().get(i).getId(),
                    roomSearchResult.getRooms().get(i).getName(), roomSearchResult.getRooms().get(i).getNumberOfBeds(), roomSearchResult.getHotels().get(i).getId(),
                    roomSearchResult.getHotels().get(i).getName(), roomSearchResult.getHotels().get(i).getAddress(), roomSearchResult.getHotels().get(i).getPool(),
                    roomSearchResult.getHotels().get(i).getRestaurant(), roomSearchResult.getHotels().get(i).getChildrenClub(), roomSearchResult.getHotels().get(i).getEntertainment());
            System.out.println();
        }
        System.out.print("-".repeat(225));
        System.out.println();
    }

    /**
     * Method responsible for processing and displaying booking search result
     * @param bookingSearchResult result of the booking search
     */
    private void displayBookingSearchResults(BookingSearchResult bookingSearchResult) {
        System.out.print("-".repeat(89));
        System.out.println();
        System.out.printf("%-12s%-13s%-21s%-10s%-9s%-12s%-12s", bookingSearchResult.getColumns().get(0),
                bookingSearchResult.getColumns().get(1), bookingSearchResult.getColumns().get(2), bookingSearchResult.getColumns().get(5),
                bookingSearchResult.getColumns().get(6), bookingSearchResult.getColumns().get(7), bookingSearchResult.getColumns().get(8));
        System.out.println();
        System.out.print("-".repeat(89));
        System.out.println();
        for (int i = 0; i < bookingSearchResult.getBookings().size(); i++) {
            System.out.printf("%-12s%-13s%-21s%-10s%-9s%-12s%-12s", bookingSearchResult.getBookings().get(i).getId(),
                    bookingSearchResult.getBookings().get(i).getCustomerId(), bookingSearchResult.getBookings().get(i).getTimestamp(), bookingSearchResult.getBookingDetails().get(i).getHotelId(),
                    bookingSearchResult.getBookingDetails().get(i).getRoomId(), bookingSearchResult.getBookingDetails().get(i).getStartDate(), bookingSearchResult.getBookingDetails().get(i).getEndDate());
            System.out.println();
        }
        System.out.print("-".repeat(89));
        System.out.println();
    }

    /**
     * Method allows the user to cancel selected bookings
     * @param bookingIds list of booking id numbers
     */
    private void editBooking(ArrayList<Integer> bookingIds) {
        if (bookingIds == null) {
            bookingIds = new ArrayList<>();
            int input = -1;
            do {
                input = Dialogs.readIntInput("Please enter booking Id number");
                bookingIds.add(input);
                input = Dialogs.showDialog("Do you want to enter another booking Id", "Yes", "No, proceed with cancellation", "No, go back to main menu");
                if (input == 3) {
                    showMainMenu();
                }
            } while (input == 1);
        }
        if (bookingIds.size() > 0) {
            databaseWorker.cancelBookings(bookingIds);
            String confirmation = "Booking(s) with Id ";
            for (int i = 0; i < bookingIds.size(); i++) {
                confirmation += bookingIds.get(i).toString();
                if (i < bookingIds.size()-1) {
                    confirmation += ", ";
                }
            }
            confirmation += bookingIds.size() > 1 ? " have been cancelled." : " has been cancelled";
            System.out.println("-".repeat(confirmation.length()));
            System.out.println(confirmation);
            showMainMenu();
        } else {
            System.out.println("No booking Ids selected. Returning to main menu.");
            showMainMenu();
        }
    }
}
