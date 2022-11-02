package com.helmes.exercise.validation;


import com.helmes.exercise.Person;
import com.helmes.exercise.validation.infrastructure.exception.AppException;
import org.springframework.stereotype.Service;

@Service
public class ValidationService {

    public static final String NAME_REQUIRED = "NONAME";
    public static final String SECTORS_REQUIRED = "NOSECTOR";

    public void isFormCorrect(Person person) {
        if (person.getName().isEmpty()) {
            throw new AppException(NAME_REQUIRED, "Name required!");
        }
        if (person.getSectorIds().length == 0){
            throw new AppException(SECTORS_REQUIRED, "Sectors required!");
        }
    }
}
