import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.masterthought.cucumber.ReportBuilder;
import java.io.File;
import net.masterthought.cucumber.Configuration;
import org.apache.commons.io.FileUtils;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;


public class petTest {

    @Test
    void PetTestParallel(){
        Results results = Runner.path("classpath:pets")
        .outputCucumberJson(true)
        .karateEnv("pet")
        .parallel(5);
        generateReport(results.getReportDir());
        assertTrue(results.getFailCount() == 0, results.getErrorMessages());
    }
    


    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "petTest");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
