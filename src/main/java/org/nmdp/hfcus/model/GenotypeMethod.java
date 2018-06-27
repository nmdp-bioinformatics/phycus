package org.nmdp.hfcus.model;


import javax.persistence.*;

@Entity
public class GenotypeMethod implements ICurationDataModel<io.swagger.model.GenotypeMethod> {

    public GenotypeMethod(){
        //intentionally left empty
    }

    public GenotypeMethod(io.swagger.model.GenotypeMethod swaggerObject){
        methodLabel = swaggerObject.getMethodLabel();
        methodValue = swaggerObject.getMethodValue();
        methodComment = swaggerObject.getMethodComment();
        methodReference = swaggerObject.getMethodReference();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Enumerated(EnumType.STRING)
    private io.swagger.model.GenotypeMethod.MethodLabelEnum methodLabel;
    private String methodValue;
    private String methodComment;
    private String methodReference;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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

    public String getMethodReference() {
        return methodReference;
    }

    public void setMethodReference(String methodReference) {
        this.methodReference = methodReference;
    }

    @Override
    public io.swagger.model.GenotypeMethod toSwaggerObject(){
        io.swagger.model.GenotypeMethod data = new io.swagger.model.GenotypeMethod();
        data.setMethodLabel(methodLabel);
        data.setMethodValue(methodValue);
        data.setMethodComment(methodComment);
        data.setMethodReference(methodReference);
        return data;
    }
}
