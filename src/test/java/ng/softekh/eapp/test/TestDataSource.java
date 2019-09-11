package ng.softekh.eapp.test;

import javax.sql.DataSource;
import ng.softekh.eapp.config.SpringRootConfig;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author ISAAC BLACK
 */
public class TestDataSource {
    public static void main(String[] args) {
    ApplicationContext ctx = new AnnotationConfigApplicationContext(SpringRootConfig.class);
    DataSource ds = ctx.getBean(DataSource.class);
    JdbcTemplate jt = new JdbcTemplate(ds);
    String sql = "INSERT INTO student(fullname, phone, email, gender, level, address, loginName, password, role, loginstatus) VALUES(?,?,?,?,?,?,?,?,?,?)";
    Object[]param = new Object[]{"Judith", "08122377624", "judith@example.com", "female", "ss3", "Lagos", "judith", "judith123", "2", "1"};
    jt.update(sql,param);
        System.out.println("-----------SQL EXECUTED SUCCESSFULLY-----------");

    }
    
}
