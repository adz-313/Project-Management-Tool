<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Home</title>
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
                <h1>Approvals</h1>
                <div class="container-fluid" id="approvals-container">
                    
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="Javascript/sidebar.js"></script>      
        <script>
            $('#home').removeClass('active');
            $(document).ready(function (e) {
                console.log('loaded...');
                $.ajax({
                    url: 'load_approvals.jsp',
                    success: function (data, textStatus, jqXHR) {
                        $('#loader').hide();
                        $('#approvals-container').html(data);
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
