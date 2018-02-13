package org.nmdp.hfcus.model.exceptions;

public class RequiredFieldInvalidException extends RuntimeException {
    public RequiredFieldInvalidException(String message){
        super(message);
    }
}
