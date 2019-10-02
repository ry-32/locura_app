

document.addEventListener("turbolinks:load", function() {
    
    $(function(){
        $('.co1').addClass('active');
    });
    
    
    $('#prof').on('click',function(){
        $('.co1').addClass('active');
        $('.co2').removeClass('active');
        $('.co3').removeClass('active');
    });
    $('#deals').on('click',function(){
        $('.co2').addClass('active');
        $('.co1').removeClass('active');
        $('.co3').removeClass('active');
    });
    $('#payment').on('click',function(){
        $('.co3').addClass('active');
        $('.co1').removeClass('active');
        $('.co2').removeClass('active');
    });
    
})
    
