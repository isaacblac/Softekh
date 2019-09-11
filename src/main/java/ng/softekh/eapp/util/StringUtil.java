package ng.softekh.eapp.util;

/**
 * This class contains utility methods related to string operation
 * @author ISAAC BLACK
 */
public class StringUtil {
    public static String toCommaSeparatedString(Object[] items) {
        StringBuilder sb = new StringBuilder();
        for (Object item : items) {
            sb.append(item).append(",");
        }
        if (sb.length() > 0) {
            sb.deleteCharAt(sb.length() - 1);
        }
        return sb.toString();
    }
}
