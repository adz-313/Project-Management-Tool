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
        <title>Mentors</title>
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
                    <!--show mentors here-->                    
                    <div class="row" style="margin: auto;">
                        <h1 class="mr-auto">Guidelines</h1>
                        <form class="form-inline my-2 my-lg-0">
                            <button type="button" class="btn btn-link" data-toggle="modal" data-target="#guidelineModal"><i class="fas fa-plus-circle fa-2x"></i></button>                           
                        </form>                        
                    </div>
                    <div class="modal fade" id="guidelineModal" tabindex="-1" role="dialog" aria-labelledby="approvalModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="eapprovalModalLabel">Remark</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <form id="guideline" action="AddGuidelineServlet" method="post" enctype='multipart/form-data'>
                                    <div class="modal-body">

                                        <div class="form-group">
                                            <label for="message-text" class="col-form-label">Title:</label>
                                            <input type="text" class="form-control" id="title" name="title">
                                        </div>

                                        <div class="form-group">
                                            <label for="message-text" class="col-form-label">Title:</label>
                                            <input type="file" class="form-control" id="filename" name="filename">
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn btn-outline-success mr-2" type="submit" name="btnAdd">Add</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div> 
                    <div class="container text-center" id="loader">
                        <i class="fas fa-sync fa-3x fa-spin"></i>
                        <h3 class="mt-2">Loading...</h3>
                    </div>
                    <div class="container-fluid mt-3" id="mentors-container">

                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="Javascript/sidebar.js"></script> 
        <script>
            $(document).ready(function (e) {
                $('#home').removeClass('active');
                $('#add').addClass('active');
                $.ajax({
                    url: 'load_guidelines.jsp',
                    success: function (data, textStatus, jqXHR) {
                        $('#loader').hide();
                        $('#mentors-container').html(data);
                    }
                });
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                console.log('supboi');
                $('#guideline').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    $.ajax({
                        url: "AddGuidelineServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textstatus, adfa) {
                            console.log(data);
                            $('#guidelineModal').modal("hide");
                        },
                        error: function (adfa, textstatus, errorThrown) {
                            console.log(adfa);
                        },
                        processData: false,
                        contentType: false
                    });
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

