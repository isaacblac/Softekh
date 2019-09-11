package ng.softekh.eapp.command;

/**
 *
 * @author ISAAC BLACK
 */
public class LoginCommand {
    private String loginName;
    private String password;

    public LoginCommand() {
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
}
