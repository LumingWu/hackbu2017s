/**
 * Created by Frank on 2/25/2017.
 */
public class StudentTimes {
    public int day;
    public int time_st;

    public StudentTimes(int day, int time_st, int time_en, String topic) {
        this.day = day;
        this.time_st = time_st;
        this.time_en = time_en;
        this.topic = topic;
    }

    public StudentTimes() {

    }

    public String toString() {
        return "{"+ day + ", " + time_st + ", " + time_en + ", " + topic + "}";
    }

    public int time_en;
    public String topic;

}
