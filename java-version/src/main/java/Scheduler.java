/**
 * Created by Frank on 2/25/2017.
 */

import java.util.*;
import java.math.*;

public class Scheduler {
    public static HashMap<String, List<StudentTimes>> Start(Professor prof, List<Student> stu) {
        // Counter = list of StudentTimes
        HashMap<String, List<StudentTimes>> counter = new HashMap<>();
        int i = 0;
        for (ProfTimes ptime: prof.times) {
            for (Student student: stu) {
                for (StudentTimes stutimes: student.times) {
                    if (stutimes.day != ptime.day) {
                        continue;
                    }
                    // found hit
                    int time_St = Math.max(stutimes.time_st, ptime.time_st);
                    int time_En = Math.min(stutimes.time_en, ptime.time_en);
                    if (time_En - time_St <= 0) {
                        continue;
                    }
                    List<StudentTimes> oldval = new ArrayList<>();
                    List<StudentTimes> val = counter.get(stutimes.topic);
                    if (val == null) {
                        counter.put(stutimes.topic, oldval);
                        val = oldval;
                    }
                    StudentTimes x = new StudentTimes();
                    x.day = stutimes.day;
                    x.time_en = time_En;
                    x.time_st = time_St;
                    x.topic = stutimes.topic;
                    val.add(x);

                }
            }
        }
        return counter;
    }

    public static void main(String[] args)
    {
        Professor p = new Professor();
        p.times = new ArrayList<>();
        p.times.add(new ProfTimes(0, 9, 5+12));
        p.times.add(new ProfTimes(1, 9, 5+12));
        p.times.add(new ProfTimes(2, 8, 10));
        p.times.add(new ProfTimes(2, 12, 1+12));

        Student s1 = new Student();
        s1.times = new ArrayList<>();
        s1.times.add(new StudentTimes(0, 12, 14, "hw"));
        s1.times.add(new StudentTimes(0, 4+12, 7+12, "class"));
        s1.times.add(new StudentTimes(1, 0, 24, "exam"));

        Student s2 = new Student();
        s2.times = new ArrayList<>();
        s2.times.add(new StudentTimes(0, 12, 14, "hw"));
        s2.times.add(new StudentTimes(0, 4+12, 7+12, "class"));
        s2.times.add(new StudentTimes(1, 0, 24, "hw"));

        List<Student> studs = new ArrayList<>();

        studs.add(s1);
        studs.add(s2);

        HashMap<String, List<StudentTimes>> res = Start(p, studs);

        for (Map.Entry<String,List<StudentTimes>> entry : res.entrySet()) {
            String key = entry.getKey();
            List<StudentTimes> value = entry.getValue();
            System.out.print("Key: ");
            System.out.println(key);

            for (StudentTimes v: value) {
                System.out.print(v + ", ");
            }
            System.out.println();
        }
    }
}
