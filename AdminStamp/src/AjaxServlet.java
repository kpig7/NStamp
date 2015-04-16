
 
import java.io.IOException;
import java.io.PrintWriter;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
public class AjaxServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
        
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
     
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String command = request.getParameter("command");
        if(command.equals("getHello")){
            getHello(request,response);
        }else if(command.equals("postHello")){
            postHello(request,response);
        }
    }
 
    // postHello.html 에서의 요청 처리 
        private void getHello(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}


		protected void postHello(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
            response.setContentType("text/html;charset=UTF-8");
            response.setHeader("Cache-Control   ", "no-cache");
             
            PrintWriter out = response.getWriter();
            String name = request.getParameter("name");
            String lang = request.getParameter("lang");
            if(lang.equals("kor")){
                out.println("<font color='green'>"+name+" 님<br><span id='callbacknestgap85tistorycom876085' style='width:1px; height:1px; float:right'><embed allowscriptaccess='always' id='bootstrappergap85tistorycom876085' src='http://gap85.tistory.com/plugin/CallBack_bootstrapperSrc?nil_profile=tistory&nil_type=copied_post' width='1' height='1' wmode='transparent' type='application/x-shockwave-flash' enablecontextmenu='false' flashvars='&callbackId=gap85tistorycom876085&host=http://gap85.tistory.com&embedCodeSrc=http%3A%2F%2Fgap85.tistory.com%2Fplugin%2FCallBack_bootstrapper%3F%26src%3Dhttp%3A%2F%2Fs1.daumcdn.net%2Fcfs.tistory%2Fresource%2F477%2Fblog%2Fplugins%2FCallBack%2Fcallback%26id%3D87%26callbackId%3Dgap85tistorycom876085%26destDocId%3Dcallbacknestgap85tistorycom876085%26host%3Dhttp%3A%2F%2Fgap85.tistory.com%26float%3Dleft' swliveconnect='true'></span>안녕하세요 반갑습니다.</font>");
            }else if(lang.equals("eng")){
                out.println("<font color='green'>"+name+". <br>Hello. Nice to meet You.</font>");
            }else{
                out.println("제대로 안넘어옴.");
            }
        }
}