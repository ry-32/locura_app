

document.addEventListener("turbolinks:load", function() {
    
    $(function(){
        $('.co1').addClass('active');
        $('#prof').addClass('active-btn');
    });
    
    
    $('#prof').on('click',function(){
        $(this).addClass('active-btn')
        $('#deals').removeClass('active-btn')
        $('#payment').removeClass('active-btn')
        $('.co1').addClass('active');
        $('.co2').removeClass('active');
        $('.co3').removeClass('active');
    });
    $('#deals').on('click',function(){
        $(this).addClass('active-btn')
        $('#prof').removeClass('active-btn')
        $('#payment').removeClass('active-btn')
        $('.co2').addClass('active');
        $('.co1').removeClass('active');
        $('.co3').removeClass('active');
    });
    $('#payment').on('click',function(){
        $(this).addClass('active-btn')
        $('#prof').removeClass('active-btn')
        $('#deals').removeClass('active-btn')
        $('.co3').addClass('active');
        $('.co1').removeClass('active');
        $('.co2').removeClass('active');
    });
    
})
    
