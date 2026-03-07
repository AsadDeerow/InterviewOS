package com.asad.interviewos;

import com.asad.interviewos.repository.UserRepository;
import com.asad.interviewos.security.AuthRateLimitService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.Cookie;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.cookie;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.header;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class AuthIntegrationTests {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AuthRateLimitService authRateLimitService;

    @Autowired
    private ObjectMapper objectMapper;

    @BeforeEach
    void cleanDatabase() {
        userRepository.deleteAll();
        authRateLimitService.clearAll();
    }

    @Test
    void registerSuccess() throws Exception {
        registerUser("test@example.com", "password123");
    }

    @Test
    void registerDuplicateEmailReturnsConflict() throws Exception {
        CsrfContext csrf = fetchCsrf();
        String body = """
                {"email":"duplicate@example.com","password":"password123"}
                """;

        mockMvc.perform(post("/api/auth/register")
                        .cookie(csrf.cookie())
                        .header("X-XSRF-TOKEN", csrf.token())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(body))
                .andExpect(status().isCreated());

        mockMvc.perform(post("/api/auth/register")
                        .cookie(csrf.cookie())
                        .header("X-XSRF-TOKEN", csrf.token())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(body))
                .andExpect(status().isConflict())
                .andExpect(jsonPath("$.message").value("Email already exists"));
    }

    @Test
    void loginSuccessSetsHttpOnlyCookie() throws Exception {
        registerUser("login@example.com", "password123");
        CsrfContext csrf = fetchCsrf();

        mockMvc.perform(post("/api/auth/login")
                        .cookie(csrf.cookie())
                        .header("X-XSRF-TOKEN", csrf.token())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("""
                                {"email":"login@example.com","password":"password123","rememberMe":true}
                                """))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.message").value("Login successful"))
                .andExpect(cookie().exists("access_token"))
                .andExpect(cookie().httpOnly("access_token", true))
                .andExpect(cookie().maxAge("access_token", 3600));
    }

    @Test
    void protectedEndpointWithoutTokenReturnsUnauthorized() throws Exception {
        mockMvc.perform(get("/api/health"))
                .andExpect(status().isUnauthorized())
                .andExpect(jsonPath("$.message").value("Unauthorized"));
    }

    @Test
    void csrfEndpointIssuesCookieAndSecurityHeaders() throws Exception {
        mockMvc.perform(get("/api/auth/csrf"))
                .andExpect(status().isOk())
                .andExpect(cookie().exists("XSRF-TOKEN"))
                .andExpect(jsonPath("$.token").isNotEmpty())
                .andExpect(header().string("X-Frame-Options", "DENY"))
                .andExpect(header().string("X-Content-Type-Options", "nosniff"))
                .andExpect(header().string("Referrer-Policy", "no-referrer"));
    }

    @Test
    void protectedMutationWithoutCsrfReturnsForbidden() throws Exception {
        registerUser("nocsrf@example.com", "password123");
        Cookie authCookie = loginAndGetAuthCookie("nocsrf@example.com", "password123");

        mockMvc.perform(post("/api/interviews/start")
                        .cookie(authCookie)
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("""
                                {"role":"BACKEND_ENGINEER"}
                                """))
                .andExpect(status().isForbidden())
                .andExpect(jsonPath("$.message").value("Forbidden"));
    }

    @Test
    void startInterviewReturnsThreeQuestionsForRole() throws Exception {
        registerUser("interview@example.com", "password123");
        Cookie authCookie = loginAndGetAuthCookie("interview@example.com", "password123");
        CsrfContext csrf = fetchCsrf();

        mockMvc.perform(post("/api/interviews/start")
                        .cookie(authCookie, csrf.cookie())
                        .header("X-XSRF-TOKEN", csrf.token())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("""
                                {"role":"BACKEND_ENGINEER"}
                                """))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.sessionId").isNumber())
                .andExpect(jsonPath("$.role").value("BACKEND_ENGINEER"))
                .andExpect(jsonPath("$.questions.length()").value(3));
    }

    @Test
    void loginRateLimitReturnsTooManyRequests() throws Exception {
        registerUser("ratelimit@example.com", "password123");
        CsrfContext csrf = fetchCsrf();

        for (int attempt = 0; attempt < 5; attempt++) {
            mockMvc.perform(post("/api/auth/login")
                            .cookie(csrf.cookie())
                            .header("X-XSRF-TOKEN", csrf.token())
                            .contentType(MediaType.APPLICATION_JSON)
                            .content("""
                                    {"email":"ratelimit@example.com","password":"wrongpass","rememberMe":true}
                                    """))
                    .andExpect(status().isUnauthorized());
        }

        mockMvc.perform(post("/api/auth/login")
                        .cookie(csrf.cookie())
                        .header("X-XSRF-TOKEN", csrf.token())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("""
                                {"email":"ratelimit@example.com","password":"wrongpass","rememberMe":true}
                                """))
                .andExpect(status().isTooManyRequests())
                .andExpect(jsonPath("$.message").value("Too many login attempts. Try again later."));
    }

    @Test
    void disabledUserCannotAccessProtectedEndpointWithExistingCookie() throws Exception {
        registerUser("disabled@example.com", "password123");
        Cookie authCookie = loginAndGetAuthCookie("disabled@example.com", "password123");

        var user = userRepository.findByEmail("disabled@example.com").orElseThrow();
        user.setEnabled(false);
        userRepository.save(user);

        mockMvc.perform(get("/api/health").cookie(authCookie))
                .andExpect(status().isUnauthorized())
                .andExpect(jsonPath("$.message").value("Unauthorized"));
    }

    @Test
    void logoutClearsCookieAndRevokesExistingToken() throws Exception {
        registerUser("logout@example.com", "password123");
        Cookie authCookie = loginAndGetAuthCookie("logout@example.com", "password123");
        CsrfContext csrf = fetchCsrf();

        mockMvc.perform(post("/api/auth/logout")
                        .cookie(authCookie, csrf.cookie())
                        .header("X-XSRF-TOKEN", csrf.token())
                        .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.message").value("Logged out"))
                .andExpect(cookie().maxAge("access_token", 0));

        mockMvc.perform(get("/api/health").cookie(authCookie))
                .andExpect(status().isUnauthorized())
                .andExpect(jsonPath("$.message").value("Unauthorized"));
    }

    private void registerUser(String email, String password) throws Exception {
        CsrfContext csrf = fetchCsrf();
        String registerBody = """
                {"email":"%s","password":"%s"}
                """.formatted(email, password);

        mockMvc.perform(post("/api/auth/register")
                        .cookie(csrf.cookie())
                        .header("X-XSRF-TOKEN", csrf.token())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(registerBody))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.message").value("User registered successfully"));
    }

    private Cookie loginAndGetAuthCookie(String email, String password) throws Exception {
        CsrfContext csrf = fetchCsrf();
        String loginBody = """
                {"email":"%s","password":"%s","rememberMe":true}
                """.formatted(email, password);

        MvcResult result = mockMvc.perform(post("/api/auth/login")
                        .cookie(csrf.cookie())
                        .header("X-XSRF-TOKEN", csrf.token())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(loginBody))
                .andExpect(status().isOk())
                .andReturn();

        Cookie authCookie = result.getResponse().getCookie("access_token");
        if (authCookie == null) {
            throw new IllegalStateException("access_token cookie was not set");
        }
        return authCookie;
    }

    private CsrfContext fetchCsrf() throws Exception {
        MvcResult result = mockMvc.perform(get("/api/auth/csrf"))
                .andExpect(status().isOk())
                .andReturn();

        Cookie csrfCookie = result.getResponse().getCookie("XSRF-TOKEN");
        if (csrfCookie == null) {
            throw new IllegalStateException("XSRF-TOKEN cookie was not set");
        }

        JsonNode body = objectMapper.readTree(result.getResponse().getContentAsString());
        return new CsrfContext(csrfCookie, body.get("token").asText());
    }

    private record CsrfContext(Cookie cookie, String token) {
    }
}
