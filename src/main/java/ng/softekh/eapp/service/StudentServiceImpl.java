package ng.softekh.eapp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import ng.softekh.eapp.dao.BaseDAO;
import ng.softekh.eapp.dao.StudentDAO;
import ng.softekh.eapp.domain.Student;
import ng.softekh.eapp.exception.StudentBlockedException;
import ng.softekh.eapp.rm.StudentRowMapper;
import ng.softekh.eapp.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

/**
 *
 * @author ISAAC BLACK
 */
@Service
public class StudentServiceImpl extends BaseDAO implements StudentService {

    @Autowired
    private StudentDAO studentDAO;

    @Override
    public void register(Student s) {
        studentDAO.save(s);
    }

    @Override
    public Student login(String loginName, String password) throws StudentBlockedException {
        String sql = "SELECT studentId, fullName, phone, email, gender, level, address, loginName, role, loginStatus"
                + " FROM student WHERE loginName=:ln AND password=:psd";
        Map m = new HashMap();
        m.put("ln", loginName);
        m.put("psd", password);

        try {
            Student s = getNamedParameterJdbcTemplate().queryForObject(sql, m, new StudentRowMapper());
            if (s.getLoginStatus().equals(StudentService.LOGIN_STATUS_BLOCKED)) {
                throw new StudentBlockedException("Your account has been blocked: contact admin!");
            } else {
                return s;
            }
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    public List<Student> getStudentList() {
        return studentDAO.findAll();
    }

    @Override
    public void changeLoginStatus(Integer studentId, Integer loginStatus) {
        String sql = "UPDATE student SET loginStatus=:lst WHERE studentId=:sid";
        Map m = new HashMap();
        m.put("sid", studentId);
        m.put("lst", loginStatus);
        getNamedParameterJdbcTemplate().update(sql, m);
    }

    @Override
    public void update(Student s) {
        studentDAO.update(s);
    }

    @Override
    public void delete(Integer studentId) {
        studentDAO.delete(studentId);
    }

    @Override
    public Student findById(Integer studentId) {
        return studentDAO.findById(studentId);
    }

    @Override
    public List<Student> findStudent(String txt) {
        String sql = "SELECT studentId, fullName, phone, email, gender, level, address, loginName, role, loginStatus"
                + " FROM student WHERE (studentId LIKE '%" + txt + "%' OR fullName LIKE '%" + txt + "%' OR phone LIKE '%" + txt + "%' OR email LIKE '%" + txt + "%' OR gender LIKE '%" + txt + "%' OR level LIKE '%" + txt + "%' OR address LIKE '%" + txt + "%')";
        return getJdbcTemplate().query(sql, new StudentRowMapper());
    }

    @Override
    public void delete(Integer[] studentIds) {
        String ids = StringUtil.toCommaSeparatedString(studentIds);
        String sql = "DELETE FROM student WHERE studentId IN(" + ids + ")";
        getJdbcTemplate().update(sql);
    }

    @Override
    public Boolean doesUsernameExist(String username) {
        String sql = "SELECT count(loginName) FROM student WHERE loginName=?";
        Integer count = getJdbcTemplate().queryForObject(sql, new String[]{username}, Integer.class);
        if (count==1) {
            return true;
        } else {
            return false;
        }
    }
}
