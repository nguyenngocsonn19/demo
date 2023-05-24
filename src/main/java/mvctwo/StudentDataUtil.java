package mvctwo;

import java.util.ArrayList;
import java.util.List;

public class StudentDataUtil {
public static List<Student> getStudents(){

    List<Student> students = new ArrayList<>();
    students.add(new Student("ngocson", "t210800" , 20));
    students.add(new Student("ngocson2", "t2108002131" , 200));
    students.add(new Student("ngocson2222", "t21080054646" , 2000));

    return students;
}

}
