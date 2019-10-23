

document.addEventListener("turbolinks:load", function() {
    
    $(function(){
        $('.content-profile').addClass('active');
        $('#prof').addClass('active-btn');
    });
    
    
    $('#prof').on('click',function(){
        $(this).addClass('active-btn')
        $('#deals').removeClass('active-btn')
        $('#payment').removeClass('active-btn')
        $('#program').removeClass('active-btn')
        $('.content-profile').addClass('active');
        $('.content-deals').removeClass('active');
        $('.content-program').removeClass('active');
        $('.content-payment').removeClass('active');
    });
    $('#deals').on('click',function(){
        $(this).addClass('active-btn')
        $('#prof').removeClass('active-btn')
        $('#payment').removeClass('active-btn')
        $('#program').removeClass('active-btn')
        $('.content-deals').addClass('active');
        $('.content-profile').removeClass('active');
        $('.content-program').removeClass('active');
        $('.content-payment').removeClass('active');
    });
    $('#payment').on('click',function(){
        $(this).addClass('active-btn')
        $('#prof').removeClass('active-btn')
        $('#deals').removeClass('active-btn')
        $('#program').removeClass('active-btn')
        $('.content-payment').addClass('active');
        $('.content-profile').removeClass('active');
        $('.content-program').removeClass('active');
        $('.content-deals').removeClass('active');
        
    });
    $('#program').on('click',function(){
        $(this).addClass('active-btn')
        $('#prof').removeClass('active-btn')
        $('#deals').removeClass('active-btn')
        $('#payment').removeClass('active-btn')
        $('.content-program').addClass('active');
        $('.content-deals').removeClass('active');
        $('.content-profile').removeClass('active');
        $('.content-payment').removeClass('active');
    });
    
})
    
