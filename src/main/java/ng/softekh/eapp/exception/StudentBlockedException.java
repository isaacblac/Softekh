package ng.softekh.eapp.exception;

/**
 *
 * @author ISAAC BLACK
 */
public class StudentBlockedException extends Exception{
    /**
     * Create Student Object without description
     */
    public StudentBlockedException() {
    }
    /**
     * Create Student Object with description
     */
    public StudentBlockedException(String errDesc) {
        super(errDesc);
    }
}
