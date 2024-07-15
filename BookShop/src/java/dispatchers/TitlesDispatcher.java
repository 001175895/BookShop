
package dispatchers;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.Book;

public class TitlesDispatcher implements IDispatcher {
    private EntityManagerFactory emf;
    private EntityManager em;
    
    @Override
    public String execute(HttpServletRequest request){
        
        

            emf = Persistence.createEntityManagerFactory("BookPU");
            em =  emf.createEntityManager();
            List books = null;
            String nextPage = "/jsp/error.jsp";
            HttpSession session = request.getSession();
            try {

                books = em.createNamedQuery("Tbooks.findAll", Book.class).getResultList();
                session.setAttribute("Books", books);
                emf.close();
                nextPage = "/jsp/titles.jsp";

            } catch (Exception ex) {
                request.setAttribute("result", ex.getMessage());
                nextPage = "/jsp/error.jsp";
            }        
        
        return nextPage;
    }

}
