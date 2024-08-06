(function($) {
    "use strict";
    function main() {
        mobilecheck();
        mdselect();
        Learning();
        scrollStyle();

        $(".feature-slider").owlCarousel({
            autoPlay: 10000,
            items: 4,
            itemsDesktop : [1199,4],
            itemsDesktopSmall : [979,3],
            itemsTablet: [768,2],
            itemsTabletSmall: [600,1],
            slideSpeed: 300,
            navigation: true,
            pagination: false,
            navigationText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"]
        });



        $('.view-grid').on('click', function() {
            $('.categories-content .content').attr('class', 'content grid');
            $('.grid').addClass('fade-1');
            $('.list').removeClass('fade-2');
            $(this).addClass('active');
            $('.view-list').removeClass('active');
        });
        $('.view-list').on('click', function() {
            $('.categories-content .content').attr('class', 'content list');
            $('.list').addClass('fade-2');
            $('.grid').removeClass('fade-1');
            $(this).addClass('active');
            $('.view-grid').removeClass('active');
        });


        /*==============================
            Account info
        ==============================*/

        var $toggleList = $('.list-account-info .list-item .toggle-list');
        $('html').on('click', function() {
            $toggleList.stop().removeClass('toggle-message-add');
            $('.list-account-info .item-click').stop().removeClass('active-ac');
        });
        $('.list-account-info .list-item').on('click', function(event) {
            event.stopPropagation();
        });
        $('.list-account-info .item-click').on('click', function(event) {
            if ($(this).hasClass('active-ac') == false) {
                $('.list-account-info .item-click').removeClass('active-ac');
                $toggleList.stop().removeClass('toggle-message-add');
            }
            $(this).toggleClass('active-ac');
            $(this).siblings('.toggle-list')
                .stop()
                .toggleClass('toggle-message-add');
            
        });

        $.each($('.content-bar'), function() {
            var widthList = $(this).find('li').outerWidth(),
                totalList = $(this).find('li').length;
            $(this).find('ul').width(widthList * totalList + 20);
        });
        

        /*==============================
            PROGRESS BAR
        ==============================*/
        $('.current-progress').appear(function () {
            $('.current-progress .progress-run').addClass('progress-run-add');
            var percent = $('.current-progress .count').text();
            $('.progress-run-add').width(percent);
        });


        /*==============================
            PERCENT LEARN
        ==============================*/
        $('.percent-learn').appear(function () {
            $(this)
                .siblings('.percent-learn-bar')
                    .find('.percent-learn-run')
                        .addClass('percent-learn-run-add');
            var percentLearn = $(this).text();
            var context = $(this).siblings('.percent-learn-bar').find('.percent-learn-run-add');
            context.width(percentLearn);
        });


        /*==============================
            CHECKOUT
        ==============================*/
        var current_fs, next_fs, previous_fs;
        var left, opacity, scale;
        var animating;
        $(".form-checkout .next").on('click', function() {
            if(animating) return false;
            animating = true;
            
            current_fs = $(this).closest('fieldset');
            next_fs = $(this).closest('fieldset').next();
            
            $(".form-checkout #bar li").eq($("fieldset").index(next_fs)).addClass("active");
            
            //show the next fieldset
            next_fs.show();
            //hide the current fieldset with style
            current_fs.animate({opacity: 0}, {
                step: function(now, mx) {
                    left = (now * 50)+"%";
                    opacity = 1 - now;
                    current_fs.css({'opacity': '0'});
                    next_fs.css({'left': left, 'opacity': opacity});
                }, 
                duration: 800, 
                complete: function(){
                    current_fs.hide();
                    animating = false;
                }, 
                //this comes from the custom easing plugin
                easing: 'easeInOutBack'
            });
        });

        $(".submit").on('click', function() {
            return false;
        });
        formCheckoutCal();

        $('#page-wrap').append('<div class="overlayForm"></div>');
        $('.take-this-course').on('click', function() {
            $('.form-checkout, .overlayForm').fadeIn(400);
            return false;
        });
        
        $('.closeForm').on('click', function() {
            $('.form-checkout, .overlayForm').fadeOut(400);
        });
        $('.closeForm').click();

        /*==============================
            TABS STYLE LINE
        ==============================*/
        if ($('.nav-tabs').length) {
            $.each($('.nav-tabs'), function() {
                var tabsItem = $(this).find('a'),
                    tabs = $(this),
                    leftActive = tabs.find('.active').children('a').position().left,
                    widthActive = tabs.find('.active').children('a').width();
                tabs.append('<li class="tabs-hr"></li>');
                $('.tabs-hr').css({
                    left: leftActive,
                    width: widthActive
                });
                tabsItem.on('click', function() {
                    var left = $(this).position().left,
                        width = $(this).width();
                    $('.tabs-hr').animate({
                        left: left,
                        width: width
                    }, 500, 'easeInOutExpo');
                });
            });
        }

        /*==============================
            FOOTER STYLE 2
        ==============================*/
        var $footerStyle2 = $('footer#footer.footer-style-2'),
            heightFooter =  $footerStyle2.height();
        $footerStyle2.appendTo('body');
        $footerStyle2.siblings('#page-wrap').css('marginBottom', heightFooter);


        $('.question-sidebar ul, .list-message, .list-notification').wrap('<div class="list-wrap"></div>');
    }
    /*==============================
        Mobile check
    ==============================*/
    function mobilecheck() {
        if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
            return false;
        }
        return true;
    }

    function formCheckoutCal() {
        var heightWindow = $(window).height(),
            heightForm = $('.form-checkout .container').height(),
            formMiddle = (heightWindow - heightForm) / 2;
        $('.form-checkout').css('top', formMiddle);
        $('.form-checkout .form-body').height($(".form-checkout fieldset").height());
    }

    /*==============================
        MC SELECT
    ==============================*/
    function mdselect() {
        $('.mc-select').find('select.select').each(function() {
            var selected = $(this).find('option:selected').text();
            $(this)
                .css({'z-index':10,'opacity':0,'-khtml-appearance':'none'})
                .after('<span class="select">' + selected + '</span>' + '<i class="fa fa-angle-down"></i>')
                .change(function(){
                    var val = $('option:selected',this).text();
                    $(this).next().text(val);
                });
        });
    }

    /*==============================
        Learning
    ==============================*/
    function Learning() {
        var $navListBody = $('.top-nav-list').find('.list-item-body');
        var width = $navListBody.closest('.top-nav-list').width() - 1;
        $navListBody.width(width);
        if ($('.top-nav-list').children('li').hasClass('active')) {
            $('.learning-section')
                .toggleClass('learning-section-fly')
                .css('paddingRight', width);
        }
        $('.top-nav-list').find('.outline-learn, .discussion-learn, .note-learn').on('click', '> a', function(e) {
            e.preventDefault();
            if ($(this).parent().hasClass('active') == false) {
                $('.top-nav-list').children('li').removeClass('active');
            }
            $(this).parent().toggleClass('active');
            if ($(this).parent().hasClass('active')) {
                $('.learning-section')
                    .toggleClass('learning-section-fly')
                    .css('paddingRight', width);
            } else {
                $('.learning-section')
                    .removeClass('learning-section-fly')
                    .css('paddingRight', '0');
            }
        });
        $('html').on('click', function() {
            $navListBody.removeClass('item-fly');
            $navListBody.parent('li').removeClass('active');
            $('.learning-section')
                .removeClass('learning-section-fly')
                .css('paddingRight', '0');
        });
        $('.top-nav-list, .list-item-body').on('click', function(event) {
            event.stopPropagation();
        });
    }
    function setHeightRespon() {
        var windowHeight = $(window).height(),
            w = window.innerWidth;
        $('.learn-section').css('min-height', windowHeight);

        if (w < 992) {
            $('.question-content-wrap').find('.question-sidebar').height('auto');
            $('.question-content-wrap').find('.score-sb').find('.list-wrap').height('auto').css('max-height', '300px');
        } else if (w >= 992) {
            var height = $('.question-content-wrap').find('.question-content').height() + 30;
            var heightUl = height - 90;
            $('.question-content-wrap').find('.score-sb').find('.list-wrap').height(heightUl).css('max-height', 'none');
            $('.question-content-wrap').find('.question-sidebar').height(height);
        }
    }

    /*==============================
        SET HEIGHT MESSAGE SB
    ==============================*/
    function setHeightMessagesb() {
        if ($('.list-item-body').length) {
            var heightlist = $(window).height() - $('.list-item-body').css('margin-top').split('px')[0];
            $('.list-item-body').height(heightlist);
        }
    }



    /*==============================
        SCROLL STYLE
    ==============================*/
    function scrollbar() {
        var $scrollbar = $('.question-sidebar .list-wrap, .messages .list-wrap, .message-sb .list-wrap, .notification .list-wrap, .list-item-body, .table-wrap .tbody');
        $scrollbar.perfectScrollbar({
            maxScrollbarLength: 150,
        });
        $scrollbar.perfectScrollbar('update');

        $('.content-bar').perfectScrollbar({
            maxScrollbarLength: 150,
            suppressScrollY: true,
            useBothWheelAxes: true,
        });
        $('.content-bar').perfectScrollbar('update');
    }
    function scrollStyle() {
        scrollbar();
        $(window).on('load', function() {
            if ($('.content-bar').length > 0) {
                var  currentPosition =$('.content-bar').find('.current').position().left;
                var  prevCurrentWidth =$('.content-bar').find('.current').prev().width();
                setTimeout(function() {
                    $('.content-bar').animate({
                        scrollLeft: currentPosition - prevCurrentWidth
                    }, 400);
                }, 100);
            }
        });
    }

    function uploadFile() {
        $('.up-file').delegate('a', 'click', function(e) {
            e.preventDefault();
            $(this).siblings('input[type="file"]').trigger('click');
        });
        $('.up-file').delegate('input[type="file"]', 'change', function() {
            var nameFile = $(this).val().replace(/\\/g, '/').replace(/.*\//, '');
            $(this).siblings('input[type="hidden"]').val(nameFile);
            readURL(this);
        });
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('.changes-avatar')
                        .find('img')
                            .attr('src', e.target.result)
                            .width(140);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    }



    /*==========  Slider Home ==========*/
    function SliderHome(){
        if($('#slide-home').length){
            $('#slide-home').owlCarousel({
                autoPlay: 10000,
                navigation: false,
                pagination: true,
                singleItem: true,
                mouseDrag:false,
                addClassActive:true,
                transitionStyle:'fade'
            });
        }
    }

    /*==========  Resize Slider Home ==========*/
    function ResizeSliderHome() {
        if($('#slide-home')) {
            var parentWidth = $('.slide-cn').innerWidth(),
              imgWidth = $('.item-inner').width(),
              imgHeight = $('.item-inner').height(),
              scale = parentWidth/imgWidth,
              ratio = imgWidth/imgHeight,
              heightItem = parentWidth/ratio;

          $('.slide-item').css({'height': heightItem});

          if ($(window).width() <= 1200) {

            $('.item-inner').css({
              '-webkit-transform': 'scale(' + scale + ')',
              '-moz-transform': 'scale(' + scale + ')',
              '-ms-transform': 'scale(' + scale + ')',
              'transform': 'scale(' + scale + ')'
            });

          } else {

            $('.item-inner').css({
                '-webkit-transform': 'scale(1)',
                '-moz-transform': 'scale(1)',
                '-ms-transform': 'scale(1)',
                'transform': 'scale(1)'
            });

          }
      }
    }
         

    $(document).ready(function() {
        main();
        setHeightRespon();
        uploadFile();
        setHeightMessagesb();
        scrollbar();
        $('.nav-tabs').wrap('<div class="nav-tabs-wrap"></div>');

        if (window.innerWidth < 1200) {
            $('.menu-item-has-children').on('click', '> a', function(evt) {
                evt.preventDefault();
                $(this).next().slideToggle(300);
                $(this).toggleClass('mobile-active');
            });
            $('.open-menu').on('click', function() {
                $(this).toggleClass('toggle-active');
                $('.navigation .menu, .search-box').slideToggle(300);
            });
            $('html').on('click', function() {
                $('.open-menu').removeClass('toggle-active');
                $('.navigation .menu, .search-box').slideUp(300);
            });
            $('.navigation .menu, .open-menu, .search-box').on('click', function(evt) {
                evt.stopPropagation();
            });
        }
    });
    $(window).load(function() {
        ResizeSliderHome();
    });

    $(window).on('resize', function() {
        setHeightRespon();
        setHeightMessagesb();
        scrollbar();
        SliderHome();
        formCheckoutCal();
        ResizeSliderHome();
    }).trigger('resize');;

/*
    function nextPage(options ) {
        var animation = (options.animation) ? options.animation : options;

        if( isAnimating ) {
            return false;
        }

        isAnimating = true;

        var $currPage = $pages.eq( current );

        if(options.showPage){
            if( options.showPage < pagesCount - 1 ) {
                current = options.showPage;
            }
            else {
                current = 0;
            }
        }
        else{
            if( current < pagesCount - 1 ) {
                ++current;
            }
            else {
                current = 0;
            }
        }

        var $nextPage = $pages.eq( current ).addClass( 'pt-page-current' ),
            outClass = '', inClass = '';

        switch( animation ) {

            case 1:
                outClass = 'pt-page-moveToLeft';
                inClass = 'pt-page-moveFromRight';
                break;
            case 2:
                outClass = 'pt-page-moveToRight';
                inClass = 'pt-page-moveFromLeft';
                break;
            case 3:
                outClass = 'pt-page-moveToTop';
                inClass = 'pt-page-moveFromBottom';
                break;
            case 4:
                outClass = 'pt-page-moveToBottom';
                inClass = 'pt-page-moveFromTop';
                break;
            case 5:
                outClass = 'pt-page-fade';
                inClass = 'pt-page-moveFromRight pt-page-ontop';
                break;
            case 6:
                outClass = 'pt-page-fade';
                inClass = 'pt-page-moveFromLeft pt-page-ontop';
                break;
            case 7:
                outClass = 'pt-page-fade';
                inClass = 'pt-page-moveFromBottom pt-page-ontop';
                break;
            case 8:
                outClass = 'pt-page-fade';
                inClass = 'pt-page-moveFromTop pt-page-ontop';
                break;
            case 9:
                outClass = 'pt-page-moveToLeftFade';
                inClass = 'pt-page-moveFromRightFade';
                break;
            case 10:
                outClass = 'pt-page-moveToRightFade';
                inClass = 'pt-page-moveFromLeftFade';
                break;
            case 11:
                outClass = 'pt-page-moveToTopFade';
                inClass = 'pt-page-moveFromBottomFade';
                break;
            case 12:
                outClass = 'pt-page-moveToBottomFade';
                inClass = 'pt-page-moveFromTopFade';
                break;
            case 13:
                outClass = 'pt-page-moveToLeftEasing pt-page-ontop';
                inClass = 'pt-page-moveFromRight';
                break;
            case 14:
                outClass = 'pt-page-moveToRightEasing pt-page-ontop';
                inClass = 'pt-page-moveFromLeft';
                break;
            case 15:
                outClass = 'pt-page-moveToTopEasing pt-page-ontop';
                inClass = 'pt-page-moveFromBottom';
                break;
            case 16:
                outClass = 'pt-page-moveToBottomEasing pt-page-ontop';
                inClass = 'pt-page-moveFromTop';
                break;
            case 17:
                outClass = 'pt-page-scaleDown';
                inClass = 'pt-page-moveFromRight pt-page-ontop';
                break;
            case 18:
                outClass = 'pt-page-scaleDown';
                inClass = 'pt-page-moveFromLeft pt-page-ontop';
                break;
            case 19:
                outClass = 'pt-page-scaleDown';
                inClass = 'pt-page-moveFromBottom pt-page-ontop';
                break;
            case 20:
                outClass = 'pt-page-scaleDown';
                inClass = 'pt-page-moveFromTop pt-page-ontop';
                break;
            case 21:
                outClass = 'pt-page-scaleDown';
                inClass = 'pt-page-scaleUpDown pt-page-delay300';
                break;
            case 22:
                outClass = 'pt-page-scaleDownUp';
                inClass = 'pt-page-scaleUp pt-page-delay300';
                break;
            case 23:
                outClass = 'pt-page-moveToLeft pt-page-ontop';
                inClass = 'pt-page-scaleUp';
                break;
            case 24:
                outClass = 'pt-page-moveToRight pt-page-ontop';
                inClass = 'pt-page-scaleUp';
                break;
            case 25:
                outClass = 'pt-page-moveToTop pt-page-ontop';
                inClass = 'pt-page-scaleUp';
                break;
            case 26:
                outClass = 'pt-page-moveToBottom pt-page-ontop';
                inClass = 'pt-page-scaleUp';
                break;
            case 27:
                outClass = 'pt-page-scaleDownCenter';
                inClass = 'pt-page-scaleUpCenter pt-page-delay400';
                break;
            case 28:
                outClass = 'pt-page-rotateRightSideFirst';
                inClass = 'pt-page-moveFromRight pt-page-delay200 pt-page-ontop';
                break;
            case 29:
                outClass = 'pt-page-rotateLeftSideFirst';
                inClass = 'pt-page-moveFromLeft pt-page-delay200 pt-page-ontop';
                break;
            case 30:
                outClass = 'pt-page-rotateTopSideFirst';
                inClass = 'pt-page-moveFromTop pt-page-delay200 pt-page-ontop';
                break;
            case 31:
                outClass = 'pt-page-rotateBottomSideFirst';
                inClass = 'pt-page-moveFromBottom pt-page-delay200 pt-page-ontop';
                break;
            case 32:
                outClass = 'pt-page-flipOutRight';
                inClass = 'pt-page-flipInLeft pt-page-delay500';
                break;
            case 33:
                outClass = 'pt-page-flipOutLeft';
                inClass = 'pt-page-flipInRight pt-page-delay500';
                break;
            case 34:
                outClass = 'pt-page-flipOutTop';
                inClass = 'pt-page-flipInBottom pt-page-delay500';
                break;
            case 35:
                outClass = 'pt-page-flipOutBottom';
                inClass = 'pt-page-flipInTop pt-page-delay500';
                break;
            case 36:
                outClass = 'pt-page-rotateFall pt-page-ontop';
                inClass = 'pt-page-scaleUp';
                break;
            case 37:
                outClass = 'pt-page-rotateOutNewspaper';
                inClass = 'pt-page-rotateInNewspaper pt-page-delay500';
                break;
            case 38:
                outClass = 'pt-page-rotatePushLeft';
                inClass = 'pt-page-moveFromRight';
                break;
            case 39:
                outClass = 'pt-page-rotatePushRight';
                inClass = 'pt-page-moveFromLeft';
                break;
            case 40:
                outClass = 'pt-page-rotatePushTop';
                inClass = 'pt-page-moveFromBottom';
                break;
            case 41:
                outClass = 'pt-page-rotatePushBottom';
                inClass = 'pt-page-moveFromTop';
                break;
            case 42:
                outClass = 'pt-page-rotatePushLeft';
                inClass = 'pt-page-rotatePullRight pt-page-delay180';
                break;
            case 43:
                outClass = 'pt-page-rotatePushRight';
                inClass = 'pt-page-rotatePullLeft pt-page-delay180';
                break;
            case 44:
                outClass = 'pt-page-rotatePushTop';
                inClass = 'pt-page-rotatePullBottom pt-page-delay180';
                break;
            case 45:
                outClass = 'pt-page-rotatePushBottom';
                inClass = 'pt-page-rotatePullTop pt-page-delay180';
                break;
            case 46:
                outClass = 'pt-page-rotateFoldLeft';
                inClass = 'pt-page-moveFromRightFade';
                break;
            case 47:
                outClass = 'pt-page-rotateFoldRight';
                inClass = 'pt-page-moveFromLeftFade';
                break;
            case 48:
                outClass = 'pt-page-rotateFoldTop';
                inClass = 'pt-page-moveFromBottomFade';
                break;
            case 49:
                outClass = 'pt-page-rotateFoldBottom';
                inClass = 'pt-page-moveFromTopFade';
                break;
            case 50:
                outClass = 'pt-page-moveToRightFade';
                inClass = 'pt-page-rotateUnfoldLeft';
                break;
            case 51:
                outClass = 'pt-page-moveToLeftFade';
                inClass = 'pt-page-rotateUnfoldRight';
                break;
            case 52:
                outClass = 'pt-page-moveToBottomFade';
                inClass = 'pt-page-rotateUnfoldTop';
                break;
            case 53:
                outClass = 'pt-page-moveToTopFade';
                inClass = 'pt-page-rotateUnfoldBottom';
                break;
            case 54:
                outClass = 'pt-page-rotateRoomLeftOut pt-page-ontop';
                inClass = 'pt-page-rotateRoomLeftIn';
                break;
            case 55:
                outClass = 'pt-page-rotateRoomRightOut pt-page-ontop';
                inClass = 'pt-page-rotateRoomRightIn';
                break;
            case 56:
                outClass = 'pt-page-rotateRoomTopOut pt-page-ontop';
                inClass = 'pt-page-rotateRoomTopIn';
                break;
            case 57:
                outClass = 'pt-page-rotateRoomBottomOut pt-page-ontop';
                inClass = 'pt-page-rotateRoomBottomIn';
                break;
            case 58:
                outClass = 'pt-page-rotateCubeLeftOut pt-page-ontop';
                inClass = 'pt-page-rotateCubeLeftIn';
                break;
            case 59:
                outClass = 'pt-page-rotateCubeRightOut pt-page-ontop';
                inClass = 'pt-page-rotateCubeRightIn';
                break;
            case 60:
                outClass = 'pt-page-rotateCubeTopOut pt-page-ontop';
                inClass = 'pt-page-rotateCubeTopIn';
                break;
            case 61:
                outClass = 'pt-page-rotateCubeBottomOut pt-page-ontop';
                inClass = 'pt-page-rotateCubeBottomIn';
                break;
            case 62:
                outClass = 'pt-page-rotateCarouselLeftOut pt-page-ontop';
                inClass = 'pt-page-rotateCarouselLeftIn';
                break;
            case 63:
                outClass = 'pt-page-rotateCarouselRightOut pt-page-ontop';
                inClass = 'pt-page-rotateCarouselRightIn';
                break;
            case 64:
                outClass = 'pt-page-rotateCarouselTopOut pt-page-ontop';
                inClass = 'pt-page-rotateCarouselTopIn';
                break;
            case 65:
                outClass = 'pt-page-rotateCarouselBottomOut pt-page-ontop';
                inClass = 'pt-page-rotateCarouselBottomIn';
                break;
            case 66:
                outClass = 'pt-page-rotateSidesOut';
                inClass = 'pt-page-rotateSidesIn pt-page-delay200';
                break;
            case 67:
                outClass = 'pt-page-rotateSlideOut';
                inClass = 'pt-page-rotateSlideIn';
                break;

        }

        $currPage.addClass( outClass ).on( animEndEventName, function() {
            $currPage.off( animEndEventName );
            endCurrPage = true;
            if( endNextPage ) {
                onEndAnimation( $currPage, $nextPage );
            }
        } );

        $nextPage.addClass( inClass ).on( animEndEventName, function() {
            $nextPage.off( animEndEventName );
            endNextPage = true;
            if( endCurrPage ) {
                onEndAnimation( $currPage, $nextPage );
            }
        } );

        if( !support ) {
            onEndAnimation( $currPage, $nextPage );
        }

    }*/

})(jQuery);


/*var imgArray = new Array();

imgArray[0] = new Image();
imgArray[0].src = 'images/bg.png';

imgArray[1] = new Image();
imgArray[1].src = 'images/bg_1.png';

/!* ... more images ... *!/


/!*------------------------------------*!/

function nextImage(element)
{
    var img = document.getElementById(element);

    for(var i = 0; i < imgArray.length;i++)
    {
        alert("1");
        if(imgArray[i].src == img.src) // << check this
        {
            alert("2");
            if(i === imgArray.length){
                alert("3");
                document.getElementById(element).src = imgArray[0].src;
                break;
            }
            document.getElementById(element).src = imgArray[i+1].src;
            break;
        }
    }
}*/

/*

var images = [ 'images/bg_min.png', 'images/bg_1.png', 'images/image.png', 'images/bg3.png', 'images/bg4.png'];
/!*
var index = 0;

function buildImage() {
    var img = document.createElement('img')
    img.src = images[index];
    document.getElementById('home').appendChild(img);
}
*!/

function changeImage(){
    //index++;
    //index = index % 2; // This is for if this is the last image then goto first image I have 4 images so I've given 4 change accordingly
    document.body.style.background = "#f3f3f3 url("+images[Math.floor(Math.random() * images.length)]+") no-repeat center center fixed";
    document.body.style.backgroundSize = "100% 100%";
}*/
