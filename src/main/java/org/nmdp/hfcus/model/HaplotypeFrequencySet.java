package org.nmdp.hfcus.model;

import io.swagger.model.HaplotypeFrequencyData;
import io.swagger.model.License;
import io.swagger.model.ResolutionData;
import io.swagger.model.ResolutionInfo;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.nmdp.hfcus.model.exceptions.RequiredFieldInvalidException;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
public class HaplotypeFrequencySet implements ICurationDataModel<io.swagger.model.HaplotypeFrequencyData> {

    HaplotypeFrequencySet(HaplotypeFrequencyData swaggerObject) {
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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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
