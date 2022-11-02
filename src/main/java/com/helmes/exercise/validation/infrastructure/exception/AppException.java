package com.helmes.exercise.validation.infrastructure.exception;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class AppException extends RuntimeException {
    private final String code;
    private final String message;

    public AppException(String code, String message) {
        super(code);
        this.code = code;
        this.message = message;
    }

}