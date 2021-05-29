<%-- 
    Document   : index
    Created on : 25 May, 2021, 3:06:33 PM
    Author     : vishal
--%>

<%@page import="entities.User"%>
<%@page import="java.util.LinkedList"%>
<%@page import="dao.UserDao"%>
<%@page import="entities.Districts"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="helping.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/index.css"/>


    </head>
    <body>
        
        <form action="">
            <input type="text" name="name" placeholder="enter your name" required="required" value="<%
                if (request.getParameter("name") == null) {
                    out.print("");
                } else {
                    out.print(request.getParameter("name"));
                }
                   %>" >

            <input type="email" name="email" placeholder="enter email id" required="required" value=" <%
                if (request.getParameter("email") == null) {
                    out.print("");
                } else {
                    out.print(request.getParameter("email"));
                }
                   %>" >


            <input type="text" name="number" placeholder="enter mobile number" pattern="[6-9]{1}[0-9]{9}" required="required" value="<%
                if (request.getParameter("number") == null) {
                    out.print("");
                } else {
                    out.print(request.getParameter("number"));
                }
                   %>" >


            <select name="state"  onchange="this.form.submit()" required="required" >
                <option value="<%
                    if (request.getParameter("state") == null) {
                        out.print("");
                    } else {
                        out.print(request.getParameter("state"));
                    }
                        %>">
                    <%
                    if (request.getParameter("state") == null) {
                        out.print("select state");
                    } else {
                        out.print(request.getParameter("state"));
                    }

                    %>
                </option>
                    <%                    
                        Connection con1 = ConnectionProvider.getConnection();
                        String query1 = "select distinct State from districts";
                        Statement stmt = con1.createStatement();
                        ResultSet rs1 = stmt.executeQuery(query1);

                        while (rs1.next()) {
                    %>

                <option value=" <%= rs1.getString("state")%>" > <%= rs1.getString("state")%> </option>
                <%

                    }
                %>


            </select>

            <select name="district" required="required" >


                <option value="">select district</option>
                <%
                    String state = request.getParameter("state");
                    if (state != null) {
                        Connection con = ConnectionProvider.getConnection();
                        String query = "select * from districts where state =" + "'" + state.trim() + "'";
                        PreparedStatement stmt1 = con.prepareStatement(query);

                        ResultSet st = stmt1.executeQuery();
                        while (st.next()) {
                %>

                <option value="<%= st.getString("district")%>"><%= st.getString("district")%></option>
                <%
                        }
                    }
                %>


            </select>
            <select name="blood" required="required">

                <option value="">select blood group</option>
                <option value="A+">A+</option>
                <option value="A-">A-</option>
                <option value="B+">B+</option>
                <option value="B-">B-</option>
                <option value="O+">O+</option>
                <option value="O-">O-</option>
                <option value="AB+">AB+</option>
                <option value="AB-">AB-</option>

            </select>
                <input type="submit" value="submit" >
        </form>
        <form >
            <%
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String mobile = request.getParameter("number");
                String blood = request.getParameter("blood");
                String Dstate = request.getParameter("state");
                String Ddist = request.getParameter("district");
                if (name != null && email != null && mobile != null && blood != null && Dstate != null && Ddist != null) {
                    User us = new User(name, mobile, email, Ddist, Dstate, blood);
                    UserDao connect = new UserDao(ConnectionProvider.getConnection());
                    boolean flag = connect.saveUser(us);
                    if(flag)
                    {
                        response.sendRedirect("index.jsp");
                    }
                }
            %>

        </form>
        

    </body>
</html>
