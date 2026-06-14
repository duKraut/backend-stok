package com.stok.auth;

import jakarta.enterprise.context.ApplicationScoped;
import org.eclipse.microprofile.config.inject.ConfigProperty;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

@ApplicationScoped
public class EmailService {

    @ConfigProperty(name = "resend.api.key")
    String apiKey;

    @ConfigProperty(name = "resend.from.email", defaultValue = "onboarding@resend.dev")
    String fromEmail;

    private final HttpClient httpClient = HttpClient.newHttpClient();

    public void sendPasswordReset(String toEmail, String toName, String resetToken) {
        String resetUrl = "http://localhost:4200/login?token=" + resetToken;

        String html = "<p>Ol&#225;, <strong>" + toName + "</strong>!</p>"
                + "<p>Voc&#234; solicitou a redefini&#231;&#227;o de senha no sistema Stok.</p>"
                + "<p>Clique no link abaixo para criar uma nova senha:</p>"
                + "<p><a href='" + resetUrl + "' style='background:#063b75;color:#fff;padding:12px 24px;"
                + "border-radius:8px;text-decoration:none;font-weight:bold;'>Redefinir Senha</a></p>"
                + "<p>Este link &#233; v&#225;lido por 1 hora.</p>"
                + "<p>Se voc&#234; n&#227;o solicitou isso, ignore este e-mail.</p>";

        String body = "{\"from\":\"" + fromEmail + "\","
                + "\"to\":[\"" + toEmail + "\"],"
                + "\"subject\":\"Redefini\\u00e7\\u00e3o de Senha - Stok Sistemas\","
                + "\"html\":\"" + html.replace("\"", "\\\"") + "\"}";

        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create("https://api.resend.com/emails"))
                .header("Authorization", "Bearer " + apiKey)
                .header("Content-Type", "application/json")
                .POST(HttpRequest.BodyPublishers.ofString(body))
                .build();

        try {
            httpClient.send(request, HttpResponse.BodyHandlers.ofString());
        } catch (Exception e) {
            throw new RuntimeException("Falha ao enviar e-mail: " + e.getMessage());
        }
    }
}
