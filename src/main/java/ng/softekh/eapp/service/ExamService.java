package ng.softekh.eapp.service;

import java.util.List;
import ng.softekh.eapp.domain.Exam;

/**
 * The interface specified all business operation for exam entity
 *
 * @author ISAAC BLACK
 */
public interface ExamService {
    

    public void save(Exam e);

    public void update(Exam e);

    public void delete(Integer examId);

    public void delete(Integer[] examIds);

    /**
     * This method return all the exam records
     *
     * @return
     */
    public List<Exam> findAllResult();

    /**
     * This method search for students exam records base on given free
     * text-search-criteria
     *
     * @param txt criteria use to search - free text search criteria
     * @return
     */
    public List<Exam> findAll(String txt);
    
    
}
