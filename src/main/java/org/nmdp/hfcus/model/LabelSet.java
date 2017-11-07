package org.nmdp.hfcus.model;

import io.swagger.model.LabelData;
import io.swagger.model.LabelList;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class LabelSet {
    public LabelSet(){
        //intentionally left empty
    }

    public LabelSet(LabelData swaggerObject) {
        if (swaggerObject.getLabelList().getLabel() != null){
            labelList = new ArrayList<>();
            for (io.swagger.model.Label method : swaggerObject.getLabelList().getLabel() ){
                labelList.add(new Label(method));
            }
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

    public LabelData toSwaggerObject(){
        LabelData data = new LabelData();
        if (labelList != null){
            List<io.swagger.model.Label> methods = new ArrayList<>();
            for (Label label: labelList) {
                methods.add(label.toSwaggerObject());
            }
            LabelList list = new LabelList();
            list.setLabel(methods);
            data.setLabelList(list);
        }
        return data;
    }
}
