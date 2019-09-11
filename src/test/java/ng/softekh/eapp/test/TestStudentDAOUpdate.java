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
public class TestStudentDAOUpdate {

    public static void main(String[] args) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        StudentDAO studentDAO = ctx.getBean(StudentDAO.class);
        Student s = new Student();
        s.setStudentId(1);
        s.setFullName("Akunna");
        s.setPhone("0912234534");
        s.setEmail("angel@example.com");
        s.setGender("female");
        s.setLevel("ss2");
        s.setAddress("Nekede Hills");
        s.setLoginName("akunna");
        s.setPassword("akunna123");
        s.setRole(2); //Active state
        s.setLoginStatus(1); //Admin role
        studentDAO.update(s);
        System.out.println("------------Record Updated Successfully-----------");
    }
    
}
