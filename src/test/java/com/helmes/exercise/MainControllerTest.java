package com.helmes.exercise;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(controllers = MainController.class)
class MainControllerTest {

    @MockBean
    MainService mainService;
    @MockBean
    MainRepository mainRepository;
    @Autowired
    private MockMvc mockMvc;

    @Test
    void getSectors() throws Exception {
        when(mainService.getSectors()).thenReturn(List.of());
        mockMvc.perform(get("/get-sectors"))
                .andExpect(status().isOk())
                .andExpect(content().json("[]"));
    }

}