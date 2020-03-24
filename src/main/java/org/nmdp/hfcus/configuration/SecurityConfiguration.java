package org.nmdp.hfcus.configuration;

import org.nmdp.hfcus.security.AuthoritiesConstants;
import org.nmdp.hfcus.security.SecurityUtils;
import org.nmdp.hfcus.security.oauth2.AudienceValidator;
import org.nmdp.hfcus.security.oauth2.JwtGrantedAuthorityConverter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Import;
import org.springframework.core.convert.converter.Converter;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.mapping.GrantedAuthoritiesMapper;
import org.springframework.security.oauth2.core.DelegatingOAuth2TokenValidator;
import org.springframework.security.oauth2.core.OAuth2TokenValidator;
import org.springframework.security.oauth2.core.oidc.user.OidcUserAuthority;
import org.springframework.security.oauth2.jwt.*;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationConverter;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.security.web.header.writers.ReferrerPolicyHeaderWriter;
import org.springframework.web.filter.CorsFilter;
import org.zalando.problem.spring.web.advice.security.SecurityProblemSupport;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
@Import(SecurityProblemSupport.class)
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    private final CorsFilter corsFilter;

    @Value("${spring.security.oauth2.client.provider.oidc.issuer-uri}")
    private String issuerUri;

    private final SecurityProblemSupport problemSupport;

    public SecurityConfiguration(CorsFilter corsFilter, SecurityProblemSupport problemSupport) {
        this.corsFilter = corsFilter;
        this.problemSupport = problemSupport;
    }

    @Override
    public void configure(WebSecurity web) {
        web.ignoring()
                .antMatchers(HttpMethod.OPTIONS, "/**")
                .antMatchers("/app/**/*.{js,html}")
                .antMatchers("/i18n/**")
                .antMatchers("/content/**")
                .antMatchers("/webjars/**")
                .antMatchers("/test/**")
                .antMatchers("/swagger-ui.html*/**");
    }


    @Override
    public void configure(HttpSecurity httpSecurity) throws Exception {
        // @formatter:off
        httpSecurity
            .csrf()
            .disable()
            // .csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse())
        //.and()
        //    .addFilterBefore(corsFilter, CsrfFilter.class)
        //    .exceptionHandling()
        //        .authenticationEntryPoint(problemSupport)
        //        .accessDeniedHandler(problemSupport)
        //.and()
        //    .headers()
        //    .contentSecurityPolicy("default-src 'self'; frame-src 'self' data:; script-src 'self' 'unsafe-inline' 'unsafe-eval' https://storage.googleapis.com; style-src 'self' 'unsafe-inline'; img-src 'self' data:; font-src 'self' data:")
        // .and()
        //    .referrerPolicy(ReferrerPolicyHeaderWriter.ReferrerPolicy.STRICT_ORIGIN_WHEN_CROSS_ORIGIN)
        //.and()
        //    .featurePolicy("geolocation 'none'; midi 'none'; sync-xhr 'none'; microphone 'none'; camera 'none'; magnetometer 'none'; gyroscope 'none'; speaker 'none'; fullscreen 'self'; payment 'none'")
        //.and()
        //    .frameOptions()
        //    .deny()
        // .and()
        .authorizeRequests()
            // .antMatchers("/swagger-ui.html*/**").hasAuthority("05_REGISTERED_USERS_CLIENT_ROLE")
            .antMatchers("/api/auth-info").permitAll()
            .antMatchers("/api/logout").permitAll()
            .antMatchers("/api/**").authenticated()
            .antMatchers("/hfc/**").hasAuthority("04_PUBLISHER_CLIENT_ROLE")
            .antMatchers("/management/health").hasAuthority("03_REVIEWER_CLIENT_ROLE")
            .antMatchers("/management/info").hasAuthority("BASIC_REGISTERED_GLOBAL_ROLE")
            .antMatchers("/management/**").hasAuthority(AuthoritiesConstants.ADMIN)
            .anyRequest().permitAll()
        .and()
            .oauth2Login()
        .and()
            .oauth2ResourceServer()
            .jwt()
            .jwtAuthenticationConverter(authenticationConverter())
        .and()
        .and()
            .oauth2Client();

        httpSecurity.headers()
                .frameOptions()
                .sameOrigin();

        /*
        httpSecurity.logout()
                .logoutUrl("/doLogout")
                .logoutSuccessUrl("htpp://localhost:9080/auth/realms/CIBMTR-BioInformatics-Realm/protocol/openid-connect/logout?redirect_uri=http%3A%2F%2Flocalhost%3A8080%2FphycusApp");
        */
    }


    Converter<Jwt, AbstractAuthenticationToken> authenticationConverter() {
        JwtAuthenticationConverter jwtAuthenticationConverter = new JwtAuthenticationConverter();
        jwtAuthenticationConverter.setJwtGrantedAuthoritiesConverter(new JwtGrantedAuthorityConverter());
        return jwtAuthenticationConverter;
    }


    /**
     * Map authorities from "groups" or "roles" claim in ID Token.
     *
     * @return a {@link GrantedAuthoritiesMapper} that maps groups from
     * the IdP to Spring Security Authorities.
     */
    @Bean
    public GrantedAuthoritiesMapper userAuthoritiesMapper() {
        return (authorities) -> {
            Set<GrantedAuthority> mappedAuthorities = new HashSet<>();

            authorities.forEach(authority -> {
                // Check for OidcUserAuthority because Spring Security 5.2 returns
                // each scope as a GrantedAuthority, which we don't care about.
                if (authority instanceof OidcUserAuthority) {
                    OidcUserAuthority oidcUserAuthority = (OidcUserAuthority) authority;
                    mappedAuthorities.addAll(SecurityUtils.extractAuthorityFromClaims(oidcUserAuthority.getUserInfo().getClaims()));
                }
            });
            return mappedAuthorities;
        };
    }

    @Bean
    JwtDecoder jwtDecoder() {
        NimbusJwtDecoder jwtDecoder = null;
        List<String> audienceValidatorTmpList = null;
        OAuth2TokenValidator<Jwt> audienceValidator = null;
        OAuth2TokenValidator<Jwt> withIssuer = null;
        OAuth2TokenValidator<Jwt> withAudience = null;

        jwtDecoder = (NimbusJwtDecoder) JwtDecoders.fromOidcIssuerLocation(issuerUri);
        audienceValidatorTmpList = Arrays.asList("account", "api://default");
        // audienceValidator = new AudienceValidator(jHipsterProperties.getSecurity().getOauth2().getAudience());
        audienceValidator = new AudienceValidator(audienceValidatorTmpList);
        withIssuer = JwtValidators.createDefaultWithIssuer(issuerUri);
        withAudience = new DelegatingOAuth2TokenValidator<>(withIssuer, audienceValidator);

        jwtDecoder.setJwtValidator(withAudience);

        return jwtDecoder;
    }
}
