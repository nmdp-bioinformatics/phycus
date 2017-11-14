package org.nmdp.hfcus.controller;

import io.swagger.model.Error;
import org.nmdp.hfcus.model.exceptions.RequiredFieldInvalidException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class RestResponseEntityExceptionHandler{
    @ExceptionHandler(RequiredFieldInvalidException.class)
    private ResponseEntity<Error> requiredFieldInvalidExceptionHandler(RequiredFieldInvalidException ex){
        Error error = new Error();
        error.setMessage(ex.getMessage());
        return new ResponseEntity<>(error, HttpStatus.BAD_REQUEST);
    }
}
