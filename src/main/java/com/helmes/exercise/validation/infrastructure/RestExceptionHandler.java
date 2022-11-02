package com.helmes.exercise.validation.infrastructure;

import com.helmes.exercise.validation.infrastructure.error.ApiError;
import com.helmes.exercise.validation.infrastructure.exception.AppException;
import org.springframework.beans.TypeMismatchException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import java.util.ArrayList;
import java.util.List;

@ControllerAdvice
public class RestExceptionHandler extends ResponseEntityExceptionHandler {

    @ExceptionHandler
    public ResponseEntity<ApiError> handleAppException(AppException exception) {
        ApiError apiError = new ApiError();
        apiError.setCode(exception.getCode());
        apiError.setMessage(exception.getMessage());
        return new ResponseEntity<>(apiError, HttpStatus.BAD_REQUEST);

    }


    @Override
    protected ResponseEntity<Object> handleHttpMessageNotReadable(HttpMessageNotReadableException exception, HttpHeaders headers, HttpStatus status, WebRequest request) {
        ApiError apiError = new ApiError();
        apiError.setCode("Invalid request body content.");
        apiError.setMessage(exception.getMessage());
        return handleExceptionInternal(exception, apiError, headers, HttpStatus.BAD_REQUEST, request);
    }

    @Override
    protected ResponseEntity<Object> handleTypeMismatch(TypeMismatchException exception, HttpHeaders headers, HttpStatus status, WebRequest request) {
        ApiError apiError = new ApiError();
        apiError.setCode("Invalid parameter type.");
        apiError.setMessage(exception.getMessage());
        return handleExceptionInternal(exception, apiError, headers, HttpStatus.BAD_REQUEST, request);
    }

    @Override
    protected ResponseEntity<Object> handleMethodArgumentNotValid(final MethodArgumentNotValidException exception, final HttpHeaders headers, final HttpStatus status, final WebRequest request) {
        ApiError apiError = new ApiError();
        apiError.setCode("Invalid request body content.");
        final List<String> errors = new ArrayList<>();
        for (final FieldError error : exception.getBindingResult().getFieldErrors()) {
            errors.add(error.getField() + ": " + error.getDefaultMessage());
        }
        for (final ObjectError error : exception.getBindingResult().getGlobalErrors()) {
            errors.add(error.getObjectName() + ": " + error.getDefaultMessage());
        }
        apiError.setMessage(errors.toString());
        return handleExceptionInternal(exception, apiError, headers, HttpStatus.BAD_REQUEST, request);
    }
}
