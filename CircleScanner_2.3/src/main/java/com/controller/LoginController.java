package com.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.LoginDTO;
import com.dto.Token;
import com.google.gson.Gson;
import com.service.KakaoAPI;
import com.service.KakaoLogoutAPI;

// 미림 호빈 재여 20201207~20201210
@Controller
public class LoginController {
	
	@Autowired
	private KakaoAPI kakao;
	@Autowired
	private KakaoLogoutAPI kakaoLogoutAPI;

	// 카카오 로그인
	@RequestMapping(value = "/KakaoRedirect")
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session) {
		// Token 받아오기
		String accessToken = kakao.getAccessToken(code);
		System.out.println("code===" + code);

		HashMap<String, Object> userInfo = kakao.getUserInfo(accessToken);
		System.out.println("login Controller======== " + userInfo);

		// 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
		if (userInfo.get("email") != null) {
			LoginDTO loginDTO = new LoginDTO();
			loginDTO.setE_mail((String) userInfo.get("email"));
			session.setAttribute("userEmail", userInfo.get("email"));
			session.setAttribute("loginDTO", loginDTO);
		}
		return "main";
	}

    // 구글 / 카카오톡 로그아웃 
	@RequestMapping(value = "/KakaoLogoutController")
	public String KakaoLogoutController(HttpSession session) {
		session.removeAttribute("userEmail");
		return "main";
	}
	
	// 구글 로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(@RequestParam("code") String code, HttpSession session) throws IOException {
		String query = "code=" + code;
		query += "&client_id=" + "49105029524-075to6oto0ovlfgia5famptqki3tcm12.apps.googleusercontent.com";
		query += "&client_secret=" + "4Awt_-Ags2qJogFwA6DBd1D3";
		query += "&redirect_uri=" + "http://localhost:8090/CircleScanner/login";
		query += "&grant_type=authorization_code";

		String tokenJson = getHttpConnection("https://accounts.google.com/o/oauth2/token", query);
		System.out.println(tokenJson.toString());
		Gson gson = new Gson();
		Token token = gson.fromJson(tokenJson, Token.class);

		String userInfo = getHttpConnection(
				"https://www.googleapis.com/oauth2/v1/userinfo?access_token=" + token.getAccess_token());
		System.out.println("userInfo===" + userInfo);
		JSONObject jObject = new JSONObject(userInfo);
		String id = jObject.getString("id");
		String email = jObject.getString("email");
		boolean verified_email = jObject.getBoolean("verified_email");

//		System.out.println(id + "\t" + email + "\t" + verified_email);

		if (email != null) {
			LoginDTO loginDTO = new LoginDTO();
			loginDTO.setE_mail(email);
			session.setAttribute("userEmail", email);
			session.setAttribute("loginDTO", loginDTO);
		}
		return "redirect:/";
	}

	private String getHttpConnection(String uri) throws IOException {
		URL url = new URL(uri);
		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		int responseCode = conn.getResponseCode();
//		System.out.println(responseCode);

		String line;
		String info = "";
		StringBuffer buffer = new StringBuffer();
		ArrayList<String> list = new ArrayList<String>();
		try (InputStream stream = conn.getInputStream()) {
			try (BufferedReader rd = new BufferedReader(new InputStreamReader(stream))) {
				while ((line = rd.readLine()) != null) {
					buffer.append(line);
					buffer.append('\r');
					list.add(line);
					info += line;
				}
			}
		} catch (Throwable e) {
			e.printStackTrace();
		}
		System.out.println(buffer.toString());

		return info;
	}

	private String getHttpConnection(String uri, String param) throws IOException {
		URL url = new URL(uri);
		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		conn.setRequestMethod("POST");
		conn.setDoOutput(true);
		try (OutputStream stream = conn.getOutputStream()) {
			try (BufferedWriter wd = new BufferedWriter(new OutputStreamWriter(stream))) {
				wd.write(param);
			}
		}
		int responseCode = conn.getResponseCode();
		System.out.println(responseCode);

		String line;
		StringBuffer buffer = new StringBuffer();
		try (InputStream stream = conn.getInputStream()) {
			try (BufferedReader rd = new BufferedReader(new InputStreamReader(stream))) {
				while ((line = rd.readLine()) != null) {
					buffer.append(line);
					buffer.append('\r');
				}
			}
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return buffer.toString();
	}

}
