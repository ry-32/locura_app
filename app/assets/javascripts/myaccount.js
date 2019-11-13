

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
        var new_link = '/delete_episode/'+ep_id_val
        
        // input items
        var ep_id = $('input.ep-id-edit')
        var a_ep_id = $('a.ep-id-edit')
        var ep_date = $('input.edit-ep-date-area')
        var ep_title = $('input.edit-ep-title-area')
        var ep_pre = $('input.edit-ep-pre-num-area')
        var ep_mid = $('input.edit-ep-mid-num-area')
        var ep_post = $('input.edit-ep-post-num-area')
        
        
        // insert items
        ep_id.val(ep_id_val)
        a_ep_id.attr("href",new_link)
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
    
    
    
    
    
    
    // password changes
    
    $('.pass-edit-action').on('click',function(){
        var pass_edit_modal = $('.edit-password')
        pass_edit_modal.fadeIn()
    });

    
    $('#pass-modal-close').on('click',function(){
        var pass_edit_modal = $('.edit-password')
        pass_edit_modal.fadeOut()
    });
    
    
    
    // file upload
    
    $('.dl-file-action').on('click',function(){
        var dl_file_modal = $('.dl-file-modal')
        dl_file_modal.fadeIn()
    });

    
    $('#dl-modal-close').on('click',function(){
        var dl_file_modal = $('.dl-file-modal')
        dl_file_modal.fadeOut()
    });
    
    
    
    
    
    
    // deal detail related
    
    
    $('.deal-name').on('click',function(){
        
        // variables
        var parent = $(this).parent()
        var deal_id = parent.find('.deal-id').html()
        var deal_name = parent.find('.deal-name').html()
        var deal_advertiser = parent.find('.deal-advertiser').html()
        var deal_forecasted_dl = parent.find('.deal-forecasted-dl').html()
        var deal_cost = parent.find('.deal-cost').html()
        var deal_description = parent.find('.deal-description').html()
        var deal_biz_description = parent.find('.deal-biz-description').html()
        
        var deal_modal = $('.deal-detail-modal')
        
        
        // modal variables
        var deal_id_wrapper = deal_modal.find('.deal-id-wrapper')
        var deal_name_wrapper = deal_modal.find('.deal-name-wrapper p')
        var deal_advertiser_wrapper = deal_modal.find('.deal-advertiser-wrapper p')
        var deal_forecasted_dl_wrapper = deal_modal.find('.deal-forecasted-dl-wrapper p')
        var deal_cost_wrapper = deal_modal.find('.deal-cost-wrapper p')
        var deal_description_wrapper = deal_modal.find('.deal-description-wrapper p')
        var deal_biz_description_wrapper = deal_modal.find('.deal-biz-description-wrapper p')
        
        // empty all content before inserting
        deal_description_wrapper.html("この情報は提供されていません")
        deal_biz_description_wrapper.html("この情報は提供されていません")
        
        
        
        // insert values
        // deal_id_wrapper.html(deal_id)
        deal_name_wrapper.html(deal_name)
        deal_advertiser_wrapper.html(deal_advertiser)
        deal_forecasted_dl_wrapper.html(deal_forecasted_dl)
        deal_cost_wrapper.html(deal_cost)
        deal_description_wrapper.html(deal_description)
        deal_biz_description_wrapper.html(deal_biz_description)
        
        // fadein effect
        deal_modal.fadeIn()
    });
    
    $('#deal-modal-close').on('click',function(){
        var deal_modal = $('.deal-detail-modal')
        deal_modal.fadeOut()
    });
    
    
    
    // // img rotation
    
    // $.fn.animate2 = function (properties, duration, ease) {
    //     ease = ease || 'ease';
    //     var $this = this;
    //     var cssOrig = { transition: $this.css('transition') };
    //     return $this.queue(next => {
    //         properties['transition'] = 'all ' + duration + 'ms ' + ease;
    //         $this.css(properties);
    //         setTimeout(function () {
    //             $this.css(cssOrig);
    //             next();
    //         }, duration);
    //     });
    // };
    
    // $('#animation-js').animate2({ transform: 'rotate(360deg)' }, 7000)
    // $('#animation-js img').animate2({ transform: 'rotate(-360deg)' }, 7000)
})
    
