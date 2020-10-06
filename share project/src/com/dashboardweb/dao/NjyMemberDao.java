package com.dashboardweb.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import com.dashboardweb.vo.NjyMemberVo;

import oracle.jdbc.OracleDriver;

public class NjyMemberDao {

	public ArrayList<String> selectnamesByname(String playerName) {

		// DB 연동에 사용되는 객체 (변수 선언)
		Connection conn = null; // 연결 관리
		PreparedStatement pstmt = null; // 명령 처리
		ResultSet rs = null; // 결과 집합 접근

		ArrayList<String> playerNames = new ArrayList<String>();

		// DB 연동에서 발생하는 예외는 반드시 예외처리 필요 (checked exception)
		try { // 예외 발생이 의심되는 영역 (여기서 발생한 예외만 catch 가능)

			// 1. JDBC 드라이버 준비
			DriverManager.registerDriver(new OracleDriver());

			// 2. 연결 (연결 객체 만들기)
			conn = DriverManager.getConnection("jdbc:oracle:thin:@200.1.220.251:1521:xe", // 서버 연결 정보
					"team_one", "one"); // 계정 정보 (id, password)

			// 3. SQL 작성 + 명령 객체 만들기
			String sql = "SELECT ID, PLAYER " +
						 "FROM PLAYERSINFO " +
						 "WHERE PLAYER LIKE ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, playerName + "%");

			// 4. 명령 실행 + 결과 집합 저장 ( select인 경우 )
			rs = pstmt.executeQuery();

			// 5. 결과 처리 (결과가 있을 경우, select인 경우)
			while (rs.next()) { // next() : 결과 집합의 다음 행으로 이동 (데이터가 없으면 false 반환)				
				playerNames.add(String.format("%d:%s", rs.getInt(1), rs.getString(2)));
			}

		} catch (Exception ex) { // 예외가 발생하면 실행되는 영역
			ex.printStackTrace(); // 오류 메시지를 화면에 출력
		} finally { // 예외 발생 여부와 상관없이 항상 실행되는 영역
			// 6. 연결 닫기 (종료)
			try {
				rs.close();
			} catch (Exception ex) {
			}
			try {
				pstmt.close();
			} catch (Exception ex) {
			}
			try {
				conn.close();
			} catch (Exception ex) {
			}
		}

		return playerNames; // 조회 결과를 호출한 곳으로 반환
	}

	public NjyMemberVo selectById(String playerId) {
		
		// DB 연동에 사용되는 객체 (변수 선언)
		Connection conn = null; // 연결 관리
		PreparedStatement pstmt = null; // 명령 처리
		ResultSet rs = null; // 결과 집합 접근

		NjyMemberVo  memberInfo = null; 
		
		// DB 연동에서 발생하는 예외는 반드시 예외처리 필요 (checked exception)
		try { // 예외 발생이 의심되는 영역 (여기서 발생한 예외만 catch 가능)

			// 1. JDBC 드라이버 준비
			DriverManager.registerDriver(new OracleDriver());

			// 2. 연결 (연결 객체 만들기)
			conn = DriverManager.getConnection("jdbc:oracle:thin:@200.1.220.251:1521:xe", // 서버 연결 정보
					"team_one", "one"); // 계정 정보 (id, password)

			// 3. SQL 작성 + 명령 객체 만들기
			String sql = "SELECT P.PLAYER, P.ID, P.BIRTHDATE, P.POSITION, P.HEIGHT, P.WEIGHT, P.SALARY, P.FIRST_YEAR, N.TEAM_NAME " +
						 "FROM PLAYERSINFO P, NJ_SERVICE_DATA N " +
						 "WHERE P.ID = ? AND N.ID = ? ";
						 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, playerId);
			pstmt.setString(2, playerId);

			// 4. 명령 실행 + 결과 집합 저장 ( select인 경우 )
			rs = pstmt.executeQuery();

			// 5. 결과 처리 (결과가 있을 경우, select인 경우)
			if (rs.next()) { // next() : 결과 집합의 다음 행으로 이동 (데이터가 없으면 false 반환)
				memberInfo = new NjyMemberVo();
				memberInfo.setPlayerName(rs.getString(1));
				memberInfo.setPlayerId(rs.getInt(2));
				memberInfo.setBirthDate(rs.getString(3));
				memberInfo.setPosition(rs.getString(4));
				memberInfo.setHeight(rs.getString(5));
				memberInfo.setWeight(rs.getString(6));
				memberInfo.setSalary(rs.getString(7));
				memberInfo.setFirstYear(rs.getString(8));
				memberInfo.setTeamName(rs.getString(9));
			}

		} catch (Exception ex) { // 예외가 발생하면 실행되는 영역
			ex.printStackTrace(); // 오류 메시지를 화면에 출력
		} finally { // 예외 발생 여부와 상관없이 항상 실행되는 영역
			// 6. 연결 닫기 (종료)
			try {
				rs.close();
			} catch (Exception ex) {
			}
			try {
				pstmt.close();
			} catch (Exception ex) {
			}
			try {
				conn.close();
			} catch (Exception ex) {
			}
		}

		return memberInfo;
		
	}

}
