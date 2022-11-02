package com.helmes.exercise;

import com.helmes.exercise.validation.ValidationService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class MainServiceTest {

    @InjectMocks
    MainService mainService = new MainService();

    @Mock
    private MainRepository mainRepository;

    Person person = new Person()
            .setId(1)
            .setName("Erki")
            .setAgree(true)
            .setSectorIds(new Integer[]{1,2});

    @Test
    void getSectors() {
        List<Sector> sectors = List.of(new Sector()
                .setId(1)
                .setName("Manufacturing")
                .setDepth(1)
                .setPath("Manufacturing")
                .setParentId(0));

        when(mainRepository.getSectors()).thenReturn(sectors);
        List<Sector> result = mainService.getSectors();
        assertThat(sectors).isEqualTo(result);
    }

    @Test
    void handlePersonRequestWhenPersonExists() {
        mainService.validationService = new ValidationService();
        when(mainRepository.update(person)).thenReturn(1);
        int result = mainService.handlePersonRequest(person);
        assertThat(1).isEqualTo(result);
    }

    @Test
    void handlePersonRequestWhenPersonNotExists() {
        Person person = new Person()
                .setId(0)
                .setName("John")
                .setAgree(true)
                .setSectorIds(new Integer[]{1});

        mainService.validationService = new ValidationService();
        when(mainRepository.save(person)).thenReturn(2);
        int result = mainService.handlePersonRequest(person);
        assertThat(2).isEqualTo(result);
    }

    @Test
    void getPersonData() {
        when(mainRepository.getData(person.getId())).thenReturn(person);
        Person result = mainService.getPersonData(person.getId());
        assertThat(person).isEqualTo(result);
    }
}