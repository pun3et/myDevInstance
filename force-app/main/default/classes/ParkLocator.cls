public class ParkLocator {
    
    public static String[] Country (String CountryName){
        
       ParkService.ParksImplPort CountryParks = new ParkService.ParksImplPort();
        String[] NameofCountryParks= CountryParks.byCountry(CountryName);
        System.debug('Country park names are'+NameofCountryParks);
        return NameofCountryParks;
        
    }

}