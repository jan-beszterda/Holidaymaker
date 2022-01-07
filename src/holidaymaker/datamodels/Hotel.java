package holidaymaker.datamodels;

public class Hotel {

    private int id;
    private String name;
    private String address;
    private String pool;
    private String restaurant;
    private String childrenClub;
    private String entertainment;

    public Hotel() {
    }

    public Hotel(String name, String address, String pool, String restaurant, String childrenClub, String entertainment) {
        this.name = name;
        this.address = address;
        this.pool = pool;
        this.restaurant = restaurant;
        this.childrenClub = childrenClub;
        this.entertainment = entertainment;
    }

    public Hotel(int id, String name, String address, String pool, String restaurant, String childrenClub, String entertainment) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.pool = pool;
        this.restaurant = restaurant;
        this.childrenClub = childrenClub;
        this.entertainment = entertainment;
    }

    @Override
    public String toString() {
        return "Hotel id: " + id +
                ", Hotel name: " + name +
                ", Hotel address: " + address +
                ", Pool: " + pool +
                ", Restaurant: " + restaurant +
                ", Children club: " + childrenClub +
                ", Entertainment: " + entertainment;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public String getPool() {
        return pool;
    }

    public String getRestaurant() {
        return restaurant;
    }

    public String getChildrenClub() {
        return childrenClub;
    }

    public String getEntertainment() {
        return entertainment;
    }
}
