package org.nmdp.hfcus.model;


import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Data
@NoArgsConstructor
public class GenotypeMethod implements ICurationDataModel<io.swagger.model.GenotypeMethod> {

    public GenotypeMethod(io.swagger.model.GenotypeMethod swaggerObject){
        methodLabel = swaggerObject.getMethodLabel();
        methodValue = swaggerObject.getMethodValue();
        methodComment = swaggerObject.getMethodComment();
        methodReference = swaggerObject.getMethodReference();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Enumerated(EnumType.STRING)
    private io.swagger.model.GenotypeMethod.MethodLabelEnum methodLabel;
    private String methodValue;
    private String methodComment;
    private String methodReference;

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
