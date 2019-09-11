package ng.softekh.eapp.dao;

import java.util.List;
import ng.softekh.eapp.domain.Exam;

/**
 *
 * @author ISAAC BLACK
 */
public interface ExamDAO {

    public void save(Exam e);

    public void update(Exam e);

    public void delete(Exam e);

    public void delete(Integer examId);

    public Exam findById(Integer examId);

    public List<Exam> findAll();

    public List<Exam> findByProperty(String propName, Object propValue);
}
