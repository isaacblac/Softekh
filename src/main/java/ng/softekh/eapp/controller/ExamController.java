/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ng.softekh.eapp.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import ng.softekh.eapp.command.ExamCommand;
import ng.softekh.eapp.domain.Exam;
import ng.softekh.eapp.service.ExamService;
import ng.softekh.eapp.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author ISAAC BLACK
 */
@Controller
public class ExamController {

    @Autowired
    private ExamService examService;

    @RequestMapping(value = "/student/student_exam")
    public String studentTest(Model m) {
        ExamCommand cmd = new ExamCommand();
        m.addAttribute("command", cmd);
        return "student_exam"; //JSP: Student Exam Page
    }       
    @RequestMapping(value = "/student/rlist")
    public String studentResult(Model m){
        List<Exam> result = examService.findAllResult();
        m.addAttribute("studentResult", result);
        return "rlist";
    }
    @RequestMapping(value = "/student/del_score")
    public String deleteScore(@RequestParam("eid") Integer examId){
        examService.delete(examId);
        return "redirect:rlist?act=del";
    }
    
    @RequestMapping("/result/bulk_sdelete")
    public String deleteBulkStudent(@RequestParam("eid") Integer[] studentIds) {
        examService.delete(studentIds);
        return "redirect:/student/rlist?act=del";
    }
    
    @RequestMapping(value = "/student/save_test")
    public String saveTest(Model m, @ModelAttribute("command") ExamCommand cmd, HttpSession session) {
        Integer role = (Integer) session.getAttribute("role");
        if (role.equals(StudentService.ROLE_ADMIN)) {
            //Admin users are not eligible to take the test
            m.addAttribute("err", "Admin Users are not eligible to take the test!");
            return "dashboard_admin";
        } else if ((role).equals(StudentService.ROLE_STUDENT)) {            
            try {
                //Fetch studentId, fullName, and level from logged in student (session) and set into (exam) valuable
                Integer studentId = (Integer) session.getAttribute("studentId");
                String fullName = (String) session.getAttribute("fullName");
                String level = (String) session.getAttribute("level");
                Exam exam = cmd.getExam();
                exam.setStudentId(studentId);
                exam.setFullName(fullName);
                exam.setLevel(level);
                //Generate student score
                Integer score = null;
                Integer Q1 = 0;Integer Q2 = 0;Integer Q3 = 0;Integer Q4 = 0;Integer Q5 = 0;
                Integer Q6 = 0;Integer Q7 = 0;Integer Q8 = 0;Integer Q9 = 0;Integer Q10 = 0; 
                          
                //Compare student answer with the actual answer and generate student score
                if (exam.getQuestion1().equals("b")) {
                    Q1 = 1;
                }
                if (exam.getQuestion2().equals("a")) {
                    Q2 = 1;
                }
                if (exam.getQuestion3().equals("d")) {
                    Q3 = 1;
                }
                if (exam.getQuestion4().equals("a")) {
                    Q4 = 1;
                }
                if (exam.getQuestion5().equals("c")) {
                    Q5 = 1;
                }
                if (exam.getQuestion6().equals("b")) {
                    Q6 = 1;
                }
                if (exam.getQuestion7().equals("c")) {
                    Q7 = 1;
                }
                if (exam.getQuestion8().equals("d")) {
                    Q8 = 1;
                }
                if (exam.getQuestion9().equals("c")) {
                    Q9 = 1;
                }
                if (exam.getQuestion10().equals("a")) {
                    Q10 = 1;
                }
                score = Q1 + Q2 + Q3 + Q4 + Q5 + Q6 + Q7 + Q8 + Q9 + Q10;
                //Now insert values including student score into (exam) database table
                exam.setScore(score);                
                examService.save(exam);
                m.addAttribute("testScore", exam);
                //Set test score 
                session.setAttribute("fullName", exam.getFullName());
                session.setAttribute("studentScore", score);
                return "redirect:student_score";
            } catch (Exception e) {
                //TEST FAIL
                e.printStackTrace();
                m.addAttribute("err", "Fail to save test!");
                return "student_exam"; // JSP PAGE
            }
        } else {
            //Unknown user role
            m.addAttribute("err", "Role Unknown!");
            return "index"; // JSP PAGE
        }
    }
    @RequestMapping(value = "/student/student_score")
    public String studentScore(Model m){       
        return "student_score";
    }
    
    @RequestMapping(value = {"/student/test_score"})
    @ResponseBody
    public String testScore(HttpSession session) {
       try {
           //Get test score
            Integer score = (Integer) session.getAttribute("studentScore");
            String fullName = (String) session.getAttribute("fullName");
            return "Thank you '" +fullName+ "' for completing the Test, You scored : " +score+"/10";
        } catch (Exception e) {
            //FAIL
            e.printStackTrace();
            return "ERROR: Test score not available";
        }
    }
}
