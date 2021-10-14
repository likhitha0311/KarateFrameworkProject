package FeaturePackage;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.formats.selenium.TestBase;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import static org.junit.Assert.*;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;


@KarateOptions(tags = {"~@ignore"})
public class TestRunnerforParallel 
{
		    @Test
	    public void testParallel() {
	        Results results = Runner.parallel(getClass(), 2);
	                
	        generateReport(results.getReportDir());
	        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
		    	
		    	//If you dont wanna run in parallel ignore above lines of code
		    	//generateReport("target/surefire-reports");
	    }

	    public static void generateReport(String karateOutputPath) {
	        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
	        List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
	        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
	        Configuration config = new Configuration(new File("target"), "demo");
	        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
	        reportBuilder.generateReports();
	    }

}
