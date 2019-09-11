package ng.softekh.eapp.controller;

import javax.servlet.http.HttpSession;
import ng.softekh.eapp.command.LoginCommand;
import ng.softekh.eapp.domain.Student;
import ng.softekh.eapp.exception.StudentBlockedException;
import ng.softekh.eapp.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author ISAAC BLACK
 */
@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;

    @RequestMapping(value = {"/", "/index"})
    public String index(Model m) {
        m.addAttribute("command", new LoginCommand());
        return "index"; //JSP
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String handleLogin(Model m, @ModelAttribute("command") LoginCommand cmd, HttpSession session) {
        try {
            Student loggedInStudent = studentService.login(cmd.getLoginName(), cmd.getPassword());
            if (loggedInStudent == null) {
                //Add error message and go back to the login-form
                m.addAttribute("err", "Login failed, Enter valid credentials");
                return "index"; //JSP
            } else {
                //SUCCESS
                if (loggedInStudent.getRole().equals(StudentService.ROLE_ADMIN)) {
                    //Add admin details in session(Assign session to logged in admin)
                    addStudentInSession(loggedInStudent, session);
                    return "redirect:admin/dashboard";
                } else if (loggedInStudent.getRole().equals(StudentService.ROLE_STUDENT)) {
                    //Add student details in session(Assign session to logged in student)
                    addStudentInSession(loggedInStudent, session);
                    return "redirect:student/dashboard";
                } else {
                    //Add error message and go back to the login-form
                    m.addAttribute("err", "Invalid ROLE");
                    return "index"; //JSP
                }
            }
        } catch (StudentBlockedException ex) {
            //Add error message and go back to the login-form
            m.addAttribute("err", ex.getMessage());
            return "index"; //JSP
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:index?act=lo";
    }

    @RequestMapping("/student/dashboard")
    public String studentDashboard() {
        return "dashboard_student"; //JSP
    }

    @RequestMapping("/admin/dashboard")
    public String adminDashboard() {
        return "dashboard_admin"; //JSP
    }

    @RequestMapping("/reg_form")
    public String registrationForm(Model m) {
        Student student = new Student();
        m.addAttribute("command", student);
        return "reg_form";
    }

    @RequestMapping("/student/slist")
    public String studentList(Model m) {
        m.addAttribute("studentList", studentService.getStudentList());
        return "slist"; //JSP
    }
    @RequestMapping("/student/student_search")
    public String studentSearch(Model m, @RequestParam("freeText") String freeText) {
        m.addAttribute("studentList", studentService.findStudent(freeText));
        return "slist"; //JSP
    }

    @RequestMapping("/student/del_student")
    public String deleteStudent(@RequestParam("sid") Integer studentId) {
        studentService.delete(studentId);
        return "redirect:slist?act=del";
    }
    
    @RequestMapping("/student/bulk_sdelete")
    public String deleteBulkStudent(@RequestParam("sid") Integer[] studentIds) {
        studentService.delete(studentIds);
        return "redirect:slist?act=del";
    }

    @RequestMapping("/student/edit_student")
    public String prepareEditForm(@RequestParam("sid") Integer studentId, Model m, HttpSession session) {
        session.setAttribute("aStudentId", studentId);
        Student student = studentService.findById(studentId);
        m.addAttribute("command", student);
        return "reg_form"; //JSP
    }

    @RequestMapping("/register")
    public String updateOrRegisterStudent(@ModelAttribute("command") Student student, Model m, HttpSession session) {
        Integer studentId = (Integer) session.getAttribute("aStudentId");
        if (studentId == null) {
            try {
                student.setRole(StudentService.ROLE_STUDENT);
                student.setLoginStatus(StudentService.LOGIN_STATUS_ACTIVE);
                studentService.register(student);
                return "redirect:index?act=reg";
            } catch (DuplicateKeyException e) {
                e.printStackTrace();
                m.addAttribute("err", "Username is already registered: Please, select another username!");
                return "reg_form";
            }
        } else {
            try {
                student.setStudentId(studentId);
                studentService.update(student);
                return "redirect:/student/slist?act=ed";
            } catch (DuplicateKeyException e) {
                e.printStackTrace();
                m.addAttribute("err", "Username is already registered: Please, select another username!");
                return "reg_form";
            }
        }
    }

    private void addStudentInSession(Student s, HttpSession session) {
        session.setAttribute("student", s);
        session.setAttribute("studentId", s.getStudentId());
        session.setAttribute("role", s.getRole());
        session.setAttribute("fullName", s.getFullName());
        session.setAttribute("level", s.getLevel());
    }
    @RequestMapping("/student/change_status")
    @ResponseBody
    public String changeLoginStatus(@RequestParam Integer studentId, @RequestParam Integer loginStatus, HttpSession session) {
        try {
            studentService.changeLoginStatus(studentId, loginStatus);
            return "SUCCES : Status Changed";
        } catch (Exception e) {
            e.printStackTrace();
            return "ERROR : Unable To Change Status";
        }
    }
    
    @RequestMapping("/check_avail")
    @ResponseBody
    public String checkAvailability(@RequestParam String username) {
        if(studentService.doesUsernameExist(username)){
            return "This Username is already taken : choose another name";
        }else{
            return "Yes! you can take this";
        }
    }
    
}
