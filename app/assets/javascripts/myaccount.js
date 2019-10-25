

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
    
    
    
    
    
    
    // ep-modal
    
    $('#ep-add-new').on('click',function(){
        var edit_modal = $('.ep-edit-modal')
        var edit_area = $('.ep-edit-area')
        var add_area = $('.ep-add-area')
        add_area.addClass('ep-active')
        edit_area.removeClass('ep-active')
        edit_modal.fadeIn()
    });
    
    $('.edit-episode').on('click',function(){
        var edit_modal = $('.ep-edit-modal')
        var edit_area = $('.ep-edit-area')
        var add_area = $('.ep-add-area')
        edit_area.addClass('ep-active')
        add_area.removeClass('ep-active')
        edit_modal.fadeIn()
        
        
        // get values
        var parent = $(this).parent()
        var ep_date_val = parent.find('.ep-date').html()
        var ep_title_val = parent.find('.ep-title').html()
        var ep_pre_val = parent.find('.ep-pre').html()
        // var ep_pre_val = parseInt($(".ep-pre").html(),10);
        var ep_mid_val = parent.find('.ep-mid').html()
        var ep_post_val = parent.find('.ep-post').html()
        var ep_id_val = parent.find('.ep-id').html()
        
        
        // input items
        var ep_id = $('input.ep-id-edit')
        var ep_date = $('input.edit-ep-date-area')
        var ep_title = $('input.edit-ep-title-area')
        var ep_pre = $('input.edit-ep-pre-num-area')
        var ep_mid = $('input.edit-ep-mid-num-area')
        var ep_post = $('input.edit-ep-post-num-area')
        
        
        // insert items
        ep_id.val(ep_id_val)
        ep_date.val(ep_date_val)
        ep_title.val(ep_title_val)
        ep_pre.val(ep_pre_val)
        ep_mid.val(ep_mid_val)
        ep_post.val(ep_post_val)
        
        
        
    });

    
    $('#modal-close').on('click',function(){
        var edit_modal = $('.ep-edit-modal')
        edit_modal.fadeOut()
    });
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
})
    
