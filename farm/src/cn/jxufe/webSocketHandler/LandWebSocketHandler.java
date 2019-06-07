package cn.jxufe.webSocketHandler;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import cn.jxufe.entity.User;

@Component("webSocket")
public class LandWebSocketHandler extends TextWebSocketHandler{
	
	private final Logger log = LoggerFactory.getLogger(LandWebSocketHandler.class);
	
	private Map<Long,WebSocketSession> users = new ConcurrentHashMap<>();
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		User user = (User) session.getHandshakeAttributes().get("currentUser");
		System.out.println(user);
		users.remove(user.getId());
		log.info("user:"+user.getUsername()+" has been exitted!");
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		User user = (User) session.getHandshakeAttributes().get("currentUser");
		System.out.println(user);
		users.put(user.getId(), session);
		log.info("user:"+user.getUsername()+" has been loginned!");
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		Object payload = message.getPayload();
		System.out.println("payload class:"+payload.getClass().getName());
		System.out.println(payload);
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		User user = (User) session.getHandshakeAttributes().get("currentUser");
		users.remove(user.getId());
		log.info("user:"+user.getUsername()+" Error!");
	}
	
	

}
