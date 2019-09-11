package ng.softekh.eapp.rm;

import java.sql.ResultSet;
import java.sql.SQLException;
import ng.softekh.eapp.domain.Exam;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author ISAAC BLACK
 */
public class ExamRowMapper implements RowMapper<Exam> {

    @Override
    public Exam mapRow(ResultSet rs, int i) throws SQLException {
        Exam e = new Exam();
        e.setExamId(rs.getInt("examId"));
        e.setStudentId(rs.getInt("studentId"));
        e.setFullName(rs.getString("fullName"));
        e.setLevel(rs.getString("level"));
        e.setQuestion1(rs.getString("question1"));
        e.setQuestion2(rs.getString("question2"));
        e.setQuestion3(rs.getString("question3"));
        e.setQuestion4(rs.getString("question4"));
        e.setQuestion5(rs.getString("question5"));
        e.setQuestion6(rs.getString("question6"));
        e.setQuestion7(rs.getString("question7"));
        e.setQuestion8(rs.getString("question8"));
        e.setQuestion9(rs.getString("question9"));
        e.setQuestion10(rs.getString("question10"));
        e.setScore(rs.getInt("score"));
        return e;
    }

}
