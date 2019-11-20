
document.addEventListener("turbolinks:load", function() {

    $(document).ready(function() {
        
        var flash = $('.flash');
        
        setTimeout(function(){
            flash.fadeOut(1800)
        }, 1800);
        
    });


})