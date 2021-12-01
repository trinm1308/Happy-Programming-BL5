<%-- 
    Document   : login
    Created on : Nov 30, 2021, 5:11:03 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        <form action="LoginController" method="POST">
            Username: <input type="text" name="username"  required />
            <br/>
            Password: <input type="password" name="password" required/>
            <br/>
            Remember<input type="checkbox" name="remember-me" value="ON" />   <br/>
            <p style = "color: red"> ${mess} </p>
                               <input type="submit" value="Login" />
            <a href="fb.com">Forgot password</a>
        </form> 
    </body>
</html>
