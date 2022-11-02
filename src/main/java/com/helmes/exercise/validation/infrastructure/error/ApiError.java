package com.helmes.exercise.validation.infrastructure.error;

import lombok.Data;

@Data
public class ApiError {
    private String code;
    private String message;
}

