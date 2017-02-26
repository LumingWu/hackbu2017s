$(document).ready(function(){
    var search = $("#search");
    
    $("#searchbutton").click(function(){
        $.get("/search?email=" + search.text(), function(data){
            
        });;
    });
});