package org.nmdp.hfcus.model;

import io.swagger.model.LabelData;
import org.nmdp.hfcus.model.exceptions.RequiredFieldInvalidException;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class LabelSet implements ICurationDataModel<LabelData> {
    public LabelSet() {
        //intentionally left empty
    }

    public LabelSet(LabelData swaggerObject) {
        if (swaggerObject.getLabelList() != null) {
            labelList = new ArrayList<>();
            for (io.swagger.model.Label method : swaggerObject.getLabelList()) {
                labelList.add(new Label(method));
            }
            if (labelList.size() == 0) {
                throw new RequiredFieldInvalidException("label list must not be empty");
            }
        } else {
            throw new RequiredFieldInvalidException("requires label list");
        }
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @OneToMany(cascade = CascadeType.ALL)
    private List<Label> labelList;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<Label> getLabelList() {
        return labelList;
    }

    public void setLabelList(List<Label> labelList) {
        this.labelList = labelList;
    }

    @Override
    public LabelData toSwaggerObject() {
        LabelData data = new LabelData();
        if (labelList != null) {
            List<io.swagger.model.Label> labels = new ArrayList<>();
            for (Label label : labelList) {
                labels.add(label.toSwaggerObject());
            }
            data.setLabelList(labels);
        }
        return data;
    }
}
