<%@ page import ="java.sql.*" %>
<%
    String usename = request.getParameter("username");    
    String pasword = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/data", "root", "santhu");
    Statement stmt = conn.createStatement();
    ResultSet result;
    result = stmt.executeQuery("select * from admin where uname='" + usename + "' and pwd='" + pasword + "'");
    if (result.next()) {
        session.setAttribute("usename", usename);
        //In success.jsp we will check these two conditions
        //out.println("welcome " + uname);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("adminsuccess.jsp");
    } else {
        out.println("Invalid password <a href='adminview.jsp'>try again</a>");
    }
%>