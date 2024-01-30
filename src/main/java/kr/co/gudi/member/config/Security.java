package kr.co.gudi.member.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.web.cors.CorsUtils;

import kr.co.gudi.member.dto.MemberAuthority;

@Configuration
@EnableWebSecurity
public class Security {
	@Autowired
	private DBConnecProvider provider;
	
	@Bean
	public SecurityFilterChain authenticationPath(HttpSecurity http) throws Exception {
		return http.csrf().disable()
				.formLogin()
					.successForwardUrl("/login/success")
					.failureForwardUrl("/login/fail")
					.passwordParameter("pw")
					.usernameParameter("member_id")
					.loginProcessingUrl("/login")
					.loginPage("/loginPage")
				.and()
				.authorizeHttpRequests()		// 인증, 인가 관련 설정
					.requestMatchers(CorsUtils::isPreFlightRequest).permitAll()
					.antMatchers("/error/**").permitAll()
					.antMatchers("/loginPage").permitAll()
					.antMatchers("/logout").permitAll()
					.antMatchers("/resources/**").permitAll()
					.antMatchers("/login/**").permitAll()
					.antMatchers("/email/**").permitAll()
					/*
					.antMatchers("/employee/job").hasAnyAuthority(MemberAuthority)
					.antMatchers("/employee/emroll").hasAnyAuthority(MemberAuthority.TEAM_EMP.name())
					*/
				.and()
				.logout()
					.logoutSuccessUrl("/loginPage")
					.logoutUrl("/logout")
					.invalidateHttpSession(true)
				.and()
				.sessionManagement()
					.invalidSessionUrl("/loginPage")
				.and()
				.exceptionHandling()
					.authenticationEntryPoint(new AuthenticationEntryPoint() {
						
						@Override
						public void commence(HttpServletRequest request, HttpServletResponse response,
								AuthenticationException authException) throws IOException, ServletException {
							response.sendRedirect(request.getContextPath()+"/error/login");
						}
					}).accessDeniedHandler(new AccessDeniedHandler() {
						
						@Override
						public void handle(HttpServletRequest request, HttpServletResponse response,
								AccessDeniedException accessDeniedException) throws IOException, ServletException {
							response.sendRedirect(request.getContextPath()+"/error/auth");
						}
					})
				.and()
				.headers()
				.frameOptions().sameOrigin()
				.and()
				.authenticationProvider(provider)
				.build();
	}
}
