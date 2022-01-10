package holidaymaker.utilities;

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
        if (text.isEmpty() || text.length() < charCount) {
            charCount += 3;
        }
        if (!text.isEmpty()) {
            System.out.println("-".repeat(charCount));
            System.out.println(text);
        }
        System.out.println("-".repeat(charCount));
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
     * @return number chosen by the user
     */
    public static int readIntInput(int min, int max) {
        //System.out.println("-".repeat(20));
        if (max == 0) {
            max = Integer.MAX_VALUE;
        }
        System.out.print(">>: ");
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
     * Method responsible for reading numeric input from the user.
     * @param prompt question to display to the user
     * @return number provided by the user
     */
    public static int readIntInput(String prompt) {
        System.out.print("-".repeat(prompt.length()));
        System.out.println();
        System.out.println(prompt);
        System.out.print(">>: ");
        int answer;
        try {
            answer = Integer.parseInt(scanner.nextLine());
        } catch (Exception ignore) {
            System.out.println("Wrong input");
            answer = readIntInput(prompt);
        }
        return answer;
    }

    /**
     * Method responsible for reading numeric input from the user.
     * @param prompt question to display to the user
     * @param min minimum number allowed
     * @param max maximum number allowed
     * @return number chosen by the user
     */
    public static int readIntInput(String prompt, int min, int max) {
        System.out.print("-".repeat(prompt.length()));
        System.out.println();
        System.out.println(prompt);
        System.out.print(">>: ");
        int answer;
        try {
            answer = Integer.parseInt(scanner.nextLine());
            if ( answer < min || answer > max) {
                System.out.println("Wrong input");
                answer = readIntInput(prompt, min, max);
            }
        } catch (Exception ignore) {
            System.out.println("Wrong input");
            answer = readIntInput(prompt, min, max);
        }
        return answer;
    }

    /**
     * Method responsible for reading text input from the user.
     * @param prompt question to ask the user
     * @param inputPattern regex pattern the input must be checked against
     * @return text answer from the user
     */
    public static String readStringInput(String prompt, String inputPattern) {
        String answer = "";
        Pattern pattern = Pattern.compile(inputPattern);
        Matcher matcher;
        do {
            System.out.print("-".repeat(prompt.length()));
            System.out.println();
            System.out.println(prompt);
            System.out.print(">>: ");
            answer = scanner.nextLine();
            matcher = pattern.matcher(answer);
            if (answer.isEmpty() || !matcher.matches()) {
                System.out.println("Incorrect input. Please try again.");
            }
        } while (answer.isEmpty() || !matcher.matches());
        return answer;
    }

    /**
     * Method responsible for reading text input from the user.
     * @param prompt question to ask the user
     * @return text answer from the user
     */
    public static String readStringInput(String prompt) {
        String answer = "";
        do {
            System.out.print("-".repeat(prompt.length()));
            System.out.println();
            System.out.println(prompt);
            System.out.print(">>: ");
            answer = scanner.nextLine();
        } while (answer.isEmpty());
        return answer;
    }

    /**
     * Method responsible for adding some empty space in console output.
     */
    public static void clear() {
        System.out.println("\n".repeat(3));
    }
}
