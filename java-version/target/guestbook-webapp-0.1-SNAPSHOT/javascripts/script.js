$(document).ready(function(){
    /* Input */
    var search = $("#search");
    var schedule = $("#schedule");
    
    var starttime = $("#starttime");
    var endtime = $("#endtime");
    var description = $("#description");
    
    /* Display */
    var appointmentdisplay = $("#appointmentdisplay");
    
    $("#searchbutton").click(function(){
        $.get("/search?email=" + search.val(), function(data){
            if(data === ""){
                cleantable();
                appointmentdisplay.css("visibility", "hidden");
            }
            else{
                var JSON_obj = JSON.parse(data).data;
                for(var i = 0; i < JSON_obj.length; i++){
                    console.log(JSON_obj[i][0] + JSON_obj[i][1] + JSON_obj[i][2] + JSON_obj[i][3] + JSON_obj[i][4]);
                    tablemodify(JSON_obj[i][0], JSON_obj[i][1], JSON_obj[i][2], JSON_obj[i][3], JSON_obj[i][4]);
                }
                appointmentdisplay.css("visibility", "visible");
            }
        });
    });
    
    function tablemodify(timeindex, dayindex, description, color, number){
        var td;
        if(timeindex % 4 === 0){
            td = schedule.children("tr").eq(timeindex).children("td").eq(dayindex + 1);
        }
        else{
            td = schedule.children("tr").eq(timeindex).children("td").eq(dayindex);
        }
        if(color === "white"){
            td.text("");
            td.css("background-color", "white");
        }
        else if(color === "green"){
            td.text(description);
            td.css("background-color", "green");
        }
        else if(color === "yellow"){
            td.text(description + ", " + number);
            td.css("background-color", "yellow");
        }
    }
    
    function cleantable(){
        for(var i = 0; i < 96; i++){
            for(var j = 0; j < 7; j++){
                tablemodify(i, j, "", "white", 0);
            }
        }
    }
    
    $("#appointmentbutton").click(function(){
        $.get("/schedule?starttime=" + starttime.val() + "&endtime=" + endtime.val() + "&description=" + description.val()
                , function(data){
                    /* Not Do Anything */
                });
    });
    
    /* Higher level function to handle JSON */
    
    
});