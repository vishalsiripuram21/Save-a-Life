<%-- 
    Document   : index
    Created on : 25 May, 2021, 3:06:33 PM
    Author     : vishal
--%>

<%@page import="helping.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="signin.css" rel="stylesheet">
  </head>

  <body class="text-center">

      
      <form action="Donor.jsp" method="post">
          <input class="btn btn-lg btn-primary btn-block mt-5"  type="submit" value="register"></input>
      </form>
      <form action="Recipient.jsp">
                <input class="btn btn-lg btn-primary btn-block mt-5" type="submit" value="reciever"></input>

      </form>

  </body>
</html>