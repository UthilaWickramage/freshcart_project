package lk.freshcart.util;


import io.fusionauth.jwt.Signer;
import io.fusionauth.jwt.Verifier;
import io.fusionauth.jwt.domain.JWT;
import io.fusionauth.jwt.hmac.HMACSigner;
import io.fusionauth.jwt.hmac.HMACVerifier;
import lk.freshcart.entity.User;

import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class JWTTokenUtil {
    private static final String CLAIM_KEY_EMAIL = "sub";
    private static final String CLAIM_KEY_PASSWORD = "sub2";
    private static final String CLAIM_KEY_CREATED = "created";
    private static final String ISSUER = "www.jiat.lk";

    //secret key for the application
    private static final String SECRET = "vvupe&spFcEt*z@#nAWUtzjRIegYgirDWwQ*1lNe0fhju!k@s$GECsemueGck7v7";

    //access token life is 30 minutes
    private static final Long TOKEN_LIFE = 30L;

    //refresh token life is a month
    private static final Long REFRESH_TOKEN_LIFE = 43200L;

    //a token will be generated.
    private String generateToken(Map<String, String> claims, Long expiration, String subject, String subject2) {
        Signer signer = HMACSigner.newSHA256Signer(SECRET);

        JWT jwt = new JWT().setIssuer(ISSUER)
                .setIssuedAt(ZonedDateTime.now(ZoneOffset.UTC))
                .setSubject(subject)
                .setSubject(subject2)
                .setExpiration(ZonedDateTime.now(ZoneOffset.UTC).plusMinutes(expiration));

        claims.keySet().forEach(k -> {
            if (claims.get(k) != null) {
                jwt.addClaim(k, claims.get(k));
            }
        });
        String encodedJWT = JWT.getEncoder().encode(jwt, signer);
        return encodedJWT;
    }

    //provide the claims from a token
    public Map<String, String> getClaimsFromToken(String token) {
        Verifier verifier = HMACVerifier.newVerifier(SECRET);

        JWT jwt = JWT.getDecoder().decode(token, verifier);

        Map<String, String> claims = new HashMap<>();
        if (jwt != null) {
            jwt.getAllClaims().forEach((k, v) -> {
                claims.put(k, v.toString());
            });
        }
        return claims;
    }

    //get the name from the token
    public String getEmailFromToken(String token) {
        Map<String, String> claims = getClaimsFromToken(token);
        return claims.get(CLAIM_KEY_EMAIL);
    }
    //get the password from the token
    public String getPasswordFromToken(String token) {
        Map<String, String> claims = getClaimsFromToken(token);
        return claims.get(CLAIM_KEY_PASSWORD);
    }

    //get expired date from token
    public Date getExpiredDateFromToken(String token) {
        Verifier verifier = HMACVerifier.newVerifier(SECRET);
        JWT jwt = JWT.getDecoder().decode(token, verifier);

        return new Date(jwt.expiration.toInstant().toEpochMilli());
    }

    //checks whether the token is expired
    public boolean isTokenExpired(String token){
        Date expireDateOfToken = getExpiredDateFromToken(token);
        return expireDateOfToken.before(new Date(System.currentTimeMillis()));
    }

    //validate the token
    public boolean validateToken(String token, User user) {
        String email = getEmailFromToken(token);
        String password = getPasswordFromToken(token);
        return email.equals(user.getEmail()) && password.equals(user.getPassword())&& !isTokenExpired(token);
    }

    //call the generate token method for an access token
    public String generateAccessToken(User user) {
        Map<String, String> claims = new HashMap<>();
        claims.put(CLAIM_KEY_EMAIL, user.getEmail());
        claims.put(CLAIM_KEY_PASSWORD, user.getPassword());
        claims.put(CLAIM_KEY_CREATED, new Date().toString());
        return generateToken(claims, TOKEN_LIFE, user.getEmail(),user.getPassword());
    }
    //call the generate token method for a refresh token
    public String generateRefreshToken(User user) {
        Map<String, String> claims = new HashMap<>();
        claims.put(CLAIM_KEY_EMAIL, user.getEmail());
        claims.put(CLAIM_KEY_PASSWORD, user.getPassword());
        claims.put(CLAIM_KEY_CREATED, new Date().toString());
        return generateToken(claims, REFRESH_TOKEN_LIFE, user.getEmail(), user.getPassword());
    }

}