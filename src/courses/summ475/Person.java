package courses.summ475;

import myCom.ConsolColor;

public
class Person
{
  private String fName = "";
  private String lName = "";
  private String job = "";
  public final String PURCHASE_ORDER_NUM;
  public final long PERSON_ID;
  private final String myColor;
  
  enum myColorEnum{
    blk_bld_brt, rd_bld_brt, grn_bld_brt, ylo_bld_brt, blu_bld_brt, prpl_bld_brt, cyan_bld_brt,wht_bld_brt
  }

  
  public
  Person( String purchase_order_num, long id, String fName, String lName, int myColor ) {
    
    PURCHASE_ORDER_NUM = purchase_order_num;
    this.PERSON_ID = id;
    this.fName += fName;
    this.lName += lName;
    this.job += "Minion";
    
    
    
    this.myColor = myColor;
    
    
    
    announceMe( " Person" );
  }
  
  public
  void announceMe(String ima){
  
    System.out.println( "I am a"+ima );
    System.out.printf( "My PERSON_ID number is: %d%n", PERSON_ID );
    System.out.println( String.format( "My name is %s %s", getfName(), getlName() ) );
    System.out.println();
    System.out.println();
    
  }
  
  
  public
  String getfName() {
    return fName;
  }
  public
  void setfName( String fName ) {
    this.fName = fName;
  }
  public
  String getlName() {
    return lName;
  }
  public
  void setlName( String lName ) {
    this.lName = lName;
  }
  public
  String getJob() {
    return job;
  }
  protected
  void setJob( String job ) {
    this.job = job;
  }
  public
  String getPURCHASE_ORDER_NUM() {
    return PURCHASE_ORDER_NUM;
  }
  public
  long getPERSON_ID() {
    return PERSON_ID;
  }
}
