package ng.softekh.eapp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import ng.softekh.eapp.domain.Exam;
import ng.softekh.eapp.rm.ExamRowMapper;
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
public class ExamDAOImpl extends BaseDAO implements ExamDAO{
    
    @Override
    public void save(Exam e) {
        String sql = "INSERT INTO exam(studentId, fullName, level, question1, question2, question3, question4, question5, question6, question7, question8, question9, question10, score) "
                + " VALUES(:studentId, :fullName, :level, :question1, :question2, :question3, :question4, :question5, :question6, :question7, :question8, :question9, :question10, :score)";
        Map m = new HashMap();
        m.put("studentId", e.getStudentId());
        m.put("fullName", e.getFullName());
        m.put("level", e.getLevel());
        m.put("question1", e.getQuestion1());
        m.put("question2", e.getQuestion2());
        m.put("question3", e.getQuestion3());
        m.put("question4", e.getQuestion4());
        m.put("question5", e.getQuestion5());
        m.put("question6", e.getQuestion6());
        m.put("question7", e.getQuestion7());
        m.put("question8", e.getQuestion8());
        m.put("question9", e.getQuestion9());
        m.put("question10", e.getQuestion10());
        m.put("score", e.getScore());
        
        KeyHolder kh = new GeneratedKeyHolder();
        SqlParameterSource ps = new MapSqlParameterSource(m);
        super.getNamedParameterJdbcTemplate().update(sql, ps, kh);
        Integer examId = kh.getKey().intValue();
        e.setExamId(examId);
    }

    /**@Override
    public void update(Exam e) {
        String sql = "UPDATE exam "
                + " SET question1=:question1,"
                + " question2=:question2,"
                + " question3=:question3,"
                + " question4=:question4,"
                + " question5=:question5,"
                + " question6=:question6,"
                + " question7=:question7,"
                + " question8=:question8,"
                + " question9=:question9,"
                + " question10=:question10"
                + " WHERE examId=:examId";
        
        Map m = new HashMap();
        m.put("question1", e.getQuestion1());
        m.put("question2", e.getQuestion2());
        m.put("question3", e.getQuestion3());
        m.put("question4", e.getQuestion4());
        m.put("question5", e.getQuestion5());
        m.put("question6", e.getQuestion6());
        m.put("question7", e.getQuestion7());
        m.put("question8", e.getQuestion8());
        m.put("question9", e.getQuestion9());
        m.put("question10", e.getQuestion10());
        m.put("score", e.getScore());  
        getNamedParameterJdbcTemplate().update(sql, m);
    }**/

    @Override
    public void delete(Exam e) {
        this.delete(e.getExamId());
    }

    @Override
    public void delete(Integer examId) {
        String sql = "DELETE FROM exam WHERE examId=?";
        getJdbcTemplate().update(sql, examId);
    }

    @Override
    public Exam findById(Integer examId) {
        String sql = "SELECT studentId, fullName, level, question1, question2, question3, question4, question5, question6, question7, question8, question9, question10, score "
                + " FROM exam WHERE examId=?";
        return getJdbcTemplate().queryForObject(sql, new ExamRowMapper(), examId);
    }

    @Override
    public List<Exam> findAll() {
        String sql = "SELECT examId, studentId, fullName, level, question1, question2, question3, question4, question5, question6, question7, question8, question9, question10, score "
                + " FROM exam";
        return getJdbcTemplate().query(sql, new ExamRowMapper());
    }

    @Override
    public List<Exam> findByProperty(String propName, Object propValue) {
        String sql = "SELECT studentId, fullname, level, question1, question2, question3, question4, question5, question6, question7, question8, question9, question10, score "
                + " FROM exam WHERE "+propName+"=?";
        return getJdbcTemplate().query(sql, new ExamRowMapper(), propValue);
    }

    @Override
    public void update(Exam e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
