package com.kh.livro.utils;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ExecutionException;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

@Component
public class LoginGoogleBO {

    /*
     * 인증 요청문 구성 파라미터 client_id : required redirect_uri : required, Note that the
     * http or https scheme, case, and trailing slash ('/') must all match.
     * response_type : code로 고정 scope : required access_type : recommended state :
     * recommended
     */

    private final static String CLIENT_ID = "978983706879-ahvk0ilq9b32qh61p5g2ksbmqeje4oij.apps.googleusercontent.com";
    private final static String CLIENT_SECRET = " 3JV-cp-_HruMwse6ghyVLIW5";
    private final static String REDIRECT_URI = "http://localhost:8787/livro/gcallback.do";
    private final static String PROTECTED_RESOURCE_URL = "https://www.googleapis.com/oauth2/v3/userinfo";
    private final static String SCOPE = "openid profile email";
    private final static String SESSION_STATE = "oauth_state_g";
    
    
    private Logger logger = LoggerFactory.getLogger(LoginGoogleBO.class);

    public String getAuthorizationUrl(HttpSession session) {
        String state = generateRandomString();
        setSession(session, state);
        final Map<String, String> additionalParams = new HashMap<>();
        additionalParams.put("access_type", "offline");
        additionalParams.put("prompt", "consent");
        OAuth20Service oauthService = new ServiceBuilder(CLIENT_ID).apiSecret(CLIENT_SECRET).defaultScope(SCOPE)
                .callback(REDIRECT_URI).build(LoginGoogleApi.instance());
        return oauthService.createAuthorizationUrlBuilder().state(state).additionalParams(additionalParams).build();
    }

    public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state)
            throws IOException, InterruptedException, ExecutionException {
        String sessionState = getSession(session);
        if (StringUtils.pathEquals(sessionState, state)) {
            OAuth20Service oauthService = new ServiceBuilder(CLIENT_ID).apiSecret(CLIENT_SECRET).callback(REDIRECT_URI)
                    .build(LoginGoogleApi.instance());
            OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
//            logger.info("* Access Token's raw response : " + accessToken.getRawResponse());
//            accessToken = oauthService.refreshAccessToken(accessToken.getRefreshToken());
//            logger.info("* Access Token's raw response (After refresh) : " + accessToken.getRawResponse());
            return accessToken;
        }
        return null;
    }

    public String getUserProfile(OAuth2AccessToken accessToken)
            throws InterruptedException, ExecutionException, IOException {
        OAuth20Service oauthService = new ServiceBuilder(CLIENT_ID).apiSecret(CLIENT_SECRET).callback(REDIRECT_URI)
                .build(LoginGoogleApi.instance());
        OAuthRequest request = new OAuthRequest(Verb.GET, PROTECTED_RESOURCE_URL);
        oauthService.signRequest(accessToken, request);
        Response response = oauthService.execute(request);
//        logger.info("* response code : " + response.getCode());
//        logger.info("* response body : " + response.getBody());
        return response.getBody();
    }

    private String generateRandomString() {
        return UUID.randomUUID().toString();
    }

    private void setSession(HttpSession session, String state) {
        session.setAttribute(SESSION_STATE, state);
    }

    private String getSession(HttpSession session) {
        return (String) session.getAttribute(SESSION_STATE);
    }
}