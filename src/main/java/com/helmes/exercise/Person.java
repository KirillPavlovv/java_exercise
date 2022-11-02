package com.helmes.exercise;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.experimental.Accessors;
import org.springframework.context.annotation.Configuration;

@Data
@Accessors(chain = true)
@Configuration
public class Person {
    int id;
    String name;
    Integer [] sectorIds;
    @JsonProperty("isAgree")
    boolean isAgree;
}
