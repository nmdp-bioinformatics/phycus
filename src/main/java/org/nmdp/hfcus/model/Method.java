package org.nmdp.hfcus.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Method {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private io.swagger.model.Method.TypeOfMethodEnum typeOfMethod;
    private String methodValue;
    private String methodComment;
    private String methodReference;

    public Method(){
        //intentionally left empty
    }

    public Method(io.swagger.model.Method swaggerObject){
        typeOfMethod = swaggerObject.getTypeOfMethod();
        methodValue = swaggerObject.getMethodValue();
        methodComment = swaggerObject.getMethodComment();
        methodReference = swaggerObject.getMethodReference();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public io.swagger.model.Method.TypeOfMethodEnum getTypeOfMethod() {
        return typeOfMethod;
    }

    public void setTypeOfMethod(io.swagger.model.Method.TypeOfMethodEnum typeOfMethod) {
        this.typeOfMethod = typeOfMethod;
    }

    public String getMethodValue() {
        return methodValue;
    }

    public void setMethodValue(String methodValue) {
        this.methodValue = methodValue;
    }

    public String getMethodComment() {
        return methodComment;
    }

    public void setMethodComment(String methodComment) {
        this.methodComment = methodComment;
    }

    public String getMethodReference() {
        return methodReference;
    }

    public void setMethodReference(String methodReference) {
        this.methodReference = methodReference;
    }

    public io.swagger.model.Method toSwaggerObject(){
        io.swagger.model.Method data = new io.swagger.model.Method();
        data.setTypeOfMethod(typeOfMethod);
        data.setMethodValue(methodValue);
        data.setMethodComment(methodComment);
        data.setMethodReference(methodReference);
        return data;
    }
}
