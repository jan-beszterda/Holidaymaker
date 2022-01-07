package holidaymaker.console;

import holidaymaker.datamodels.Customer;
import holidaymaker.datamodels.Room;
import holidaymaker.datamodels.SearchResult;
import holidaymaker.utilities.DatabaseWorker;
import holidaymaker.utilities.Dialogs;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class HolidaymakerConsole {

    private Customer selectedCustomer;
    private DatabaseWorker databaseWorker;

    public HolidaymakerConsole() throws InterruptedException {
        this.selectedCustomer = null;
        this.databaseWorker = new DatabaseWorker();
        initialiseConsole();
        showMainMenu();
    }

    private void initialiseConsole() throws InterruptedException {
        String welcomeMessage = "Welcome to Holidaymaker administrator console";
        int counter = 0;
        while (counter < welcomeMessage.length()) {
            System.out.print("-");
            counter++;
        }
        Thread.sleep(500);
        System.out.println();
        for (char c : welcomeMessage.toCharArray()) {
            System.out.print(c);
        }
        Thread.sleep(500);
        counter = 0;
        System.out.println();
        while (counter < welcomeMessage.length()) {
            System.out.print("-");
            counter++;
        }
        Thread.sleep(1000);
        System.out.println();
        try {
            databaseWorker.connect();
            System.out.println("Connection to the database established!");
        } catch (SQLException ignore) {
            System.out.println("An error occurred while establishing connection to database. Closing console...");
            System.exit(1);
        }
        Thread.sleep(500);
    }

    private void showMainMenu() {
        int input = Dialogs.showDialog("", "Register a customer",
                "Select existing customer", "Search for available rooms", "Edit existing booking", "Quit");
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
                editBooking();
                break;
            case 5:
                String goodbyeMessage = "Closing Holidaymaker administrator console...";
                try {
                    System.out.print("-".repeat(goodbyeMessage.length()));
                    System.out.println();
                    System.out.println(goodbyeMessage);
                    databaseWorker.disconnect();
                    Thread.sleep(500);
                    System.out.println("Goodbye!");
                    System.exit(0);
                } catch (SQLException ignore) {
                    System.out.println("An error occurred while closing the connection with the database. Closing console...");
                    System.exit(1);
                } catch (InterruptedException ignore) {
                    System.exit(2);
                }
        }
    }

    private void registerCustomer() {
        String firstName = Dialogs.readStringInput("Please input customer's first name");
        String lastName = Dialogs.readStringInput("Please input customer's last name");
        String dateOfBirth = Dialogs.readStringInput("Please input customer's date of birth");
        String phoneNumber = Dialogs.readStringInput("Please input customer's phone number");
        String emailAddress = Dialogs.readStringInput("Please input customer's email address");
        int option = Dialogs.showDialog("Confirm registration?", "Yes", "No");
        switch (option) {
            case 1:
                int id = databaseWorker.registerCustomer(firstName, lastName, dateOfBirth, phoneNumber, emailAddress);
                System.out.println("Customer registered in the database.");
                selectedCustomer = new Customer(firstName, lastName, dateOfBirth, phoneNumber, emailAddress);
                selectedCustomer.setId(id);
                break;
            case 2:
                showMainMenu();
                break;
        }
    }

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
        selectedCustomer = databaseWorker.selectCustomer(1, values.toArray(new String[0]));
        System.out.println("Selected customer:");
        System.out.println(selectedCustomer);
        showMainMenu();
    }

    private void searchForRooms() {
        int numberOfBeds = Dialogs.readIntInput("Please enter number of beds in the room", 1, 4);
        String startDate = Dialogs.readStringInput("Please enter availability start date");
        String endDate = Dialogs.readStringInput("Please enter availability end date");
        int input = Dialogs.showDialog("Do you want access to pool", "Yes", "No");
        boolean pool = false;
        if (input == 1) {
            pool = true;
        }
        input = Dialogs.showDialog("Do you want access to restaurant", "Yes", "No");
        boolean restaurant = false;
        if (input == 1) {
            restaurant = true;
        }
        input = Dialogs.showDialog("Do you want access to children club", "Yes", "No");
        boolean childrenClub = false;
        if (input == 1) {
            childrenClub = true;
        }
        input = Dialogs.showDialog("Do you want access to entertainment", "Yes", "No");
        boolean entertainment = false;
        if (input == 1) {
            entertainment = true;
        }
        SearchResult searchResult = databaseWorker.searchForRooms(numberOfBeds, startDate, endDate, pool, restaurant, childrenClub, entertainment);
        displaySearchResults(searchResult);
        int answer = Dialogs.showDialog("Do you want to select and book rooms", "Yes", "No");
        if (answer == 1) {
            HashMap<Integer, Integer> selectedRooms = selectRooms(searchResult.getRooms());
            databaseWorker.bookRooms(selectedCustomer.getId(), selectedRooms, startDate, endDate);
        } else {
            showMainMenu();
        }
    }
    
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
    
    
    private void displaySearchResults(SearchResult searchResult) {
        System.out.print("-".repeat(225));
        System.out.println();
        System.out.printf("%-10s%-16s%-16s%-10s%-36s%-90s%-6s%-12s%-15s%-14s", searchResult.getColumns().get(0),
                searchResult.getColumns().get(1), searchResult.getColumns().get(2), searchResult.getColumns().get(5),
                searchResult.getColumns().get(6), searchResult.getColumns().get(7), searchResult.getColumns().get(8),
                searchResult.getColumns().get(9), searchResult.getColumns().get(10), searchResult.getColumns().get(11));
        System.out.println();
        System.out.print("-".repeat(225));
        System.out.println();
        for (int i = 0; i < searchResult.getRooms().size(); i++) {
            System.out.printf("%-10d%-16s%-16d%-10d%-36s%-90s%-6s%-12s%-15s%-14s", searchResult.getRooms().get(i).getId(),
                    searchResult.getRooms().get(i).getName(), searchResult.getRooms().get(i).getNumberOfBeds(), searchResult.getHotels().get(i).getId(),
                    searchResult.getHotels().get(i).getName(), searchResult.getHotels().get(i).getAddress(), searchResult.getHotels().get(i).getPool(),
                    searchResult.getHotels().get(i).getRestaurant(), searchResult.getHotels().get(i).getChildrenClub(), searchResult.getHotels().get(i).getEntertainment());
            System.out.println();
        }
    }

    private void editBooking() {
    }
}
