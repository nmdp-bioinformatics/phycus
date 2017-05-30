package org.nmdp.hfcus.model;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class GenotypeMethod {

    public GenotypeMethod(){
        //intentionally left empty
    }

    public GenotypeMethod(io.swagger.model.GenotypeMethod swaggerObject){
        methodLabel = swaggerObject.getMethodLabel();
        methodValue = swaggerObject.getMethodValue();
        methodComment = swaggerObject.getMethodComment();
        methoReference = swaggerObject.getMethodReference();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String id;
    private io.swagger.model.GenotypeMethod.MethodLabelEnum methodLabel;
    private String methodValue;
    private String methodComment;
    private String methoReference;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public io.swagger.model.GenotypeMethod.MethodLabelEnum getMethodLabel() {
        return methodLabel;
    }

    public void setMethodLabel(io.swagger.model.GenotypeMethod.MethodLabelEnum methodLabel) {
        this.methodLabel = methodLabel;
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

    public String getMethoReference() {
        return methoReference;
    }

    public void setMethoReference(String methoReference) {
        this.methoReference = methoReference;
    }

    public io.swagger.model.GenotypeMethod toSwaggerObject(){
        io.swagger.model.GenotypeMethod data = new io.swagger.model.GenotypeMethod();
        data.setMethodLabel(methodLabel);
        data.setMethodValue(methodValue);
        data.setMethodComment(methodComment);
        data.setMethodReference(methoReference);
        return data;
    }
}
