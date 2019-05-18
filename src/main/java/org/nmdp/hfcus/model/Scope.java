package org.nmdp.hfcus.model;

import io.swagger.model.ScopeElement;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Data
@NoArgsConstructor
public class Scope implements ICurationDataModel<ScopeElement> {

    Scope(ScopeElement swaggerObject) {
        name = swaggerObject.getName();
        freeName = swaggerObject.getFreeName();
        typeOfScope = swaggerObject.getTypeOfScope();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long scopeId;
    private String name;
    private String freeName;
    @Enumerated(EnumType.STRING)
    private ScopeElement.TypeOfScopeEnum typeOfScope;

    @Override
    public ScopeElement toSwaggerObject(){
        ScopeElement data = new ScopeElement();
        data.setName(name);
        data.setFreeName(freeName);
        data.setTypeOfScope(typeOfScope);
        return data;
    }
}
