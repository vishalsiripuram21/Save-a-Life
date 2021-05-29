
<%@page import="java.sql.PreparedStatement"%>
<%-- 
    Document   : Recipient
    Created on : 25 May, 2021, 4:22:42 PM
    Author     : vishal
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="entities.User"%>
<%@page import="dao.UserDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.mysql.cj.xdevapi.SelectStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="helping.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

    </head>
    <body>
        <form action="" >
            <select name="blood" required="required">
                <option value="">select</option>
                <option value="A+">A+</option>
                <option value="A-">A-</option>
                <option value="B+">B+</option>
                <option value="B-">B-</option>
                <option value="O+">O+</option>
                <option value="O-">O-</option>
                <option value="AB+">AB+</option>
                <option value="AB-">AB-</option> 
            </select>
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
                        String query1 = "select distinct state from userDetails";
                        Statement stmt = con1.createStatement();
                        ResultSet rs1 = stmt.executeQuery(query1);
                        session.setAttribute("val", rs1);

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
                    String state=request.getParameter("state");
                    if (state != null) {
                        state = request.getParameter("state").trim();
                        Connection con = ConnectionProvider.getConnection();
                        System.out.println(state);
                        String query = "select distinct district from userDetails where state =" + "' "+state.trim()+"';";
                        System.out.println(query);
                        PreparedStatement stmt1 = con.prepareStatement(query);
                        ResultSet st = stmt1.executeQuery();
                        while (st.next()) {
                           %>
                           <option value="<%=st.getString("district")%>"><%= st.getString("district") %></option>

                          <%
                
                        }
                    }

                %>

            </select>
                <input type="submit" value="search">
        </form>
                <%
            String s1 = request.getParameter("blood");
            String s2 = request.getParameter("district");
            String s3 = request.getParameter("state");
            
            if(s1!=null && s2!=null && s3!=null)
            {
                System.out.println(s1+"==>"+s2+"==>"+s3);
            UserDao data = new UserDao(ConnectionProvider.getConnection());
            User search = new User(s1, s2, s3.trim());
            LinkedList<User> uData = data.searchUser(search);
        %>
                <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Mobile</th>
                        <th scope="col">Email</th>
                        <th scope="col">District</th>
                        <th scope="col">State</th>
                        <th scope="col">Blood Group</th>
                    </tr>
                </thead><tbody>

                    <%
                        for (User d : uData) {
                    %> 
                    <tr>

                        <th scope="row"><%= d.getName()%></th>
                        <td><%= d.getMobile()%></td>
                        <td><%= d.getEmail()%></td>
                        <td><%= d.getDistrict()%></td>
                        <td><%= d.getState()%></td>
                        <td><%= d.getBlood()%></td>
                    </tr>

                    <%
                        }
}
                    %>
                </tbody>
            </table>
        </div>
              
    </body>
</html>
