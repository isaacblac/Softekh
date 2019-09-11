package ng.softekh.eapp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import ng.softekh.eapp.domain.Student;
import ng.softekh.eapp.rm.StudentRowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ISAAC BLACK
 */
@Repository
public class StudentDAOImpl extends BaseDAO implements StudentDAO{
    
    @Override
    public void save(Student s) {
        String sql = "INSERT INTO student(fullName, phone, email, gender, level, address, loginName, password, role, loginStatus)"
                + " VALUES(:fullName, :phone, :email, :gender, :level, :address, :loginName, :password, :role, :loginStatus)";
        Map m = new HashMap();
        m.put("fullName", s.getFullName());
        m.put("phone", s.getPhone());
        m.put("email", s.getEmail());
        m.put("gender", s.getGender());
        m.put("level", s.getLevel());
        m.put("address", s.getAddress());
        m.put("loginName", s.getLoginName());
        m.put("password", s.getPassword());
        m.put("role", s.getRole());
        m.put("loginStatus", s.getLoginStatus());
        
        KeyHolder kh = new GeneratedKeyHolder();
        SqlParameterSource ps = new MapSqlParameterSource(m);
        super.getNamedParameterJdbcTemplate().update(sql, ps, kh);
        Integer studentId = kh.getKey().intValue();
        s.setStudentId(studentId);        
        
    }

    @Override
    public void update(Student s) {
        String sql = "UPDATE student "
                + " SET fullName=:fullName,"
                + " phone=:phone,"
                + " email=:email,"
                + " gender=:gender,"
                + " level=:level,"
                + " address=:address"             
                + " WHERE studentId =:studentId";
        
        Map m = new HashMap();
        m.put("studentId", s.getStudentId());
        m.put("fullName", s.getFullName());
        m.put("phone", s.getPhone());
        m.put("email", s.getEmail());
        m.put("gender", s.getGender());
        m.put("level", s.getLevel());
        m.put("address", s.getAddress());
        getNamedParameterJdbcTemplate().update(sql, m);
    }

    @Override
    public void delete(Student s) {
        this.delete(s.getStudentId());
    }

    @Override
    public void delete(Integer studentId) {
        String sql = "DELETE FROM student WHERE studentId=?";
        getJdbcTemplate().update(sql, studentId);
    }

    @Override
    public Student findById(Integer studentId) {
        String sql = "SELECT studentId, fullName, phone, email, gender, level, address, loginName, role, loginStatus"
                + " FROM student WHERE studentId=?";
        return getJdbcTemplate().queryForObject(sql, new StudentRowMapper(), studentId);
    }

    @Override
    public List<Student> findAll() {
        String sql = "SELECT studentId, fullName, phone, email, gender, level, address, loginName, role, loginStatus"
                + " FROM student";
        return getJdbcTemplate().query(sql, new StudentRowMapper());
    }

    @Override
    public List<Student> findByProperty(String propName, Object propValue) {
        String sql = "SELECT studentId, fullName, phone, email, gender, level, address, loginName, role, loginStatus"
                + " FROM student WHERE "+propName+"=?";
        return getJdbcTemplate().query(sql, new StudentRowMapper(),propValue);
    }
    
}
