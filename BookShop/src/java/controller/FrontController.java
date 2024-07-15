package controller;

import dispatchers.AddToCartDispatcher;
import dispatchers.CheckoutDispatcher;
import dispatchers.ContinueDispatcher;
import dispatchers.IDispatcher;
import dispatchers.TitlesDispatcher;
import dispatchers.UpdateCartDispatcher;
import dispatchers.ViewCartDispatcher;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.persistence.*;
import java.io.*;
import java.util.*;
import model.Tbooks;

public class FrontController extends HttpServlet {
    
    
    
    private final HashMap actions = new HashMap();

   
    @Override
        public void init(ServletConfig config) throws ServletException {
        super.init(config);
        
        actions.put("add_to_cart", new AddToCartDispatcher());
        actions.put("titles", new TitlesDispatcher());
        actions.put("checkout", new CheckoutDispatcher());
        actions.put("view_cart", new ViewCartDispatcher());
        actions.put("continue", new ContinueDispatcher());
        actions.put("update_cart", new UpdateCartDispatcher());
                
    }

   
        public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.err.println("doGet()");
        doPost(request, response);

    }

 
        public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String requestedAction = request.getParameter("action");
        if (requestedAction == null){
            requestedAction = "titles";
        }
    
        IDispatcher dispatcher = (IDispatcher) actions.get(requestedAction);
        String page = dispatcher.execute(request);
         this.dispatch(request, response, page);
        
        
//        if (requestedAction == "titles") { 
//        //moved the code to dispatcher
//            Dispatcher dispatcher = (Dispatcher) actions.get(requestedAction);
//            
//            String page = dispatcher.execute(request); 
//            this.dispatch(request, response, page);
//            
//        } else if (requestedAction.equals("add_to_cart")) {
//              Dispatcher dispatcher = (Dispatcher) actions.get(requestedAction);
//            
//            String page = dispatcher.execute(request); 
//            this.dispatch(request, response, page);
//
//        } else if (requestedAction.equals("checkout")) {
//          Dispatcher dispatcher = (Dispatcher) actions.get(requestedAction);
//            
//            String page = dispatcher.execute(request); 
//            this.dispatch(request, response, page);
//        } else if (requestedAction.equals("continue")) {
//          Dispatcher dispatcher = (Dispatcher) actions.get(requestedAction);
//            
//            String page = dispatcher.execute(request); 
//            this.dispatch(request, response, page);
//        } else if (requestedAction.equals("update_cart")) {
//            Dispatcher dispatcher = (Dispatcher) actions.get(requestedAction);
//            
//            String page = dispatcher.execute(request); 
//            this.dispatch(request, response, page);
//     
//        } else if (requestedAction.equals("view_cart")) { 
//              Dispatcher dispatcher = (Dispatcher) actions.get(requestedAction);
//            
//            String page = dispatcher.execute(request); 
//            this.dispatch(request, response, page);
//        }
    }

//    private Book getBookFromList(String isbn, HttpSession session) {
//        List list = (List) session.getAttribute("Books");
//        Book aBook = null;
//        for (int i = 0; i < list.size(); i++) {
//            aBook = (Book) list.get(i);
//            if (isbn.equals(aBook.getIsbn())) {
//                break;
//            }
//        }
//        return aBook;
//    }

    private void dispatch(HttpServletRequest request, HttpServletResponse response, String page) throws ServletException,
            IOException {
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
        dispatcher.forward(request, response);
    }
        public String getServletInfo() {
        return "controller.FrontController Information";
    }

}
