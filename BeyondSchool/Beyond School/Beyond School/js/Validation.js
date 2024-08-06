
$('#userName').keyup(function() {
    var $th = $(this);
    $th.val( $th.val().replace(/[^a-zA-Z0-9]/g, function(str) {
           // $("#toast-container").empty();
           // toast('You typed " ' + str + ' ".\n Use only letters and numbers.',2000,'light-blue darken-3');
            /*  alert('You typed " ' + str + ' ".\n\nPlease use only letters and numbers.');*/
            return ''; } )
    );
});

