package ng.softekh.eapp.test;

import java.util.List;
import ng.softekh.eapp.config.SpringRootConfig;
import ng.softekh.eapp.dao.StudentDAO;
import ng.softekh.eapp.domain.Student;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 *
 * @author ISAAC BLACK
 */
public class TestStudentDAOFindByProperty {

    public static void main(String[] args) {
        ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        StudentDAO studentDAO = ctx.getBean(StudentDAO.class);
        //List<Student> students = studentDAO.findByProperty("studentId", 2);
        List<Student> students = studentDAO.findByProperty("level", "ss3");
        System.out.println("------------Students Details-----------");
        for (Student student : students) {
            System.out.println(student.getStudentId()+" "+student.getFullName()+" "+student.getGender()+" "+student.getLevel());
        }
    }

}
