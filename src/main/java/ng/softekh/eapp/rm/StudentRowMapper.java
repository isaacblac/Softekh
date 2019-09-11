package ng.softekh.eapp.rm;

import java.sql.ResultSet;
import java.sql.SQLException;
import ng.softekh.eapp.domain.Student;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author ISAAC BLACK
 */
public class StudentRowMapper implements RowMapper<Student> {

    @Override
    public Student mapRow(ResultSet rs, int i) throws SQLException {
        Student s = new Student();
        s.setStudentId(rs.getInt("studentId"));
        s.setFullName(rs.getString("fullName"));
        s.setPhone(rs.getString("phone"));
        s.setEmail(rs.getString("email"));
        s.setGender(rs.getString("gender"));
        s.setLevel(rs.getString("level"));
        s.setAddress(rs.getString("loginName"));
        s.setLoginName(rs.getString("fullName"));
        s.setRole(rs.getInt("role"));
        s.setLoginStatus(rs.getInt("loginStatus"));
        return s;
    }

}
