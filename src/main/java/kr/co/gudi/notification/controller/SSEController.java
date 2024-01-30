package kr.co.gudi.notification.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import kr.co.gudi.notification.service.NotiService;

@RestController
public class SSEController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired NotiService service;
	
	
    private final Map<String, SseEmitter> sseEmitters = new ConcurrentHashMap<>();
	
	@GetMapping(value="/notiEvent")
	public ModelAndView home() {
		return new ModelAndView("notification/notiEvent");
	}
    
    @GetMapping(value = "/notiPage", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public ResponseEntity<SseEmitter> connect() {
        SseEmitter emitter = new SseEmitter();
        String clientId = "clientId"; // 클라이언트 식별자 (세션 아이디 등)
        sseEmitters.put(clientId, emitter);
        
        // Emitter 생성 후 만료시간까지 아무 데이터도 보내지 않으면 재연결 요청시 503 Service Unavailable 에러가 발생할 수 있으므로,
        // 처음 SSE 연결 시 더미 데이터를 보내준다. 
        try {
            emitter.send(SseEmitter.event()
                    .name("connect") // 이름 지정
                    .data("connected!")); // 더미 데이터 
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        // SSE 연결이 종료되면 제거
        emitter.onCompletion(() -> sseEmitters.remove(clientId));

        return ResponseEntity.ok(emitter);
    }
    
    // POST 요청을 처리하는 핸들러 메소드
    @PostMapping("/submitForm")
    public ResponseEntity<Map<String, String>> submitForm(@RequestBody Map<String, String> payload) {
    	
        // 전달받은 데이터 처리
        String member_id = payload.get("member_id");

        // 클라이언트에게 응답 전송
        Map<String, String> response = new HashMap<>();
        response.put("message", "Form submitted successfully");

        // 클라이언트에게 이벤트 보내기
        sendEventToClient("clientId", "submitForm", "Received member_id: " + member_id);
    
        return ResponseEntity.ok(response);
    }

    public void sendEventToClient(String clientId, String eventName, String eventData) {
        SseEmitter emitter = sseEmitters.get(clientId);
        if (emitter != null) {
            try {
                emitter.send(SseEmitter.event()
                        .name(eventName)
                        .data(eventData));
            } catch (IOException e) {
                // 클라이언트 연결이 끊어지면 IOException이 발생하므로 예외 처리
                emitter.complete();
            }
        }
    }
	
}
