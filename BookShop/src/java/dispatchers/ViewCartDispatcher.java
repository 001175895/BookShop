package dispatchers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.persistence.EntityManager;
import model.CartItem;
import java.util.Map;

public class ViewCartDispatcher implements IDispatcher {

    @Override
    public String execute(HttpServletRequest request) {
        HttpSession session = request.getSession();
        
            String nextPage = "/jsp/cart.jsp";
            Map cart = (Map) session.getAttribute("cart");
            if (cart == null) {
                nextPage = "/jsp/titles.jsp";
            }
        
        return nextPage;
    }
}
