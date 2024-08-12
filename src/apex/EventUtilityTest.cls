@isTest
public class EventUtilityTest {
	@isTest
    public static void testEventStatusLength(){
       String res = EventUtility.eventPriority('IND');
            System.assertEquals(null,res);
    }
    @isTest
     public static void testEventPri1(){
       String res = EventUtility.eventPriority('CS');
            System.assertEquals(null,res);
    }
}