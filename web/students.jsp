<%-- 
    Document   : mentors
    Created on : 03-Mar-2021, 6:17:33 pm
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Students</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="wrapper">
            <%@include file="sidebar.jsp" %>
            <%                if (user == null) {
                    response.sendRedirect("login_page.jsp");
                }
            %>
            <div id="content">
                <div class="container-fluid">                    
                    <div class="row">
                        <h1 class="mr-auto">Students</h1>
                        <form class="form-inline my-2 my-lg-0">
                            <input class="form-control mr-sm-2" type="search" id="search-students" placeholder="Search" aria-label="Search">
                        </form>
                    </div>
                    <div class="container text-center" id="loader">
                        <i class="fas fa-sync fa-3x fa-spin"></i>
                        <h3 class="mt-2">Loading...</h3>
                    </div>
                    <div class="container-fluid mt-3" id="students-container">

                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="Javascript/sidebar.js"></script>      
        <script src="Javascript/students.js"></script> 
        <script>
            $(document).ready(function (e) {
                $('#search-students').keyup(function () {
                    var txt = $(this).val();
                    if (txt === '')
                    {
                        $.ajax({
                            url: 'load_students.jsp',
                            success: function (data, textStatus, jqXHR) {
                                $('#loader').hide();
                                $('#students-container').html(data);
                            }
                        });
                    } else
                    {
                        $('#students-container').html('');
                        $.ajax({
                            url: 'search_students.jsp',
                            data: {search: txt},
                            success: function (data, textStatus, jqXHR) {
                                $('#students-container').html(data);
                            }
                        });
                    }
                });
            });
        </script>
        <script>
            if (<%= cnt%> === 0)
            {
                $('#approvals-badge').hide();
            } else
            {
                $('#approvals-badge').html(
            <%= cnt%>
                );
            }
        </script>
    </body>
</html>

