package holidaymaker.datamodels;

/**
 * BookingDetails class provides data model for booking details data
 * @author Jan Beszterda
 */
public class BookingDetail {

    private int id;
    private int bookingId;
    private int hotelId;
    private int roomId;
    private String startDate;
    private String endDate;

    public BookingDetail(int id, int bookingId, int hotelId, int roomId, String startDate, String endDate) {
        this.id = id;
        this.bookingId = bookingId;
        this.hotelId = hotelId;
        this.roomId = roomId;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public int getId() {
        return id;
    }

    public int getBookingId() {
        return bookingId;
    }

    public int getHotelId() {
        return hotelId;
    }

    public int getRoomId() {
        return roomId;
    }

    public String getStartDate() {
        return startDate;
    }

    public String getEndDate() {
        return endDate;
    }
}
