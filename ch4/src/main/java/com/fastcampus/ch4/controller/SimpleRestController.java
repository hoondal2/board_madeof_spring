package com.fastcampus.ch4.controller;

import com.fastcampus.ch4.domain.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class SimpleRestController {
    @GetMapping("/test")
    public String test() {
        return "test";
    }

    @GetMapping("/ajax")
    public String ajax() {
        return "ajax";
    }

    @PostMapping("/send")
    @ResponseBody // 응답을 바디로 보냄 (보낼 때 json문자열로 바뀜)
    public Person test(@RequestBody Person p) { // jackson-databind 라이브러리에서 받아온 문자열을 자바 객체로 변환, 바인딩
        System.out.println("p = " + p);         // @RequestBody : 요청 바디에 있는 내용을 객체로 바꾼다고 명시
        p.setName("ABC");
        p.setAge(p.getAge() + 10);

        return p; // jackson이 json문자열로 변환
                  // 뷰 이름이 아닌, 객체를 반환
    }
}