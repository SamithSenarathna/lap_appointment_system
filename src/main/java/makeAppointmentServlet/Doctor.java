package makeAppointmentServlet;

public class Doctor {
    private int id;
    private String name;

    public Doctor(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }
}
