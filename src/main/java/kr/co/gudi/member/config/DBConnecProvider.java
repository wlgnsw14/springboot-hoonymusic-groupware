package kr.co.gudi.member.config;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import kr.co.gudi.member.dao.MemberDAO;
import kr.co.gudi.member.vo.MemberVO;

@Component
public class DBConnecProvider implements AuthenticationProvider {
	@Autowired
	private MemberDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Bean
	public BCryptPasswordEncoder encoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String member_id = authentication.getName();	// 인증 객체에서 id를 가져옴
		String pw = (String) authentication.getCredentials();		// 인증 객체에서 비밀번호를 가져옴
		
		MemberVO loginMember = dao.selectMemberByParam(Map.of("member_id", member_id));
		
		if (loginMember == null || !encoder().matches(pw, loginMember.getPassword())) {	// 로그인 실패시
			throw new BadCredentialsException("로그인에 실패하였습니다!!");
		} else {
			if (loginMember.isCredentialsNonExpired()) {	// 퇴사자 라면
				return new UsernamePasswordAuthenticationToken(loginMember, pw, loginMember.getAuthorities());	// 인증된 객체
			} else {
				throw new BadCredentialsException("인증에 실패했습니다.");
			}
		}
	}

	@Override
	public boolean supports(Class<?> authentication) { //토큰 타입과 일치하면 인증
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}

}
