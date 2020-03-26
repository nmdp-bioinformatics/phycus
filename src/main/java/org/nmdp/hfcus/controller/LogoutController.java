package org.nmdp.hfcus.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.core.oidc.OidcIdToken;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * REST controller for managing global OIDC logout.
 */
@RestController
public class LogoutController {


    @Value("${spring.security.oauth2.client.registration.oidc.client-id}")
    private String strClientIdInOIDC;

    @Value("${spring.security.oauth2.client.registration.oidc.client-secret}")
    private String strClientSecretInOIDC;

    private final ClientRegistration registration;


    public LogoutController(ClientRegistrationRepository registrations) {
        this.registration = registrations.findByRegistrationId("oidc");
    }


    /**
     * {@code POST  /api/logout} : logout the current user.
     *
     * @param pRequest the {@link HttpServletRequest}.
     * @param pIdToken the ID token.
     * @return the {@link ResponseEntity} with status {@code 200 (OK)} and a body with a global logout URL and ID token.
     */
    @GetMapping("/api/logout")
    public ResponseEntity<?> logout(HttpServletRequest pRequest,
                                    @AuthenticationPrincipal(expression = "idToken") OidcIdToken pIdToken) {

        RestTemplate restTemplate = null;
        HttpHeaders headers = null;
        MultiValueMap<String, String> requestParams = null;
        HttpEntity<MultiValueMap<String, String>> request = null;
        String logoutUrl = null;
        Map<String, String> logoutDetails = null;

        // TODO: Improve this logout procedure.

        logoutUrl = this.registration.getProviderDetails()
                                     .getConfigurationMetadata()
                                     .get("end_session_endpoint")
                                     .toString();

        if (!StringUtils.isEmpty(logoutUrl)) {

            pRequest.getSession().invalidate();

            restTemplate = new RestTemplate();

            headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

            requestParams = new LinkedMultiValueMap<>();
            requestParams.add("client_id", strClientIdInOIDC);
            requestParams.add("client_secret", strClientSecretInOIDC);
            requestParams.add("refresh_token", pIdToken.getTokenValue());
            request = new HttpEntity<>(requestParams, headers);

            // restTemplate.postForEntity(logoutUrl, request, Object.class);
            String strResult = restTemplate.getForObject(logoutUrl, String.class);

            // headers = new HttpHeaders();
            // headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
            // headers.setBearerAuth(pIdToken.getTokenValue());
            // HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);
            // ResponseEntity<String> result = restTemplate.exchange(logoutUrl, HttpMethod.GET, entity, String.class);

            // System.out.println(strResult);

            logoutDetails = new HashMap<>();
            logoutDetails.put("logoutUrl", logoutUrl);
            logoutDetails.put("idToken", pIdToken.getTokenValue());

        }

        return ResponseEntity.ok().body(logoutDetails);
    }


}
