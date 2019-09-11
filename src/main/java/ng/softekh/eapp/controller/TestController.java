package ng.softekh.eapp.controller;



import java.util.Date;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author ISAAC BLACK
 */
@Controller
public class TestController {
    @RequestMapping(value = {"/test/hello"})
    public String helloWorld(){
        return "hello"; //JSP
    }
    @RequestMapping(value = {"/test/ajax_test"})
    public String testPage(){
        return "test"; //JSP
    }
    @RequestMapping(value = {"/test/get_time"})
    @ResponseBody
    public String getServerTime(){
        System.out.println("------------getServerTime-------------");
        Date d = new Date();
        return d.toString();
    }
}
