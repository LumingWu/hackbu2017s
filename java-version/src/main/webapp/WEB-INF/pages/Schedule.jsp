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
                            <input type="text" name="search" placeholder="Email">
                            <button id="searchbutton" class="btn btn-default">Search</button>
                            </c:when>
                            <c:otherwise>
                                <br>
                                <a href="${link}"><button class="btn btn-default">Login</button></a>
                            </button>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <table id="schedule">

                        </table>
                    </div>
                </div>
            </div>

            <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
            <script src="javascripts/script.js"></script>

    </body></html>
