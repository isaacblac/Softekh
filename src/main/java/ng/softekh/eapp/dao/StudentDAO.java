package ng.softekh.eapp.dao;

import java.util.List;
import ng.softekh.eapp.domain.Student;

/**
 *
 * @author ISAAC BLACK
 */
public interface StudentDAO {

    public void save(Student s);

    public void update(Student s);

    public void delete(Student s);

    public void delete(Integer studentId);

    public Student findById(Integer studentId);

    public List<Student> findAll();

    public List<Student> findByProperty(String propName, Object propValue);
}
