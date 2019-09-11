package ng.softekh.eapp.test;

import ng.softekh.eapp.config.SpringRootConfig;
import ng.softekh.eapp.dao.StudentDAO;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;




/**
 *
 * @author ISAAC BLACK
 */
public class TestStudentDAODelete {

    public static void main(String[] args) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        StudentDAO studentDAO = ctx.getBean(StudentDAO.class);
        studentDAO.delete(6);
        System.out.println("------------Record Delete Successfully-----------");
    }
    
}
