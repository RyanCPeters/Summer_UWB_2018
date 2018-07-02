package courses.summ475;
import myCom.ConsolColor;

public
class Student extends Person
{
  
  public
  Student( String num, long id ) {
    this( num, id, null, null );
  }
  public
  Student(
    String purchase_order_num, long id, String fName, String lName ) {
    super( purchase_order_num, id, fName, lName );
  
    announceMe( " Student" );// the announceMe(String ima) function is set to start with
    setJob( "" );
    // System.out.println("I am a"+ima);
    
  }
}
