package courses.summ475;

import myCom.ConsolColor;

public
class Adult extends Person
{
  
  public
  Adult( String num, long id ) {
    this( num, id, null, null,  );
  
    
  }
  
  public
  Adult( String purchase_order_num, long id, String fName, String lName, int myColor ) {
    super( purchase_order_num, id,fName, lName, myColor );
    setJob( "Netflix consumer" );
  
    announceMe( "n Adult" );// the announceMe(String ima) function is set to start with
    // System.out.println("I am a"+ima);
  }
  
  
  public
  void setJob( String job ) {
    super.setJob( job );
  }
}
