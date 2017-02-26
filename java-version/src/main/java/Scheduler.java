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
    
    public static List<List<Pair<String, Integer>>> coalesce(HashMap<String, List<StudentTimes>> times) {
        // 1: For all days, for all keys, Fill a bitmap for that key.
        
        /*
        What to do:
        */
        
        String key;
        List<List<Pair<String, Integer>>> result = new ArrayList<>();

        for (int i = 0; i < 7; i++) {
            // Day
            List<Pair<String, Integer>> dl = new ArrayList<>();
            for (int j = 0; j < 24 * 4; j++) {
                // Hour
                dl.add(new Pair<String, Integer>());
            }
            result.add(dl);
        }

        // Temporary
        List<StudentTimes> val;
        // For topics
        List<String> keys = new ArrayList<>();
        // Piling location
        List<List<List<Integer>>> allTimes = new ArrayList<List<List<Integer>>>();


        for (Map.Entry<String,List<StudentTimes>> entry : times.entrySet()) {
            // topics
            List<List<Integer>> daylist = new ArrayList<>();
            for (int i = 0; i < 7; i++) {
                // days
                List<Integer> dl = new ArrayList<>();
                for (int j = 0; j < 24 * 4; j++) {
                    // hours
                    dl.add(0);
                }
                daylist.add(dl);
            }
            // now go through our list and add them.

            key = entry.getKey();
            keys.add(key);
            val = entry.getValue();

            for (StudentTimes stimes: val) {
                if (!stimes.topic.equals(key))
                    continue;
                // List of input student times
                for (int i = stimes.time_st * 4; i < stimes.time_en * 4; i++) {
                    // For all 15 min increments in block
                    Integer va = daylist.get(stimes.day).get(i);
                    // Get value of that block
                    daylist.get(stimes.day).set(i, va+1);
                    // Add one
                }
                // All blocks contain 0 for not open, 1 for open.
            }
            // Number count list itself appended to list of all number lists.
            allTimes.add(daylist);
        }
        
        // Take all these lists go through by 15 minute block. Look at all diff keys, add whichever is better.
        
        

        // Now take the allList and count. alllist > topic > day > hour
        for(int i = 0; i < allTimes.get(0).size(); i++) {
            for ( int j = 0; j < 24 * 4; j++) {
                int[] counts = new int[keys.size()];
                int max = 0, theMaxSoFarIndex = -1;
                
                for (int k = 0; k < keys.size(); k++) {
                    // Do the differential count here.
                    counts[k] = allTimes.get(k).get(i).get(j);
                }
                
                for (int a = 0; a < counts.length; a++) {
                    if (counts[a] > max) {
                        max = counts[a];
                        theMaxSoFarIndex = a;
                    }
                }
                // mark maximum and write to final
                if (theMaxSoFarIndex == -1) {
                    continue;
                }
                
                Pair<String, Integer> newval = new Pair<>();
                
                newval.val1 = keys.get(theMaxSoFarIndex);
                // get topic index . get day . get hour = int
                Integer r = allTimes.get(theMaxSoFarIndex).get(i).get(j);
                if (r == null) {
                    newval.val2 = 0;
                } else {
                    newval.val2 = r;
                }
                result.get(i).set(j, newval);
                
                
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
        
        List<List<Pair<String, Integer>>> r2 = coalesce(res);
        System.out.println("\tSun\t\tMon\t\tTu\t\tWed\t\tTh\t\tFri\t\tSa");
        for (int j = 0; j < r2.get(0).size() ; j++) {
            float time = j / 4.0f;
            System.out.printf("%.2f\t", time);
            for (int i = 0; i < r2.size(); i++) {
                // Time calc
                
                System.out.print(r2.get(i).get(j).val1 + "\t" + r2.get(i).get(j).val2 + "\t");
            }
            System.out.println();
        }
        
        
        
    }
}
