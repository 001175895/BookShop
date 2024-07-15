package dispatchers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.persistence.EntityManager;

public class ContinueDispatcher implements IDispatcher {

    @Override
    public String execute(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String nextPage = "/jsp/titles.jsp";
        
        return nextPage;
    }
}
