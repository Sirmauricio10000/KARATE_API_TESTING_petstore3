import com.intuit.karate.junit5.Karate;



public class petTest {
    @Karate.Test
    Karate testFindByStatus() {
        return Karate.run("classpath:pets/petGetFindByStatus.feature");
    }

    @Karate.Test
    Karate testFindByTags() {
        return Karate.run("classpath:pets/petGetFindByTags.feature");
    }

    @Karate.Test
    Karate testFindById() {
        return Karate.run("classpath:pets/petGetFindById.feature");
    }
}
