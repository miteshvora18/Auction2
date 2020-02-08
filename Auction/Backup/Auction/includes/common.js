$(document).ready(function() {
    var offset = $(".user").offset();
    $(".mnu").css("left", offset.left);
    $(".user").click(function() {
        if ($(".mnu").css("display") == "none") {
            $(".mnu").show();
        } else {
            $(".mnu").hide();
        }
    });
});