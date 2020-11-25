package com.example.demo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

/**
 * 
 * @author fzczj
 *
 */
@Component
public class OkHttpUtil {

	private static final Logger logger = LoggerFactory.getLogger(OkHttpUtil.class);

	private OkHttpClient okhttpClient = new OkHttpClient.Builder().build();
	

    public String Get(String url) {
    	String result = null;
    	Request request = new Request.Builder()
                .url(url)
//                .header("Content-Type", "application/json")
                .build();
    	logger.info("Get url {}",url);
    	try (Response response = okhttpClient.newCall(request).execute()) {
    		logger.info("请求返回的response{}",response.toString());
    		result = response.body().string();
        } catch (Exception e) {
            logger.error("get url error:{}",url,e);
        }
        return result;
    }
    
    public String post(String url, String json) {
    	String result = null;
        RequestBody body = RequestBody.create(MediaType.parse("application/json; charset=utf-8"), json);
        Request request = new Request.Builder()
          .url(url)
          .post(body)
          .build();
        try ( Response response = okhttpClient.newCall(request).execute();){
        	logger.info("请求返回的response{}",response.toString());
        	result = response.body().string();
		} catch (Exception e) {
			logger.error("post url error:{}",url,e);
		}
        return result;
    }
}
