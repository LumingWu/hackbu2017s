<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="stylesheets/styles.css">
        <title>Office Hour</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <c:choose>
                        <c:when test="${loginstatus}">
                            <br>
                            <span>${user.nickname}</span>
                            <a href="${link}"><button class="btn btn-default">Logout</button></a>
                            <div style="display: inline-block; float: right;">
                                <input type="text" id="search" placeholder="Email">
                                <button id="searchbutton" class="btn btn-default">Search</button>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <br>
                            <span>Connect through Google</span> <a href="${link}"><button class="btn btn-default">Login</button></a>
                            </button>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <br>
            <div id="appointmentdisplay">
                <select id="starttime">
                    <option value="0">0:00</option>
                    <option value="15">0:15</option>
                    <option value="30">0:30</option>
                    <option value="45">0:45</option>
                    <option value="60">1:00</option>
                    <option value="75">1:15</option>
                    <option value="90">1:30</option>
                    <option value="105">1:45</option>
                    <option value="120">2:00</option>
                    <option value="135">2:15</option>
                    <option value="150">2:30</option>
                    <option value="165">2:45</option>
                    <option value="180">3:00</option>
                    <option value="195">3:15</option>
                    <option value="210">3:30</option>
                    <option value="225">3:45</option>
                    <option value="240">4:00</option>
                    <option value="255">4:15</option>
                    <option value="270">4:30</option>
                    <option value="285">4:45</option>
                    <option value="300">5:00</option>
                    <option value="315">5:15</option>
                    <option value="330">5:30</option>
                    <option value="345">5:45</option>
                    <option value="360">6:00</option>
                    <option value="375">6:15</option>
                    <option value="390">6:30</option>
                    <option value="405">6:45</option>
                    <option value="420">7:00</option>
                    <option value="435">7:15</option>
                    <option value="450">7:30</option>
                    <option value="465">7:45</option>
                    <option value="480">8:00</option>
                    <option value="495">8:15</option>
                    <option value="510">8:30</option>
                    <option value="525">8:45</option>
                    <option value="540">9:00</option>
                    <option value="555">9:15</option>
                    <option value="570">9:30</option>
                    <option value="585">9:45</option>
                    <option value="600">10:00</option>
                    <option value="615">10:15</option>
                    <option value="630">10:30</option>
                    <option value="645">10:45</option>
                    <option value="660">11:00</option>
                    <option value="675">11:15</option>
                    <option value="690">11:30</option>
                    <option value="705">11:45</option>
                    <option value="720">12:00</option>
                    <option value="735">12:15</option>
                    <option value="750">12:30</option>
                    <option value="765">12:45</option>
                    <option value="780">13:00</option>
                    <option value="795">13:15</option>
                    <option value="810">13:30</option>
                    <option value="825">13:45</option>
                    <option value="840">14:00</option>
                    <option value="855">14:15</option>
                    <option value="870">14:30</option>
                    <option value="885">14:45</option>
                    <option value="900">15:00</option>
                    <option value="915">15:15</option>
                    <option value="930">15:30</option>
                    <option value="945">15:45</option>
                    <option value="960">16:00</option>
                    <option value="975">16:15</option>
                    <option value="990">16:30</option>
                    <option value="1005">16:45</option>
                    <option value="1020">17:00</option>
                    <option value="1035">17:15</option>
                    <option value="1050">17:30</option>
                    <option value="1065">17:45</option>
                    <option value="1080">18:00</option>
                    <option value="1095">18:15</option>
                    <option value="1110">18:30</option>
                    <option value="1125">18:45</option>
                    <option value="1140">19:00</option>
                    <option value="1155">19:15</option>
                    <option value="1170">19:30</option>
                    <option value="1185">19:45</option>
                    <option value="1200">20:00</option>
                    <option value="1215">20:15</option>
                    <option value="1230">20:30</option>
                    <option value="1245">20:45</option>
                    <option value="1260">21:00</option>
                    <option value="1275">21:15</option>
                    <option value="1290">21:30</option>
                    <option value="1305">21:45</option>
                    <option value="1320">22:00</option>
                    <option value="1335">22:15</option>
                    <option value="1350">22:30</option>
                    <option value="1365">22:45</option>
                    <option value="1380">23:00</option>
                    <option value="1395">23:15</option>
                    <option value="1410">23:30</option>
                    <option value="1425">23:45</option>
                </select>
                <select id="endtime">
                    <option value="0">0:00</option>
                    <option value="15">0:15</option>
                    <option value="30">0:30</option>
                    <option value="45">0:45</option>
                    <option value="60">1:00</option>
                    <option value="75">1:15</option>
                    <option value="90">1:30</option>
                    <option value="105">1:45</option>
                    <option value="120">2:00</option>
                    <option value="135">2:15</option>
                    <option value="150">2:30</option>
                    <option value="165">2:45</option>
                    <option value="180">3:00</option>
                    <option value="195">3:15</option>
                    <option value="210">3:30</option>
                    <option value="225">3:45</option>
                    <option value="240">4:00</option>
                    <option value="255">4:15</option>
                    <option value="270">4:30</option>
                    <option value="285">4:45</option>
                    <option value="300">5:00</option>
                    <option value="315">5:15</option>
                    <option value="330">5:30</option>
                    <option value="345">5:45</option>
                    <option value="360">6:00</option>
                    <option value="375">6:15</option>
                    <option value="390">6:30</option>
                    <option value="405">6:45</option>
                    <option value="420">7:00</option>
                    <option value="435">7:15</option>
                    <option value="450">7:30</option>
                    <option value="465">7:45</option>
                    <option value="480">8:00</option>
                    <option value="495">8:15</option>
                    <option value="510">8:30</option>
                    <option value="525">8:45</option>
                    <option value="540">9:00</option>
                    <option value="555">9:15</option>
                    <option value="570">9:30</option>
                    <option value="585">9:45</option>
                    <option value="600">10:00</option>
                    <option value="615">10:15</option>
                    <option value="630">10:30</option>
                    <option value="645">10:45</option>
                    <option value="660">11:00</option>
                    <option value="675">11:15</option>
                    <option value="690">11:30</option>
                    <option value="705">11:45</option>
                    <option value="720">12:00</option>
                    <option value="735">12:15</option>
                    <option value="750">12:30</option>
                    <option value="765">12:45</option>
                    <option value="780">13:00</option>
                    <option value="795">13:15</option>
                    <option value="810">13:30</option>
                    <option value="825">13:45</option>
                    <option value="840">14:00</option>
                    <option value="855">14:15</option>
                    <option value="870">14:30</option>
                    <option value="885">14:45</option>
                    <option value="900">15:00</option>
                    <option value="915">15:15</option>
                    <option value="930">15:30</option>
                    <option value="945">15:45</option>
                    <option value="960">16:00</option>
                    <option value="975">16:15</option>
                    <option value="990">16:30</option>
                    <option value="1005">16:45</option>
                    <option value="1020">17:00</option>
                    <option value="1035">17:15</option>
                    <option value="1050">17:30</option>
                    <option value="1065">17:45</option>
                    <option value="1080">18:00</option>
                    <option value="1095">18:15</option>
                    <option value="1110">18:30</option>
                    <option value="1125">18:45</option>
                    <option value="1140">19:00</option>
                    <option value="1155">19:15</option>
                    <option value="1170">19:30</option>
                    <option value="1185">19:45</option>
                    <option value="1200">20:00</option>
                    <option value="1215">20:15</option>
                    <option value="1230">20:30</option>
                    <option value="1245">20:45</option>
                    <option value="1260">21:00</option>
                    <option value="1275">21:15</option>
                    <option value="1290">21:30</option>
                    <option value="1305">21:45</option>
                    <option value="1320">22:00</option>
                    <option value="1335">22:15</option>
                    <option value="1350">22:30</option>
                    <option value="1365">22:45</option>
                    <option value="1380">23:00</option>
                    <option value="1395">23:15</option>
                    <option value="1410">23:30</option>
                    <option value="1425">23:45</option>
                </select>
                <input type="text" id="description">
                <button id="appointmentbutton" class="btn btn-default">Schedule</button>
            </div>
            <br>
            <table>
                <thead>
                <th></th>
                <th>Sunday</th>
                <th>Monday</th>
                <th>Tuesday</th>
                <th>Wednesday</th>
                <th>Thursday</th>
                <th>Friday</th>
                <th>Saturday</th>
                </thead>
                <tbody id="schedule">
                    <tr>
                        <td class="time-cell" rowspan="4">00:00</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="time-cell" rowspan="4">01:00</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="time-cell" rowspan="4">02:00</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="time-cell" rowspan="4">03:00</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="time-cell" rowspan="4">04:00</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="time-cell" rowspan="4">05:00</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="time-cell" rowspan="4">06:00</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="time-cell" rowspan="4">07:00</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="time-cell" rowspan="4">08:00</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="time-cell" rowspan="4">09:00</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="time-cell" rowspan="4">10:00</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="time-cell" rowspan="4">11:00</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="time-cell" rowspan="4">12:00</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="time-cell" rowspan="4">13:00</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="time-cell" rowspan="4">14:00</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="time-cell" rowspan="4">15:00</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="time-cell" rowspan="4">16:00</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="time-cell" rowspan="4">17:00</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="time-cell" rowspan="4">18:00</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="time-cell" rowspan="4">19:00</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="time-cell" rowspan="4">20:00</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="time-cell" rowspan="4">21:00</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="time-cell" rowspan="4">22:00</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="time-cell" rowspan="4">23:00</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <script src="javascripts/script.js"></script>

    </body></html>
