package ng.softekh.eapp.service;

import java.util.List;
import ng.softekh.eapp.dao.BaseDAO;
import ng.softekh.eapp.dao.ExamDAO;
import ng.softekh.eapp.domain.Exam;
import ng.softekh.eapp.rm.ExamRowMapper;
import ng.softekh.eapp.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ISAAC BLACK
 */
@Service
public class ExamServiceImpl extends BaseDAO implements ExamService{
    @Autowired
    private ExamDAO examDAO;
    
    @Override
    public void save(Exam e) {
        examDAO.save(e);
    }

    @Override
    public void update(Exam e) {
        examDAO.update(e);
    }

    @Override
    public void delete(Integer examId) {
        examDAO.delete(examId);
    }

    @Override
    public void delete(Integer[] examIds) {
        String ids = StringUtil.toCommaSeparatedString(examIds);
        String sql = "DELETE FROM exam WHERE examId IN("+ids+")";
        getJdbcTemplate().update(sql);
    }

    @Override
    public List<Exam> findAllResult() {
        return examDAO.findAll();
    }

    @Override
    public List<Exam> findAll(String txt) {
        String sql = "SELECT studentId, fullname, level, question1, question2, question3, question4, question5, question6, question7, question8, question9, question10, score "
                + " FROM exam WHERE (studentId LIKE '%"+txt+"%' OR fullName LIKE '%"+txt+"%' OR level LIKE '%"+txt+"%' OR score LIKE '%"+txt+"%')";
        return getJdbcTemplate().query(sql, new ExamRowMapper());
    }
    
}
