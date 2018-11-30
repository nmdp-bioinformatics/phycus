package org.nmdp.hfcus.model;

import io.swagger.model.MethodData;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.nmdp.hfcus.model.exceptions.RequiredFieldInvalidException;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
public class MethodSet implements ICurationDataModel<MethodData> {

    MethodSet(MethodData swaggerObject) {
        if (swaggerObject.getMethodList() != null){
            methodList = new ArrayList<>();
            for (io.swagger.model.Method method : swaggerObject.getMethodList() ){
                methodList.add(new Method(method));
            }
            if (methodList.size() == 0){
                throw new RequiredFieldInvalidException("method list must not be empty");
            }
        }
        else
        {
            throw new RequiredFieldInvalidException("requires method list");
        }
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @OneToMany(cascade = CascadeType.ALL)
    private List<Method> methodList;

    @Override
    public MethodData toSwaggerObject(){
        MethodData data = new MethodData();
        if (methodList != null){
            List<io.swagger.model.Method> methods = new ArrayList<>();
            for (Method method: methodList) {
                methods.add(method.toSwaggerObject());
            }
            data.setMethodList(methods);
        }
        return data;
    }
}
