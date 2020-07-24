$(document).ready(function () {
    $("#show_password button").on('click', function (event) {
        event.preventDefault();
        if ($('#show_password input').attr("type") == "text") {
            $('#show_password input').attr('type', 'password');
            $('#show_password i').addClass("fa-eye-slash");
            $('#show_password i').removeClass("fa-eye");
        } else if ($('#show_password input').attr("type") == "password") {
            $('#show_password input').attr('type', 'text');
            $('#show_password i').removeClass("fa-eye-slash");
            $('#show_password i').addClass("fa-eye");
        }
    });
});
