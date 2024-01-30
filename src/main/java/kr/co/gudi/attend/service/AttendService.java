package kr.co.gudi.attend.service;

import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.attend.dao.AttendDAO;
import kr.co.gudi.attend.dto.AttendDTO;

@Service
public class AttendService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AttendDAO dao;
	
	public int attTime(HashMap<String, Object> param) {
		int success=0;
		
		if(param.get("type").equals("in")) {
			//String attTimeString = (String) param.get("attTime");
			//Time attTimeValue = Time.valueOf(attTimeString);		
			success=dao.inTime(param);
		}else {
			success=dao.outTime(param);
			AttendDTO dto = new AttendDTO();
			String work=dao.getHours(param);
			logger.info("오늘 노동시간 : "+work);
			param.put("work_hours", work);
			dao.workHours(param);
		}
		return success;
	}

	public AttendDTO notiTime(int member_no, LocalDate today) {
		AttendDTO dto = new AttendDTO();
		dto = dao.notiTime(member_no,today);
		return dto;
	}

	public HashMap<String, Object> timeTable(HashMap<String, Object> map) {
		HashMap<String, Object> time = new HashMap<String, Object>();
		String work=dao.timeTable(map);
		if(work!=null) {
		work = work.startsWith("-") ? work.substring(1) : work;
		logger.info("몇시간 일했나? : "+work);
		}else {
			work="00:00:00";
		}
		// ":"를 기준으로 문자열을 분리
        String[] parts = work.split(":");
        // 첫 번째 요소를 추출하여 정수로 변환
        int hours = Integer.parseInt(parts[0]);
        int hoursCnt=0;
        while(hours>=24) {
        	hours = hours-24;
        	hoursCnt++;
        	if(hours<10) {
        		work = "0"+hours + ":" + parts[1] + ":" + parts[2];
            	logger.info("시간 크기 : "+ hours);
        	}else {
        	work = hours + ":" + parts[1] + ":" + parts[2];
        	logger.info("시간 크기 : "+ hours);
        	}
        }
        logger.info("24시간수:"+hoursCnt+"남은시간:"+work);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
	
		LocalTime localTime =LocalTime.parse(work, formatter);
		int work_seconds = localTime.toSecondOfDay()+hoursCnt*86400;
		logger.info("초 변환 : "+work_seconds);
        // 시간, 분, 초 추출
        int work_hour = localTime.getHour()+hoursCnt*24;
        int work_minute = localTime.getMinute();
        int work_second = localTime.getSecond();
		time.put("total_week_hour", work_hour);
		time.put("total_week_minute", work_minute);
		time.put("total_week_second", work_second);
		if(work_hour>=40) {
			int over_hour =work_hour-40;
			time.put("week_over_hour", over_hour);
			time.put("week_over_minute", work_minute);
			time.put("week_over_second", work_second);
		}else {
			time.put("week_over_hour", 0);
			time.put("week_over_minute", 0);
			time.put("week_over_second", 0);
		}
		int week_left = 144000;
		int week_left_hour =0-work_hour;
		int week_left_minute=0-work_minute;
		int week_left_second=0-work_second;
		int mCnt=0;
		int hCnt=0;
		if(work_seconds<week_left) {
			if(week_left_second<0) {
				week_left_second=60-work_second;
				mCnt++;
				time.put("week_left_second",week_left_second);
			}else {
				time.put("week_left_second",week_left_second);
			}
			if(week_left_minute<0) {
				week_left_minute=60-work_minute-mCnt;
				hCnt++;
				time.put("week_left_minute",week_left_minute);
			}else {
				time.put("week_left_minute",week_left_minute);
			}
			if(week_left_hour<0) {
				week_left_hour=40-work_hour-hCnt;
				time.put("week_left_hour",week_left_hour);
			}else {
				week_left_hour=40-work_hour-hCnt;
				time.put("week_left_hour",week_left_hour);
			}
				
			
		}else {
			time.put("week_left_hour", 0);
			time.put("week_left_minute", 0);
			time.put("week_left_second", 0);
		}

		 // 이번달
		// 1. 현재 날짜 구하기
        LocalDate currentDate = LocalDate.now();
        // 이번 달의 연도와 월 정보 가져오기
        int year = currentDate.getYear();
        int month = currentDate.getMonthValue();
        // 이번 달의 첫째 날 구하기
        LocalDate firstDayOfMonth = LocalDate.of(year, month, 1);
        // 이번 달의 마지막 날 구하기
        YearMonth yearMonth = YearMonth.of(year, month);
        LocalDate lastDayOfMonth = yearMonth.atEndOfMonth();
        int member_no=(int) map.get("member_no");
        String totalM=dao.totalM(firstDayOfMonth,lastDayOfMonth,member_no);
        if(totalM!=null) {
        	 totalM = totalM.startsWith("-") ? totalM.substring(1) : totalM;
             logger.info("이번달 근무시간 : "+totalM);
    		}else {
    			totalM="00:00:00";
    		}
        
     // ":"를 기준으로 문자열을 분리
        String[] total_parts = totalM.split(":");
        // 첫 번째 요소를 추출하여 정수로 변환
        int total_hours = Integer.parseInt(total_parts[0]);
        int totalCnt=0;
        while(total_hours>=24) {
        	total_hours = total_hours-24;
        	totalCnt++;
        	if(total_hours<10) {
        		totalM = "0"+total_hours + ":" + parts[1] + ":" + parts[2];
            	logger.info("시간 크기 : "+ total_hours);
        	}else {
        		totalM = total_hours + ":" + parts[1] + ":" + parts[2];
        	logger.info("시간 크기 : "+ total_hours);
        	}
        }
        LocalTime localTotalM =LocalTime.parse(totalM, formatter);
        int totalM_hour = localTotalM.getHour()+totalCnt*24;
        int totalM_minute = localTotalM.getMinute();
        int totalM_second = localTotalM.getSecond();
        time.put("total_month_hour", totalM_hour);
        time.put("total_month_minute", totalM_minute);
        time.put("total_month_second", totalM_second);
        
       int overHour = 0;
       int overMinute = 0;
       int overSecond = 0;
       int overCnt =0;
        ArrayList<String> overTime = dao.overTime(firstDayOfMonth,lastDayOfMonth,member_no);
        for (String time2 : overTime) {
        	LocalTime localOver =LocalTime.parse(time2, formatter);
        	overHour+=localOver.getHour();
        	overMinute+=localOver.getMinute();
        	overSecond+=localOver.getSecond();
        	overCnt++;
			logger.info("초과한 퇴근 시간 : "+time2);
		}
        logger.info(overHour+"시간"+overMinute+"분"+overSecond+"초");
        
        if(overTime!=null) {
        	while(overSecond>=60) {
        		overSecond=overSecond-60;
        		overMinute++;
        	}
        	while(overMinute>=60) {
        		overMinute=overMinute-60;
        		overHour++;
        	}    	
        	time.put("overTime_hour",overHour-(overCnt*18));
        	time.put("overTime_minute",overMinute);
        	time.put("overTime_second",overSecond);
        }else {
        	time.put("overTime_hour", 0);
        	time.put("overTime_minute", 0);
        	time.put("overTime_second", 0);
        }
		return time;
	}

	public HashMap<String, Object> selectDate(HashMap<String, Object> params, int member_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<AttendDTO> list = new ArrayList<AttendDTO>();
		AttendDTO dto = new AttendDTO();
		String StrYear = (String) params.get("year");
		String StrMonth = (String) params.get("month");
		int year =Integer.parseInt(StrYear);
		int month = Integer.parseInt(StrMonth);
		
		LocalDate firstDayOfMonth  = LocalDate.of(year, month, 1);
        // 현재 달의 모든 주의 시작일과 끝일 계산
        List<WeekRange> weekRanges = getWeekRanges(firstDayOfMonth);
        // 결과 출력
        int cnt=0;
        
        for (WeekRange weekRange : weekRanges) {
            logger.info("주의 시작일: " + weekRange.getStartDate() + ", 주의 끝일: " + weekRange.getEndDate());
            list=dao.selectDate(weekRange.getStartDate(),weekRange.getEndDate(),member_no);
            cnt++;
            if(list!=null) {
            	map.put(cnt+"week", list);
            }

            
        }
        return map;
    }

	
// 현재 달의 모든 주의 시작일과 끝일을 계산하는 메서드
private static List<WeekRange> getWeekRanges(LocalDate firstDayOfMonth) {
    List<WeekRange> weekRanges = new ArrayList<>();
    LocalDate currentDate = firstDayOfMonth;

    // 현재 달의 모든 주의 시작일과 끝일 계산
    while (currentDate.getMonthValue() == firstDayOfMonth.getMonthValue()) {
        LocalDate startOfWeek = currentDate.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));
        LocalDate endOfWeek = currentDate.with(TemporalAdjusters.nextOrSame(DayOfWeek.SUNDAY));
        weekRanges.add(new WeekRange(startOfWeek, endOfWeek));

        currentDate = endOfWeek.plusDays(1);
    }

    return weekRanges;
}
	
private static class WeekRange {
    private final LocalDate startDate;
    private final LocalDate endDate;

    public WeekRange(LocalDate startDate, LocalDate endDate) {
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }
}

public HashMap<String, Object> calLeave(int member_no) {
	logger.info("직원번호 : "+member_no);
	HashMap<String, Object> info = new HashMap<String, Object>();
	HashMap<String, Object> map = new HashMap<String, Object>();
	info = dao.calLeave(member_no);
	String position=(String) info.get("member_position");
	Date hired=(Date) info.get("hired");
	int total_leave=0;
	Object totalLeaveObj = info.get("total_leave");
	if (totalLeaveObj != null) {
	    if (totalLeaveObj instanceof Integer) {
	        // 이미 정수인 경우 캐스팅
	        total_leave = (int) totalLeaveObj;
	    } 
	}
	int month_leave =0;
	Object monthLeaveObj = info.get("month_leave");
	if (monthLeaveObj != null) {
	    if (monthLeaveObj instanceof Integer) {
	        // 이미 정수인 경우 캐스팅
	    	month_leave = (int) monthLeaveObj;
	    } 
	}
	logger.info("직급 : "+ position);
	logger.info("입사일 : "+ hired);
	
	 // 현재 날짜를 구함
    LocalDate currentDate = LocalDate.now();
	// Date 타입을 LocalDate로 변환
    LocalDate convertedHiredDate = hired.toLocalDate();
    // 현재 날짜와 주어진 날짜와의 차이를 계산
    long daysDifference = ChronoUnit.DAYS.between(convertedHiredDate, currentDate);
    logger.info("근속일 : "+daysDifference);
    if(daysDifference<=365&&position.equals("사원")) {
    	logger.info("근속 1년미만 직원은 월차 계산");
    	map.put("leaveY", 0);
		map.put("leaveM", month_leave);
		map.put("leaveA", month_leave);
		map.put("leaveC", total_leave);
		map.put("leaveU", 10-total_leave);
    }else {
    	logger.info("근속 1년이상이거나 대리이상은 연차 계산");
    	if(position.equals("사원")) {
    		map.put("leaveY", 10);
    		map.put("leaveM", 0);
    		map.put("leaveA", 10);
    		map.put("leaveC", total_leave);
    		map.put("leaveU", 10-total_leave);
    	}else if(position.equals("대리")) {
    		map.put("leaveY", 13);
    		map.put("leaveM", 0);
    		map.put("leaveA", 13);
    		map.put("leaveC", total_leave);
    		map.put("leaveU", 13-total_leave);
    	}else if(position.equals("과장")) {
    		map.put("leaveY", 15);
    		map.put("leaveM", 0);
    		map.put("leaveA", 15);
    		map.put("leaveC", total_leave);
    		map.put("leaveU", 15-total_leave);
    	}else if(position.equals("팀장")) {
    		map.put("leaveY", 18);
    		map.put("leaveM", 0);
    		map.put("leaveA", 18);
    		map.put("leaveC", total_leave);
    		map.put("leaveU", 18-total_leave);
    	}else if(position.equals("부장")) {
    		map.put("leaveY", 20);
    		map.put("leaveM", 0);
    		map.put("leaveA", 20);
    		map.put("leaveC", total_leave);
    		map.put("leaveU", 20-total_leave);
    	}else if(position.equals("이사")) {
    		map.put("leaveY", 23);
    		map.put("leaveM", 0);
    		map.put("leaveA", 23);
    		map.put("leaveC", total_leave);
    		map.put("leaveU", 23-total_leave);
    	}else if(position.equals("대표")) {
    		map.put("leaveY", 25);
    		map.put("leaveM", 0);
    		map.put("leaveA", 25);
    		map.put("leaveC", total_leave);
    		map.put("leaveU", 25-total_leave);
    	}
    }
    
	return map;
}

public HashMap<String, Object> useList(int member_no, String selectFilter) {
	HashMap<String, Object> map = new HashMap<String, Object>();
	List<AttendDTO> dto=dao.useList(member_no,selectFilter);
	map.put("list", dto);
	
	return map;
}

}
