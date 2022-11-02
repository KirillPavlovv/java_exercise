package com.helmes.exercise;

import com.helmes.exercise.validation.ValidationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class MainService {
    @Resource
    MainRepository mainRepository;
    @Resource
    ValidationService validationService;

    public List<Sector> getSectors() {
        return mainRepository.getSectors();
    }

    public int handlePersonRequest(Person person) {
        validationService.isFormCorrect(person);
        if (person.getId() == 0) {
            return mainRepository.save(person);
        } else {
            person.setId(person.getId());
            return mainRepository.update(person);
        }
    }

    public Person getPersonData(int id) {
        return mainRepository.getData(id);
    }
}
