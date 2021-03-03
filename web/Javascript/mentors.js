 /*document.getElementById('home').classList().remove('active');
 document.getElementById('mentors').classList().add('active');*/
$(document).ready(function (e){
    console.log('loaded');
    $('#home').removeClass('active');
    $('#mentors').addClass('active');
    $.ajax({
       url: 'load_mentors.jsp',
        success: function (data, textStatus, jqXHR) {
            $('#loader').hide();
            $('#mentors-container').html(data);
        }
    });
});