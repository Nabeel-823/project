import java.util.Calendar;
import java.util.Date;
import java.text.SimpleDateFormat;

public class DigitalClock {
    public static void main(String[] args) {
        // Creating a thread to update the time continuously
        Thread clockThread = new Thread(() -> {
            try {
                while (true) {
                    // Get current time
                    Date currentTime = Calendar.getInstance().getTime();
                    // Format the time as desired
                    SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
                    String formattedTime = timeFormat.format(currentTime);
                    // Print the time
                    System.out.println(formattedTime);
                    // Wait for a second before updating the time
                    Thread.sleep(1000);
                }
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        });

        // Start the clock thread
        clockThread.start();
    }
}
