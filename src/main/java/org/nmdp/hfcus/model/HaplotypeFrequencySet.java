package org.nmdp.hfcus.model;

import io.swagger.model.HaplotypeFrequencyData;
import io.swagger.model.License;
import io.swagger.model.ResolutionData;
import io.swagger.model.ResolutionInfo;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class HaplotypeFrequencySet {
    public HaplotypeFrequencySet(){
        //intentionally left empty
    }

    public HaplotypeFrequencySet(HaplotypeFrequencyData swaggerObject){
        license = swaggerObject.getLicense().getTypeOfLicense();
        if (swaggerObject.getResolutionData() != null) {
            resolutionList = new ArrayList<>();
            for (ResolutionInfo resolutionInfo :swaggerObject.getResolutionData()) {
                resolutionList.add(new Resolution(resolutionInfo));
            }
        }
        frequencyList = new ArrayList<>();
        for (io.swagger.model.HaplotypeFrequency frequency: swaggerObject.getHaplotypeFrequencyList()) {
            frequencyList.add(new HaplotypeFrequency(frequency));
        }
        if (swaggerObject.getQualityList() != null){
            qualityList = new ArrayList<>();
            for (io.swagger.model.Quality quality: swaggerObject.getQualityList()) {
                qualityList.add(new Quality(quality));
            }
        }
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String id;
    private License.TypeOfLicenseEnum license;
    @OneToMany(cascade = CascadeType.ALL)
    private List<Resolution> resolutionList;
    @OneToMany(cascade = CascadeType.ALL)
    private List<HaplotypeFrequency> frequencyList;
    @OneToMany(cascade = CascadeType.ALL)
    private List<Quality> qualityList;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public License.TypeOfLicenseEnum getLicense() {
        return license;
    }

    public void setLicense(License.TypeOfLicenseEnum license) {
        this.license = license;
    }

    public List<Resolution> getResolution() {
        return resolutionList;
    }

    public void setResolution(List<Resolution> resolutionList) {
        this.resolutionList = resolutionList;
    }

    public List<HaplotypeFrequency> getFrequencyList() {
        return frequencyList;
    }

    public void setFrequencyList(List<HaplotypeFrequency> frequencyList) {
        this.frequencyList = frequencyList;
    }

    public List<Quality> getQualityList() {
        return qualityList;
    }

    public void setQualityList(List<Quality> qualityList) {
        this.qualityList = qualityList;
    }

    public HaplotypeFrequencyData toSwaggerObject(){
        HaplotypeFrequencyData data = new HaplotypeFrequencyData();
        License license = new License();
        license.setTypeOfLicense(this.license);
        data.setLicense(license);
        if (resolutionList != null){
            ResolutionData resolutions = new ResolutionData();
            for (Resolution resolution: resolutionList) {
                resolutions.add(resolution.toSwaggerObject());
            }
            data.setResolutionData(resolutions);
        }
        List<io.swagger.model.HaplotypeFrequency> frequencies = new ArrayList<>();
        for (HaplotypeFrequency frequency: frequencyList){
            frequencies.add(frequency.toSwaggerObject());
        }
        data.setHaplotypeFrequencyList(frequencies);
        if (qualityList != null){
            List<io.swagger.model.Quality> qualities = new ArrayList<>();
            for (Quality quality: qualityList){
                qualities.add(quality.toSwaggerObject());
            }
            data.setQualityList(qualities);
        }
        return data;
    }
}
