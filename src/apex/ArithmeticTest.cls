@IsTest
public class ArithmeticTest {
    @isTest
    private static void addTest(){
        Test.startTest();
        Integer result = Arithmetic.add(10, 20);
        Test.stopTest();
        System.assertEquals(30,result,'Actual and expected results not matching');
    }

}