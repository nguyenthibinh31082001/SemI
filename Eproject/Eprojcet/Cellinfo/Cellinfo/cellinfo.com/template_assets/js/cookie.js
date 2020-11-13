function setCookie(cname, cvalue, exsecond) {
    var d = new Date();
    d.setTime(d.getTime() + (exsecond * 1000));
    var expires = "expires=" + d.toGMTString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function checkCookie(cookie_key) {
    var cook = getCookie(cookie_key);
    if (cook != "") {
        return true;
    } else {
        return false;
    }
}

/*

function checkCookie() {
    var user=getCookie("username2");
    if (user != "") {
        alert("Welcome again " + user);
    } else {
       user = prompt("Please enter your name:","");
       if (user != "" && user != null) {
           setCookie("username2", user, 1);
       }
    }
}

*/