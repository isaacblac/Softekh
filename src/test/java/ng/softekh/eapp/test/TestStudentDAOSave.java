package ng.softekh.eapp.test;

import ng.softekh.eapp.config.SpringRootConfig;
import ng.softekh.eapp.dao.StudentDAO;
import ng.softekh.eapp.domain.Student;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;




/**
 *
 * @author ISAAC BLACK
 */
public class TestStudentDAOSave {

    public static void main(String[] args) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        StudentDAO studentDAO = ctx.getBean(StudentDAO.class);
        Student s = new Student();
        s.setFullName("Angela Hill");
        s.setPhone("0912234534");
        s.setEmail("angel@example.com");
        s.setGender("female");
        s.setLevel("ss2");
        s.setAddress("Church Hill");
        s.setLoginName("angel");
        s.setPassword("angel123");
        s.setRole(2); //Active state
        s.setLoginStatus(1); //Admin role
        studentDAO.save(s);
        System.out.println("------------Record Saved Successfully-----------");
    }
    
}
