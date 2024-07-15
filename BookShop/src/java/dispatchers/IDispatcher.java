
package dispatchers;

import javax.servlet.http.HttpServletRequest;

public interface IDispatcher {

    /**
     *
     * @param request
     * @return execute method
     */
    public String execute (HttpServletRequest request);


}
