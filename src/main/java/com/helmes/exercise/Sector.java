package com.helmes.exercise;

import lombok.Data;
import lombok.experimental.Accessors;
import org.springframework.context.annotation.Configuration;

@Data
@Accessors(chain = true)
@Configuration
public class Sector {
    private int id;
    private int parentId;
    private String name;
    private int depth;
    private String path;
}
