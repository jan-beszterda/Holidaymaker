package holidaymaker.datamodels;

import java.sql.ResultSetMetaData;
import java.util.ArrayList;

public class SearchResult {


    private ArrayList<Room> rooms;
    private ArrayList<Hotel> hotels;
    private ArrayList<String> columns;

    public SearchResult(ArrayList<Room> rooms, ArrayList<Hotel> hotels, ArrayList<String> columns) {
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
