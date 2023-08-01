@isTest
public class AnimalLocatorTest {
    @isTest static void testTrailCalloutChallange() {
        
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        String AnimalName = AnimalLocator.getAnimalNameById(1);
        system.assert(AnimalName=='chicken');
        
    }
}