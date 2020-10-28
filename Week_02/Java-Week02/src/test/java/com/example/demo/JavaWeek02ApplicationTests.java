package com.example.demo;

import java.util.HashMap;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.alibaba.fastjson.JSON;
/**
 * 
 * @author fzczj
 *
 */
@SpringBootTest
class JavaWeek02ApplicationTests {

	@Autowired
	OkHttpUtil OkHttpUtil;
	
	@Test
	void contextLoads() {
		String get = OkHttpUtil.Get("http://localhost:8801");
		System.out.println(get);
		String post = OkHttpUtil.post("http://localhost:8801",null);
		System.out.println(post);
		
		//本地项目测试
//		Map<String,String> map = new HashMap<>();
//		map.put("test", "GeekTime");
//		//原来没有加Http://的时候报错
//		String post = OkHttpUtil.post("http://localhost:8080/iotprint/print/select", JSON.toJSONString(map));
//		System.out.println(post);
	}

}
