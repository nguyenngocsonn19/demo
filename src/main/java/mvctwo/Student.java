package mvctwo;

public class Student {
    public String firstName;
    public String className;

    public int age ;

    public Student(String firstName, String className, Integer age ){
        super();
        this.firstName = firstName;
        this.className = className;
        this.age = age;
    }

    public String getFirstName() {return  firstName;}
    public void setFirstName(String firstName) {this.firstName = firstName;}

    public String getClassName() {return className;}

    public void setClassName(String className) {this.className =className;}

    public Integer getAge() {return age;}

    public void setAge(Integer age) {this.age = age;}

}
