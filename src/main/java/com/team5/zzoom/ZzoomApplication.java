package com.team5.zzoom;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling // 스케쥴러 사용
@SpringBootApplication //(scanBasePackages = {"com.team5.zzoom.dao.MemberDAO"})
public class ZzoomApplication {

	public static void main(String[] args) {
		SpringApplication.run(ZzoomApplication.class, args);
	}

}
