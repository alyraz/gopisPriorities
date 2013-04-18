//Place all the behaviors and hooks related to the matching controller here.
//All this logic will automatically be available in application.js.
//You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready(function(){
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
        $.post('/checkins', priorities).done(function(checkin_id){
           window.location = "http://localhost:3000/checkins"
         });

    });
});


