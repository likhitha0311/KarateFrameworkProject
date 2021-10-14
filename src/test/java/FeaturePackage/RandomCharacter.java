package FeaturePackage;
import org.apache.commons.lang3.RandomStringUtils;

public class RandomCharacter {
	
	    public static String random_Characters() {

	        String randomizedString = RandomStringUtils.randomAlphanumeric(5);
	        //char randomizedCharacter = randomizedString.charAt(0);

	        System.out.println("Generated Random Character: " + randomizedString);
	        
	        return randomizedString;

	    }

	

}
