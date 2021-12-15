<%-- 
    Document   : mentorRegister
    Created on : Dec 6, 2021, 6:39:04 PM
    Author     : HELLO
--%>

<%@page import="dao.SkillDao"%>
<%@page import="dao.UserDAO"%>
<%@page import="context.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Skill"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
                DBConnect dc = new DBConnect();
                SkillDao dao = new SkillDao(dc);
                List<Skill> skillPopular = dao.getSkillHaveManyRequest();
                List<Skill> skillList = dao.getSkillList();
                List<Skill> topSkill = dao.getTopSkill();

            %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mentor Register</title>
        <link href="css/mentorRegister.css" rel="stylesheet" type="text/css"/>
        <script>
            var count=30;
            var counter=setInterval(timer, 1000); //1000 will  run it every 1 second

            function timer() {
                count=count-1;
                if (count <= 0){
                clearInterval(counter);
                //counter ended, do something here
                return;
                }
                //Do code for showing the number of seconds here
            }
        </script>
    </head>
    <body>
        <form action="MentorRegister?service=addRequestMentor&id=${sessionScope.user.id == null ? 1 : sessionScope.user.id}" method="POST">
            <div style="background-color: #2499e3" class="container">
                <div class="menter-register" id="menter-register">
                    <div class="menter-register__heading">
                        <p class="heading-title">CV Mentor Register</p>
                        <p style="color:red; text-align:center" >${thongbao}</p>
                    </div>
                    <div class="menter-register__item">
                        <label for="link-linkedin" class="menter-register__label">Full Name: </label>
                        <input type="" id="link-linkedin" class="mentor-register__input" value="${sessionScope.user.fullName}" disabled="disabled"> 
                    </div>
                    <div class="menter-register__item">
                        <label for="link-linkedin" class="menter-register__label">Email: </label>
                        <input type="" id="link-linkedin" class="mentor-register__input" value="${sessionScope.user.email}" disabled="disabled"> 
                    </div>
                    <div class="menter-register__item">
                        <label for="link-linkedin" class="menter-register__label">Phone Number: </label>
                        <input type="" id="link-linkedin" class="mentor-register__input" value="${sessionScope.user.phone}" disabled="disabled"> 
                    </div>
                    <div class="menter-register__item">
                        <label for="link-linkedin" class="menter-register__label">Address</label>
                        <input type="" id="link-linkedin" class="mentor-register__input" value="${sessionScope.user.address}" disabled="disabled"> 
                    </div>
                    <div class="menter-register__item">
                        <label for="link-linkedin" class="menter-register__label">Introduction: </label>
                        <input type="" id="link-linkedin" class="mentor-register__input" name="introduce"> 
                    </div>

                    <div class="menter-register__body">
                        <div class="menter-register__item">
                            <label for="skill" class="menter-register__label">
                                <p class="red-star">*</p>
                                Skill:
                            </label>    
                            <select name="nameSkill" class="mentor-register__input" multiple="true" size="6" multiple required>
                                <%                                    for (Skill item : skillList) {
                                %>
                                <option value="<%=item.getId()%>" ><%=item.getName()%></option>
                                <%}%>
                                </c:forEach>>
                            </select>
                        </div>
                        <div> 
                            <span id="timer"></span>
                            <input style="margin-left: 260px" class="btn btn--radius-2 btn--blue" type="submit" value="Register" />
                        </div>
                    </div>
                    </form>

                </div>
            </div>
    </body>
</html>

