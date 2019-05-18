package org.nmdp.hfcus.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import org.springframework.transaction.annotation.EnableTransactionManagement;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;


@Configuration
@EnableTransactionManagement
public class SwaggerDocumentationConfig {

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("Haplotype Frequency Curation Service")
                .description("Allows to store and return haplotype frequency data")
                .license("LGPL 3.0")
                .licenseUrl("https://www.gnu.org/licenses/lgpl-3.0.txt")
                .termsOfServiceUrl("")
                .version("1.0.0")
                .contact(new Contact("Pradeep Bashyal","https://github.com/nmdp-bioinformatics/phycus", ""))
                .build();
    }

    @Bean
    public Docket customImplementation(){
        return new Docket(DocumentationType.SWAGGER_2)
                .select()
                .apis(RequestHandlerSelectors.basePackage("org.nmdp.hfcus.controller"))
                .build()
                .directModelSubstitute(java.time.LocalDate.class, java.sql.Date.class)
                .directModelSubstitute(java.time.OffsetDateTime.class, java.util.Date.class)
                .apiInfo(apiInfo());
    }

}

