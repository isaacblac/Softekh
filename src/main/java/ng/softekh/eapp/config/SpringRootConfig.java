package ng.softekh.eapp.config;


import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 *
 * @author ISAAC BLACK
 */
@Configuration
@ComponentScan(basePackages = {"ng.softekh.eapp.dao", "ng.softekh.eapp.service"})
public class SpringRootConfig {
    //Services, DAO, DataSource Email Sender or some other business layer beans
    @Bean
    public BasicDataSource getDataSource(){
        BasicDataSource ds = new BasicDataSource();
        ds.setDriverClassName("com.mysql.jdbc.Driver");
        ds.setUrl("jdbc:mysql://localhost:3304/eapp_db");
        ds.setUsername("root");
        ds.setPassword("isaac");
        ds.setMaxTotal(2);
        ds.setInitialSize(1);
        ds.setTestOnBorrow(true);
        ds.setValidationQuery("SELECT 1");
        ds.setDefaultAutoCommit(true);
        return ds;
    }
    
}
