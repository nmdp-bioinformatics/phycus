package org.nmdp.hfcus.model;

import io.swagger.model.MethodData;
import io.swagger.model.MethodList;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class MethodSet {

    public MethodSet(){
        //intentionally left empty
    }

    public MethodSet(MethodData swaggerObject) {
        if (swaggerObject.getMethodList().getMethod() != null){
            methodList = new ArrayList<>();
            for (io.swagger.model.Method method : swaggerObject.getMethodList().getMethod() ){
                methodList.add(new Method(method));
            }
        }
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String id;
    @OneToMany(cascade = CascadeType.ALL)
    private List<Method> methodList;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public List<Method> getMethodList() {
        return methodList;
    }

    public void setMethodList(List<Method> methodList) {
        this.methodList = methodList;
    }

    public MethodData toSwaggerObject(){
        MethodData data = new MethodData();
        if (methodList != null){
            List<io.swagger.model.Method> methods = new ArrayList<>();
            for (Method method: methodList) {
                methods.add(method.toSwaggerObject());
            }
            MethodList list = new MethodList();
            list.setMethod(methods);
            data.setMethodList(list);
        }
        return data;
    }
}
