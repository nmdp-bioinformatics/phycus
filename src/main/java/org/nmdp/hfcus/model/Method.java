package org.nmdp.hfcus.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Data
@NoArgsConstructor
public class Method implements ICurationDataModel<io.swagger.model.Method> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Enumerated(EnumType.STRING)
    private io.swagger.model.Method.TypeOfMethodEnum typeOfMethod;
    private String methodValue;
    private String methodComment;
    private String methodReference;

    public Method(io.swagger.model.Method swaggerObject){
        typeOfMethod = swaggerObject.getTypeOfMethod();
        methodValue = swaggerObject.getMethodValue();
        methodComment = swaggerObject.getMethodComment();
        methodReference = swaggerObject.getMethodReference();
    }

    @Override
    public io.swagger.model.Method toSwaggerObject(){
        io.swagger.model.Method data = new io.swagger.model.Method();
        data.setTypeOfMethod(typeOfMethod);
        data.setMethodValue(methodValue);
        data.setMethodComment(methodComment);
        data.setMethodReference(methodReference);
        return data;
    }
}
