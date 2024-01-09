import com.intuit.karate.junit5.Karate;



public class petRunner {
    @Karate.Test
    Karate testFindByStatus() {
        return Karate.run("classpath:petGet.feature");
    }
}
