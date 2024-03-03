import java.util.Scanner;

public class Calculator {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        double num1, num2;
        System.out.println("Select operation:");
        System.out.println("1. Add");
        System.out.println("2. Subtract");
        System.out.println("3. Multiply");
        System.out.println("4. Divide");

        System.out.print("Enter choice (1/2/3/4): ");
        char choice = scanner.next().charAt(0);

        System.out.print("Enter first number: ");
        num1 = scanner.nextDouble();
        System.out.print("Enter second number: ");
        num2 = scanner.nextDouble();

        switch(choice) {
            case '1':
                System.out.println("Result: " + add(num1, num2));
                break;
            case '2':
                System.out.println("Result: " + subtract(num1, num2));
                break;
            case '3':
                System.out.println("Result: " + multiply(num1, num2));
                break;
            case '4':
                System.out.println("Result: " + divide(num1, num2));
                break;
            default:
                System.out.println("Invalid input");
        }
        scanner.close();
    }

    public static double add(double x, double y) {
        return x + y;
    }

    public static double subtract(double x, double y) {
        return x - y;
    }

    public static double multiply(double x, double y) {
        return x * y;
    }

    public static double divide(double x, double y) {
        if (y == 0) {
            System.out.println("Error! Division by zero.");
            return 0;
        } else {
            return x / y;
        }
    }
}
