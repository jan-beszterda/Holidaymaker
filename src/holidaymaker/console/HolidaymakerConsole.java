package holidaymaker.console;

import holidaymaker.datamodels.Customer;
import holidaymaker.utilities.DatabaseWorker;
import holidaymaker.utilities.Dialogs;

import java.sql.SQLException;

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
        System.out.println("-".repeat(welcomeMessage.length()));
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
                System.out.println("Closing Holidaymaker administrator console...\nGoodbye!");
                System.exit(0);
        }
    }

    private void registerCustomer() {
        String firstName = Dialogs.readStringInput("Please input customer's first name");
        String lastName = Dialogs.readStringInput("Please input customer's last name");
        String dateOfBirth = Dialogs.readStringInput("Please input customer's date of birth");
        String phoneNumber = Dialogs.readStringInput("Please input customer's phone number");
        String emailAddress = Dialogs.readStringInput("Please input customer's email address");
        int id = databaseWorker.registerCustomer(firstName, lastName, dateOfBirth, phoneNumber, emailAddress);
        System.out.println("Customer registered in the database.");
        selectedCustomer = new Customer(firstName, lastName, dateOfBirth, phoneNumber, emailAddress);
        selectedCustomer.setId(id);
        showMainMenu();
    }

    private void selectCustomer() {

        selectedCustomer = databaseWorker.selectCustomer(1, "1");
    }

    private void searchForRooms() {
    }

    private void editBooking() {
    }
}
