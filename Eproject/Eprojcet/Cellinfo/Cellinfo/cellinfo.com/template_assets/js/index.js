function timerCounter() {
    var totalSeconds = 0;
    setInterval(setTime, (1000 / 4));

    function setTime() {
        ++totalSeconds;

        var t1 = new Date(2018, 00, 15, 11, 0, 0, 0);
        var t2 = new Date();
        var dif = t1.getTime() - t2.getTime();

        var Seconds_from_T1_to_T2 = dif / (1000 / 4);
        var Seconds_Between_Dates = Math.abs(Seconds_from_T1_to_T2);

        var today = new Date();
        var milliseconds = today.getMilliseconds();
        // console.log("milliseconds: " + Seconds_Between_Dates);

        document.getElementById('counter_test').innerText = Seconds_Between_Dates.toFixed(0);

    }
}



$('body').on('hidden.bs.modal', '.modal', function() {
    $('video').trigger('pause');
});


function goToTurkeyMap(){
    window.location = "dashboard.html";
}

function addRequired(){
    $("#login_password").prop('required',true);
}
