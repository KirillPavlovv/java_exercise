package com.helmes.exercise;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
public class MainController {

    @Resource
    MainService mainService;

    @GetMapping("get-sectors")
    public List<Sector> getSectors() {
       return  mainService.getSectors();
    }

    @PostMapping("save-person")
    public int save(@RequestBody Person person) {
        return mainService.handlePersonRequest(person);
    }

    @GetMapping("get-person-data")
    public Person getPersonData(int id) {
        return mainService.getPersonData(id);
    }
}
