<%-- 
    Document   : template
    Created on : Oct 13, 2021, 11:16:31 PM
    Author     : Tri
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Font Awesome JS -->
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>

        <!-- Bootstrap CSS CDN -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

        <!-- jQuery CDN - Slim version (=without AJAX) -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

        <!-- Popper.JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>

        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

        <!-- Scrollbar Custom CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

        <!-- jQuery Custom Scroller CDN -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

        <title>Happy Programming</title>

        <!--Custom CSS-->
        <link rel="stylesheet" href="css/template.css" />
        <link rel="stylesheet" href="css/sidebar.css" />
    </head>
    <body>
        <div class="body-container wrapper">
            <nav id="sidebar">
                <div class="sidebar-header">
                    <h3>Bootstrap Sidebar</h3>
                </div>

                <ul class="list-unstyled components">
                    <p>Dummy Heading</p>
                    <li class="active">
                        <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Home</a>
                        <ul class="collapse list-unstyled" id="homeSubmenu">
                            <li>
                                <a href="#">Home 1</a>
                            </li>
                            <li>
                                <a href="#">Home 2</a>
                            </li>
                            <li>
                                <a href="#">Home 3</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">About</a>
                    </li>
                    <li>
                        <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Pages</a>
                        <ul class="collapse list-unstyled" id="pageSubmenu">
                            <li>
                                <a href="#">Page 1</a>
                            </li>
                            <li>
                                <a href="#">Page 2</a>
                            </li>
                            <li>
                                <a href="#">Page 3</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">Portfolio</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>
                </ul>

            </nav>
            <div id="content">
                <%@include file="header.jsp" %>
                <!--Thay code vao day-->
                <div class="main-content">
                    INTRODUCTION<br>

                    1. The Industrial Revolution and its consequences have been a disaster for the human race. They have greatly increased the life-expectancy of those of us who live in “advanced” countries, but they have destabilized society, have made life unfulfilling, have subjected human beings to indignities, have led to widespread psychological suffering (in the Third World to physical suffering as well) and have inflicted severe damage on the natural world. The continued development of technology will worsen the situation. It will certainly subject human beings to greater indignities and inflict greater damage on the natural world, it will probably lead to greater social disruption and psychological suffering, and it may lead to increased physical suffering even in “advanced” countries.<br>

                    2. The industrial-technological system may survive or it may break down. If it survives, it MAY eventually achieve a low level of physical and psychological suffering, but only after passing through a long and very painful period of adjustment and only at the cost of permanently reducing human beings and many other living organisms to engineered products and mere cogs in the social machine. Furthermore, if the system survives, the consequences will be inevitable: There is no way of reforming or modifying the system so as to prevent it from depriving people of dignity and autonomy.<br>

                    3. If the system breaks down the consequences will still be very painful. But the bigger the system grows the more disastrous the results of its breakdown will be, so if it is to break down it had best break down sooner rather than later.<br>

                    4. We therefore advocate a revolution against the industrial system. This revolution may or may not make use of violence; it may be sudden or it may be a relatively gradual process spanning a few decades. We can’t predict any of that. But we do outline in a very general way the measures that those who hate the industrial system should take in order to prepare the way for a revolution against that form of society. This is not to be a POLITICAL revolution. Its object will be to overthrow not governments but the economic and technological basis of the present society.<br>

                    5. In this article we give attention to only some of the negative developments that have grown out of the industrial-technological system. Other such developments we mention only briefly or ignore altogether. This does not mean that we regard these other developments as unimportant. For practical reasons we have to confine our discussion to areas that have received insufficient public attention or in which we have something new to say. For example, since there are well-developed environmental and wilderness movements, we have written very little about environmental degradation or the destruction of wild nature, even though we consider these to be highly important.<br>

                    THE PSYCHOLOGY OF MODERN LEFTISM<br>

                    6. Almost everyone will agree that we live in a deeply troubled society. One of the most widespread manifestations of the craziness of our world is leftism, so a discussion of the psychology of leftism can serve as an introduction to the discussion of the problems of modern society in general.<br>

                    7. But what is leftism? During the first half of the 20th century leftism could have been practically identified with socialism. Today the movement is fragmented and it is not clear who can properly be called a leftist. When we speak of leftists in this article we have in mind mainly socialists, collectivists, “politically correct” types, feminists, gay and disability activists, animal rights activists and the like. But not everyone who is associated with one of these movements is a leftist. What we are trying to get at in discussing leftism is not so much movement or an ideology as a psychological type, or rather a collection of related types. Thus, what we mean by “leftism” will emerge more clearly in the course of our discussion of leftist psychology. (Also, see paragraphs 227-230.)<br>

                    8. Even so, our conception of leftism will remain a good deal less clear than we would wish, but there doesn’t seem to be any remedy for this. All we are trying to do here is indicate in a rough and approximate way the two psychological tendencies that we believe are the main driving force of modern leftism. We by no means claim to be telling the WHOLE truth about leftist psychology. Also, our discussion is meant to apply to modern leftism only. We leave open the question of the extent to which our discussion could be applied to the leftists of the 19th and early 20th centuries.<br>

                    9. The two psychological tendencies that underlie modern leftism we call “feelings of inferiority” and “oversocialization.” Feelings of inferiority are characteristic of modern leftism as a whole, while oversocialization is characteristic only of a certain segment of modern leftism; but this segment is highly influential.<br>
                </div>
                <%@include file="footer.jsp" %>
            </div>

        </div>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#sidebar").mCustomScrollbar({
                    theme: "minimal"
                });

                $('#sidebarCollapse').on('click', function () {
                    $('#sidebar, #content').toggleClass('active');
                    $('.collapse.in').toggleClass('in');
                    $('a[aria-expanded=true]').attr('aria-expanded', 'false');
                });
            });
        </script>
    </body>
</html>
