@isTest
public class TemperatureTest {
	@isTest
    private static void warmTempTest(){
        Decimal res = Temparature.FtoC(70);
        System.assertEquals(21.11, res);
    }
    @isTest
    private static void coldTempTest(){
        Decimal res = Temparature.FtoC(30);
        System.assertEquals(-1.11, res);
    }
}