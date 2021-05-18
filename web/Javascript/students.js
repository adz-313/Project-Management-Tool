$(document).ready(function (e){
    console.log('loaded');
    $('#home').removeClass('active');
    $('#students').addClass('active');
    $.ajax({
       url: 'load_students.jsp',
        success: function (data, textStatus, jqXHR) {
            $('#loader').hide();
            $('#students-container').html(data);
        }
    });
});

