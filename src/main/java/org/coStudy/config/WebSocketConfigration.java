package org.coStudy.config;

import org.coStudy.controller.WebSoketController;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSocket
@RequiredArgsConstructor
public class WebSocketConfigration implements WebSocketConfigurer {
	private final WebSoketController webSoket;
    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(webSoket, "/websocket")
                .setAllowedOrigins("*")
                .withSockJS(); // sockjs 지원
    }
}