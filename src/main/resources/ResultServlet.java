import java.io.IOException;
import java.net.URI;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Enumeration;

import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class ResultServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//
//
        var user= request.getParameter("username");


        // Encode the username parameter
        String encodedUser = URLEncoder.encode(user, "UTF-8");



        var url = "https://api.github.com/users/"+encodedUser;

        var req = HttpRequest.newBuilder().GET().uri(URI.create(url)).build();

        var client = HttpClient.newBuilder().build();

        HttpResponse<String> res;
        try {
            res = client.send(req, HttpResponse.BodyHandlers.ofString());
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }


        // Access the desired fields
        JSONObject jsonResponse = new JSONObject(res.body());

        if (jsonResponse.has("login")) {
            // User exists, retrieve the information
            String username = jsonResponse.getString("login");
            String profileUrl = jsonResponse.getString("html_url");
            String name = jsonResponse.isNull("name") ? "" : jsonResponse.getString("name");
            int followers = jsonResponse.getInt("followers");
            int following=jsonResponse.getInt("following");
            int repositories = jsonResponse.getInt("public_repos");

            // ... (retrieve other fields)

            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("profileUrl", profileUrl);
            session.setAttribute("name", name);
            session.setAttribute("followers", followers);
            session.setAttribute("following",following);
            session.setAttribute("repositories",repositories);

            // ... (set other session attributes)
            request.removeAttribute("errorMessage");
            response.sendRedirect("Result.jsp");
        } else {
            // User does not exist, handle the error
            String errorMessage = "Incorrect username";
            request.setAttribute("errorMessage", errorMessage);

            // Forward the request to the Data.jsp page to display the error message
            RequestDispatcher dispatcher = request.getRequestDispatcher("Data.jsp");
            dispatcher.forward(request, response);

        }

    }

}

