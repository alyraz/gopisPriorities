//Place all the behaviors and hooks related to the matching controller here.
//All this logic will automatically be available in application.js.
//You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready(function(){

    var priorities = {
        sleep:      0,
        nutrition:  0,
        exercise:   0,
        meditation: 0,
        love:       0,
        stuff:      0,
        work:       0,
        passion:    0,
        growth:     0,
        service:    0
    };

    //attaches a jQuery UI slider to each div with .slider class
    $(".slider").slider();
    //when slider changes, set appropriate attribute of prioritities obj to slider value
    $(".slider").slider( {
        change: function( event, ui ) {
            var id = $(this).attr('id');
            priorities[id] = ui.value
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


