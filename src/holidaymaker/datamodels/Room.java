package holidaymaker.datamodels;

public class Room {

    private int id;
    private String name;
    private int numberOfBeds;
    private int hotelId;
    private int number;

    public Room() {

    }

    public Room(String name, int numberOfBeds, int hotelId, int number) {
        this.name = name;
        this.numberOfBeds = numberOfBeds;
        this.hotelId = hotelId;
        this.number = number;
    }

    public Room(int id, String name, int numberOfBeds, int hotelId, int number) {
        this.id = id;
        this.name = name;
        this.numberOfBeds = numberOfBeds;
        this.hotelId = hotelId;
        this.number = number;
    }

    @Override
    public String toString() {
        return "Room id: " + id +
                ", Room type: " + name +
                ", Number of beds: " + numberOfBeds;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getNumberOfBeds() {
        return numberOfBeds;
    }

    public int getHotelId() {
        return hotelId;
    }

    public int getNumber() {
        return number;
    }
}
