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

    // Needs to return 7*(24*4) array with strings to refer times.
    public List<List<Pair<String, Integer>>> coalesce(HashMap<String, List<StudentTimes>> times) {
        // 1: For all days, for all keys, Fill a bitmap for that key.
        String key;
        List<List<Pair<String, Integer>>> result = new ArrayList<>();

        for (int i = 0; i < 7; i++) {
            List<Pair<String, Integer>> dl = new ArrayList<>();
            for (int j = 0; j < 24 * 4; j++) {
                dl.add(null);
            }
            result.add(dl);
        }

        List<StudentTimes> val;
        List<String> keys = new ArrayList<>();

        //List

        for (Map.Entry<String,List<StudentTimes>> entry : times.entrySet()) {
            List<List<Integer>> daylist = new ArrayList<>();
            for (int i = 0; i < 7; i++) {
                List<Integer> dl = new ArrayList<>();
                for (int j = 0; j < 24 * 4; j++) {
                    dl.add(0);
                }
                daylist.add(dl);
            }
            // now go through our list and add them.

            key = entry.getKey();
            keys.add(key);
            val = entry.getValue();

            for (StudentTimes stimes: val) {
                for (int i = stimes.time_st * 4; i < stimes.time_en * 4; i++) {
                    Integer va = daylist.get(stimes.day).get(i);
                    daylist.get(stimes.day).set(i, va+1);
                }
            }

        }



        return result;
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
