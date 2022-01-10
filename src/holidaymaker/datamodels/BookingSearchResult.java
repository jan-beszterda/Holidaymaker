package holidaymaker.datamodels;

import java.util.ArrayList;

/**
 * BookingSearchResult class provides data model for the result of the search for customer's bookings operation.
 * It contains data returned from the database about bookings and booking details along with table column names.
 * @author Jan Beszterda
 */
public class BookingSearchResult {

    private ArrayList<Booking> bookings;
    private ArrayList<BookingDetail> bookingDetails;
    private ArrayList<String> columns;

    public BookingSearchResult(ArrayList<Booking> bookings, ArrayList<BookingDetail> bookingDetails, ArrayList<String> columns) {
        this.bookings = bookings;
        this.bookingDetails = bookingDetails;
        this.columns = columns;
    }

    public ArrayList<Booking> getBookings() {
        return bookings;
    }

    public ArrayList<BookingDetail> getBookingDetails() {
        return bookingDetails;
    }

    public ArrayList<String> getColumns() {
        return columns;
    }
}
