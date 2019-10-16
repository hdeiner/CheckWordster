package test.java.com.deinersoft.checkwordster.client;

import com.deinersoft.checkwordster.server.CheckWordsterServer;
import com.github.tomakehurst.wiremock.WireMockServer;
import com.github.tomakehurst.wiremock.common.SingleRootFileSource;
import com.github.tomakehurst.wiremock.core.WireMockConfiguration;
import com.github.tomakehurst.wiremock.standalone.JsonFileMappingsLoader;
import org.apache.commons.lang3.SystemUtils;
import us.monoid.json.JSONObject;
import us.monoid.web.JSONResource;
import us.monoid.web.Resty;

import java.net.URI;
import java.net.URL;

import static us.monoid.web.Resty.content;

public class CheckWordsterClient {
    private String numberInWords;
    private String whichServer;
    private static WireMockServer wireMockServer;
    private static Process serverRuntime;
    private static CheckWordsterServer checkWordsterServer;
    private static Thread serverThread;

    public CheckWordsterClient(String whichServer) throws Exception {
        this.whichServer = whichServer;
    }

    public void startServer() throws Exception {
        if (whichServer.equals("local")) {
            String execString;

            if (SystemUtils.IS_OS_WINDOWS) {
                execString = "java -jar .\\target\\CheckWordster-0.0.1-SNAPSHOT-server.jar";
            } else {
                execString = "java -jar ./target/CheckWordster-0.0.1-SNAPSHOT-server.jar";
            }
            serverRuntime = Runtime.getRuntime().exec(execString);
            Thread.sleep(1000);
        }
        if (whichServer.equals("fake")) {
            WireMockConfiguration wireMockConfiguration = new WireMockConfiguration();
            wireMockConfiguration.port(9000);
            wireMockConfiguration.browserProxyingEnabled();
            wireMockConfiguration.fileSource(new SingleRootFileSource("./wiremock"));

            wireMockServer=new WireMockServer(wireMockConfiguration);
            wireMockServer.loadMappingsUsing(new JsonFileMappingsLoader(new SingleRootFileSource("./wiremock/mappings")));

            wireMockServer.start();
        }
        if (whichServer.equals("wiremock-container")) {
            String execString = "docker-compose up -d";
            serverRuntime = Runtime.getRuntime().exec(execString);
            Thread.sleep(10000);
        }

    }

    public Process getServerRunTime() {
        return serverRuntime;
    }

    public void stopServer() throws Exception {
        if (whichServer.equals("fake")) wireMockServer.stop();
        if (whichServer.equals("local")) serverRuntime.destroyForcibly();
        if (whichServer.equals("wiremock-container")) {
            String execString = "docker-compose down";
            serverRuntime = Runtime.getRuntime().exec(execString);
            Thread.sleep(1000);
        }
    }

    public String getWords(String numberInDigits) throws Exception {
        Resty resty  = new Resty();

        URL url = null;
        URI uri;

        if (whichServer.equals("fake")) url = new URL("http://0.0.0.0:9000/checkWordster");
        if (whichServer.equals("local")) url = new URL("http://0.0.0.0:9090/checkWordster");
        if (whichServer.equals("wiremock-container")) url = new URL("http://0.0.0.0:9999/checkWordster");

        uri = new URI(url.getProtocol(), url.getUserInfo(), url.getHost(), url.getPort(), url.getPath(), url.getQuery(), url.getRef());
        String requestToPost = "{\"numberInDigits\": \"" + numberInDigits + "\"}";

        JSONResource response = resty.json(uri,content(new JSONObject(requestToPost)));
        numberInWords = (String) response.get("numberInWords");

        return numberInWords;
    }

}