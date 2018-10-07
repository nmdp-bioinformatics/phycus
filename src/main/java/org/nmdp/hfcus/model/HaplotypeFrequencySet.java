package org.nmdp.hfcus.model;

import io.swagger.model.HaplotypeFrequencyData;
import io.swagger.model.License;
import io.swagger.model.ResolutionData;
import io.swagger.model.ResolutionInfo;
import org.nmdp.hfcus.model.exceptions.RequiredFieldInvalidException;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class HaplotypeFrequencySet implements ICurationDataModel<io.swagger.model.HaplotypeFrequencyData> {
    public HaplotypeFrequencySet() {
        //intentionally left empty
    }

    public HaplotypeFrequencySet(HaplotypeFrequencyData swaggerObject) {
        license = swaggerObject.getLicense().getTypeOfLicense();
        if (license == null) {
            throw new RequiredFieldInvalidException("requires a license");
        }
        if (swaggerObject.getResolutionData() != null) {
            resolutionList = new ArrayList<>();
            for (ResolutionInfo resolutionInfo : swaggerObject.getResolutionData()) {
                resolutionList.add(new Resolution(resolutionInfo));
            }
        }
        List<io.swagger.model.HaplotypeFrequency> swaggerFrequencyList = swaggerObject.getHaplotypeFrequencyList();
        if (swaggerFrequencyList != null) {
            frequencyList = new ArrayList<>();
            for (io.swagger.model.HaplotypeFrequency frequency : swaggerFrequencyList) {
                frequencyList.add(new HaplotypeFrequency(frequency));
            }
            if (frequencyList.size() == 0) {
                throw new RequiredFieldInvalidException("frequency list must not be empty");
            }
        } else {
            throw new RequiredFieldInvalidException("requires a frequency list");
        }
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Enumerated(EnumType.STRING)
    private License.TypeOfLicenseEnum license;
    @OneToMany(cascade = CascadeType.ALL)
    private List<Resolution> resolutionList;
    @OneToMany(cascade = CascadeType.ALL)
    private List<HaplotypeFrequency> frequencyList;
    @OneToMany(cascade = CascadeType.ALL)
    private List<Quality> qualityList;
    private int numberOfCalculatedQualities = 0;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<Resolution> getResolutionList() {
        return resolutionList;
    }

    public void setResolutionList(List<Resolution> resolutionList) {
        this.resolutionList = resolutionList;
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

    public int getNumberOfCalculatedQualities() {
        return numberOfCalculatedQualities;
    }

    public void setNumberOfCalculatedQualities(int numberOfCalculatedQualities) {
        this.numberOfCalculatedQualities = numberOfCalculatedQualities;
    }

    @Override
    public HaplotypeFrequencyData toSwaggerObject() {
        HaplotypeFrequencyData data = new HaplotypeFrequencyData();
        License license = new License();
        license.setTypeOfLicense(this.license);
        data.setLicense(license);
        if (resolutionList != null) {
            ResolutionData resolutions = new ResolutionData();
            for (Resolution resolution : resolutionList) {
                resolutions.add(resolution.toSwaggerObject());
            }
            data.setResolutionData(resolutions);
        }
        List<io.swagger.model.HaplotypeFrequency> frequencies = new ArrayList<>();
        for (HaplotypeFrequency frequency : frequencyList) {
            frequencies.add(frequency.toSwaggerObject());
        }
        data.setHaplotypeFrequencyList(frequencies);
        if (qualityList != null) {
            List<io.swagger.model.Quality> qualities = new ArrayList<>();
            for (Quality quality : qualityList) {
                qualities.add(quality.toSwaggerObject());
            }
            data.setQualityList(qualities);
        }
        return data;
    }
}
