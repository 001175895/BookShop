package dispatchers;

import java.util.Iterator;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.persistence.EntityManager;
import model.CartItem;
import java.util.Map;
import java.util.Set;

public class UpdateCartDispatcher implements IDispatcher {

    @Override
    public String execute(HttpServletRequest request) {
         HttpSession session = request.getSession();

        
            Map cart = null;
            CartItem item = null;
            String isbn = null;
            String nextPage = "/jsp/cart.jsp";
            cart = (Map) session.getAttribute("cart");
            String[] booksToRemove = request.getParameterValues("remove");
            if (booksToRemove != null) {
                for (int i = 0; i < booksToRemove.length; i++) {
                    cart.remove(booksToRemove[i]);
                }
            }
            Set entries = cart.entrySet();
            Iterator iter = entries.iterator();
            while (iter.hasNext()) {
                Map.Entry entry = (Map.Entry) iter.next();
                isbn = (String) entry.getKey();
                item = (CartItem) entry.getValue();
                int quantity = Integer.parseInt((request.getParameter(isbn)));
                item.updateQuantity(quantity);
            }
            
          return nextPage;
    }
}