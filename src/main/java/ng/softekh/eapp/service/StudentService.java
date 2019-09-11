package ng.softekh.eapp.service;

import java.util.List;
import ng.softekh.eapp.domain.Student;
import ng.softekh.eapp.exception.StudentBlockedException;

/**
 *
 * @author ISAAC BLACK
 */
public interface StudentService {
    
    public static final Integer LOGIN_STATUS_ACTIVE = 1;
    public static final Integer LOGIN_STATUS_BLOCKED = 2;
    
    public static final Integer ROLE_ADMIN= 1;
    public static final Integer ROLE_STUDENT= 2;
    /**
     * This method handle the student registration task.
     * @param s the new student details as object
     */
    public void register(Student s);
     
    public void update(Student s);
    
    public void delete(Integer studentId);
    /**
     * The method handles login operation(authentically) using given credentials.
     * This method(login) will return student object when the operation is successful.
     * And return null when the operation fail
     * When student account is blocked an exception is thrown by this method!
     * @param loginName
     * @param password
     * @return 
     * @throws ng.softekh.eapp.exception.StudentBlockedException when student account is blocked!
     */
    public Student login(String loginName, String password) throws StudentBlockedException;
    /**
     * Call this method to get the list of registered student!
     * @return 
     */
    
    public Student findById(Integer studentId);
    
    public void delete(Integer[] studentIds);
    
    public List<Student> findStudent(String txt);
    
    public List<Student> getStudentList();
    /**
     * This method change student login status for details pass as argument
     * @param studentId
     * @param loginStatus
     */
    public void changeLoginStatus(Integer studentId, Integer loginStatus);
    /**
     * Check student username availability
     * @param username
     * @return 
     */
    public Boolean doesUsernameExist(String username);
}
