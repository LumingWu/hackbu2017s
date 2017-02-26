$(document).ready(function(){
    /* User display  */
    var logindisplay = $("#logindisplay");
    var userdisplay = $("#userdisplay");
    var name = $("#name");

    userdisplay.hide();

    $("#loginbutton").click(function(){
        logindisplay.hide();
        userdisplay.show();


        name.text("User");
    });

    $("#logoutbutton").click(function(){
        userdisplay.hide();
        logindisplay.show();


        name.text("");
    });
    $("#weekly-whole-table > tr > th > td")
});