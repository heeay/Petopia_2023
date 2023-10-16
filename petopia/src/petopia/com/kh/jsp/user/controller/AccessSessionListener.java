package petopia.com.kh.jsp.user.controller;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class AccessSessionListener implements HttpSessionListener {
	private static int userCount;
	
    public static int getCount() {
        return userCount;
    }
	@Override
	public void sessionCreated(HttpSessionEvent event) {
		// TODO Auto-generated method stub
		if(event.getSession().isNew()) {
			userCount++;
	        System.out.println("생성된 세션 ID "+event.getSession().getId());
	        System.out.println("로그인된 사용자 수 : "+userCount);
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		// TODO Auto-generated method stub
		userCount--;
		if(userCount<0)
			userCount=0;
        System.out.println("제거된 세션 ID "+event.getSession().getId());
        System.out.println("로그인된 사용자 수 : "+userCount);
	}

}
