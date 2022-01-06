package holidaymaker.utilities;

import java.util.Scanner;

/**
 * Dialog class is responsible for processing user input into console.
 * @author Jan Beszterda
 */
public class Dialogs {

    private static final Scanner scanner = new Scanner(System.in);

    /**
     * Static method to display a menu dialog with options to chose from.
     * @param text title of the menu or question to the user
     * @param options options the user can choose from
     * @return option number chosen by the user
     */
    public static int showDialog(String text, String... options) {
        int charCount = text.length();
        for (String option : options) {
            if (option.length() > charCount) {
                charCount = option.length();
            }
        }
        if (text.isEmpty()) {
            charCount += 3;
        }
        if (!text.isEmpty()) {
            System.out.println("-".repeat(charCount));
            System.out.println(text);
            System.out.println("-".repeat(charCount));
        }
        for (int i = 0; i < options.length; i++) {
            System.out.println(i+1 + ". " + options[i]);
        }
        System.out.println("-".repeat(charCount));
        return readIntInput(1, options.length);
    }

    /**
     * Method responsible for reading numeric input from the user.
     * @param min minimum number allowed
     * @param max maximum number allowed
     * @return number chosen by the player
     */
    public static int readIntInput(int min, int max) {
        //System.out.println("-".repeat(20));
        if (max == 0) {
            max = Integer.MAX_VALUE;
        }
        System.out.print("Your answer: ");
        int answer;
        try {
            answer = Integer.parseInt(scanner.nextLine());
            if ( answer < min || answer > max) {
                System.out.println("Wrong input");
                answer = readIntInput(min, max);
            }
        } catch (Exception ignore) {
            System.out.println("Wrong input");
            answer = readIntInput(min, max);
        }
        return answer;
    }

    /**
     * Method responsible for reading text input from the user.
     * @param prompt question to ask the user
     * @return text answer from the user
     */
    public static String readStringInput(String prompt) {
        String answer = "";
        while (answer.isEmpty()) {
            System.out.println(prompt);
            System.out.print("Your answer: ");
            answer = scanner.nextLine();
        }
        return answer;
    }

    /**
     * Method responsible for adding some empty space in console output.
     */
    public static void clear() {
        System.out.println("\n".repeat(3));
    }
}