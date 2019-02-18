package org.nmdp.hfcus.model;

import io.swagger.model.ResolutionInfo;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Data
@NoArgsConstructor
public class Resolution implements ICurationDataModel<ResolutionInfo> {

    Resolution(ResolutionInfo swaggerObject) {
        scopeElement = swaggerObject.getScopeElement();
        resolution = swaggerObject.getResolution();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String scopeElement;
    @Enumerated(EnumType.STRING)
    private io.swagger.model.ResolutionInfo.ResolutionEnum resolution;

    @Override
    public ResolutionInfo toSwaggerObject(){
        ResolutionInfo data = new ResolutionInfo();
        data.setScopeElement(scopeElement);
        data.setResolution(resolution);
        return data;
    }
}
