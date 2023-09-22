package api.runner;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
	@Karate.Test
	public Karate runTest() {
//		address for our feature
//		And tags
		return Karate.run("classpath:Features")
				.tags("@Regression");
	}

}
