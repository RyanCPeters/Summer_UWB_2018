package myCom.company;

import courses.summ475.*;
import myCom.ConsolColor;

public class Main {
    public static int idNums = 0;
    public static String orderNums = "a";
    
    public static void main(String[] args) {
        // write your code here
        
        Person p1 = new Person(orderNums, idNums++, "Jimmy","P1");
        orderNums += "a";
        Person p2 = new Person(orderNums, idNums++, "Jenny", "P2");
        
        p1 = new Adult( p1.getPURCHASE_ORDER_NUM(),p1.PERSON_ID );
        p2 = new Student(p2.getPURCHASE_ORDER_NUM(), p2.PERSON_ID);
    }
}
