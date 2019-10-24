

document.addEventListener("turbolinks:load", function() {
    
    $(function(){
        $('.content-ep-schedule').addClass('active');
        $('#ep-schedule').addClass('active-btn');
    });
    
    
    $('#prof').on('click',function(){
        $(this).addClass('active-btn')
        $('#deals').removeClass('active-btn')
        $('#payment').removeClass('active-btn')
        $('#program').removeClass('active-btn')
        $('#ep-schedule').removeClass('active-btn')
        $('.content-profile').addClass('active');
        $('.content-deals').removeClass('active');
        $('.content-program').removeClass('active');
        $('.content-payment').removeClass('active');
        $('.content-ep-schedule').removeClass('active');
    });
    $('#deals').on('click',function(){
        $(this).addClass('active-btn')
        $('#prof').removeClass('active-btn')
        $('#payment').removeClass('active-btn')
        $('#program').removeClass('active-btn')
        $('#ep-schedule').removeClass('active-btn')
        $('.content-deals').addClass('active');
        $('.content-profile').removeClass('active');
        $('.content-program').removeClass('active');
        $('.content-payment').removeClass('active');
        $('.content-ep-schedule').removeClass('active');
    });
    $('#payment').on('click',function(){
        $(this).addClass('active-btn')
        $('#prof').removeClass('active-btn')
        $('#deals').removeClass('active-btn')
        $('#ep-schedule').removeClass('active-btn')
        $('#program').removeClass('active-btn')
        $('.content-payment').addClass('active');
        $('.content-profile').removeClass('active');
        $('.content-program').removeClass('active');
        $('.content-deals').removeClass('active');
        $('.content-ep-schedule').removeClass('active');
        
    });
    $('#program').on('click',function(){
        $(this).addClass('active-btn')
        $('#prof').removeClass('active-btn')
        $('#deals').removeClass('active-btn')
        $('#payment').removeClass('active-btn')
        $('#ep-schedule').removeClass('active-btn')
        $('.content-program').addClass('active');
        $('.content-deals').removeClass('active');
        $('.content-profile').removeClass('active');
        $('.content-payment').removeClass('active');
        $('.content-ep-schedule').removeClass('active');
    });
    $('#ep-schedule').on('click',function(){
        $(this).addClass('active-btn')
        $('#prof').removeClass('active-btn')
        $('#deals').removeClass('active-btn')
        $('#payment').removeClass('active-btn')
        $('#program').removeClass('active-btn')
        $('.content-ep-schedule').addClass('active');
        $('.content-program').removeClass('active');
        $('.content-deals').removeClass('active');
        $('.content-profile').removeClass('active');
        $('.content-payment').removeClass('active');
    });
    
})
    
