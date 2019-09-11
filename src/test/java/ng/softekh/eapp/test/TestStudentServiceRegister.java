package ng.softekh.eapp.test;

import ng.softekh.eapp.config.SpringRootConfig;
import ng.softekh.eapp.domain.Student;
import ng.softekh.eapp.service.StudentService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;




/**
 *
 * @author ISAAC BLACK
 */
public class TestStudentServiceRegister {

    public static void main(String[] args) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        StudentService studentService = ctx.getBean(StudentService.class);
        Student s = new Student();
        s.setFullName("Elvis elton");
        s.setPhone("08199335244");
        s.setEmail("elvis.e@example.com");
        s.setGender("male");
        s.setLevel("ss1");
        s.setAddress("Mill Street");
        s.setLoginName("elvis");
        s.setPassword("elvis123");
        s.setRole(StudentService.ROLE_STUDENT); //Active state
        s.setLoginStatus(StudentService.LOGIN_STATUS_ACTIVE); //Admin role
        studentService.register(s);
        System.out.println("------------Student Registered Successfully-----------");
    }
    
}
