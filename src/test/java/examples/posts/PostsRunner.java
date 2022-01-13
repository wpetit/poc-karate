package examples.posts;

import com.intuit.karate.junit5.Karate;

public class PostsRunner {

    @Karate.Test
    Karate postManagement() {
        return Karate.run("posts").relativeTo(getClass());
    }
}
