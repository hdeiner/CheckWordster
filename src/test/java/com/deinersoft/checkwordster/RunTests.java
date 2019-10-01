package test.java.com.deinersoft.checkwordster;

import org.junit.runner.RunWith;

import cucumber.api.junit.Cucumber;
import cucumber.api.CucumberOptions;

@RunWith(Cucumber.class)

@CucumberOptions(
//      dryRun   = false,
//      strict = true,
//      tags     = "",
        monochrome = true,
        features = { "src/test/java/com/deinersoft/checkwordster/resources/features" },
        glue     = { "test.java.com.deinersoft.checkwordster" },
        plugin   = { "pretty", "html:target/cucumber-reports/cucumber-html-report", "json:target/cucumber-reports/cucumber-json-report.json" }
)

public class RunTests {

}