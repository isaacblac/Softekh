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
public class TestStudentDAOFindById {

    public static void main(String[] args) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        StudentDAO studentDAO = ctx.getBean(StudentDAO.class);
        Student s = studentDAO.findById(2);
        System.out.println("------------Student details-----------");
        System.out.println("STUDENT_ID: "+ s.getStudentId());
        System.out.println("FULL_NANE: "+ s.getFullName());
        System.out.println("PHONE: "+ s.getPhone());
        System.out.println("E-MAIL: "+ s.getEmail());
        System.out.println("GENDER: "+ s.getGender());
        System.out.println("CLASS: "+ s.getLevel());
        System.out.println("USER-NAME: "+ s.getLoginName());;
        System.out.println("ROLE: "+ s.getRole());
        System.out.println("LOGIN_STATUS: "+ s.getLoginStatus());
    }
    
}
