package holidaymaker.datamodels;

import java.util.ArrayList;

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
