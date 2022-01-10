package holidaymaker.datamodels;

import java.util.ArrayList;

/**
 * RoomSearchResult class provides data model for the result of the search for available rooms operation. It contains
 * data returned from the database about rooms and hotels along with table column names.
 * @author Jan Beszterda
 */
public class RoomSearchResult {


    private ArrayList<Room> rooms;
    private ArrayList<Hotel> hotels;
    private ArrayList<String> columns;

    public RoomSearchResult(ArrayList<Room> rooms, ArrayList<Hotel> hotels, ArrayList<String> columns) {
        this.rooms = rooms;
        this.hotels = hotels;
        this.columns = columns;
    }

    public ArrayList<Room> getRooms() {
        return rooms;
    }

    public ArrayList<Hotel> getHotels() {
        return hotels;
    }

    public ArrayList<String> getColumns() {
        return columns;
    }
}
