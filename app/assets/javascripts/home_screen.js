//Place all the behaviors and hooks related to the matching controller here.
//All this logic will automatically be available in application.js.
//You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready(function(){

    var priorities = {
        sleep:      50,
        nutrition:  50,
        exercise:   50,
        meditation: 50,
        love:       50,
        stuff:      50,
        work:       50,
        passion:    50,
        growth:     50,
        service:    50
    };

    //attaches a jQuery UI slider to each div with .slider class
    $(".slider").slider({ value: 50 });
    //when slider changes, set appropriate attribute of prioritities obj to slider value
    $(".slider").slider( {
        change: function( event, ui ) {
            if ($('#welcome h3').html()){
                var id = $(this).attr('id');
                priorities[id] = ui.value
            } else {
                alert("Please sign in to create your checkin.")
            }
        }
    });

    $("#checkin-form").submit(function(e){
        e.preventDefault();
        //check if there is a current user
        if ($('#welcome h3').html()){
            $.post('/checkins', priorities).done(function(checkin_id){
                window.location = "http://localhost:3000/checkins"
            });
        } else {
            alert("Please sign in to create your checkin.")
        }
    });
});


