$.jQTouch({
            icon: 'jqtouch.png',
            addGlossToIcon: false,
            fullScreen: true,
            fixedViewport: true,
            statusBar: 'black',
            preloadImages: [
                '/jqtouch/themes/apple/img/backButton.png',
                '/jqtouch/themes/apple/img/blueButton.png',
                '/jqtouch/themes/apple/img/loading.gif'
                ]
        });

        // Some sample Javascript functions:
        $(function(){

            // Show a swipe event on swipe test
            $('#swipeme').addTouchHandlers().bind('swipe', function(evt, data){
                $(this).html('You swiped <strong>' + data.direction + '</strong>!');
                // alert('Swiped '+ data.direction +' on #' + $(evt.currentTarget).attr('id') + '.');
            });

            $('a[target="_blank"]').click(function(){
                if(confirm('This link opens in a new window.'))
                {
                    return true;
                }
                else
                {
                    $(this).removeClass('active');
                    return false;
                }
            });

            // Page transition callback events
            $('#pageevents').
                bind('pageTransitionStart', function(e, info){
                    $(this).find('.info').append('Started transitioning ' + info.direction + '&hellip; ');
                }).
                bind('pageTransitionEnd', function(e, info){
                    $(this).find('.info').append(' finished transitioning ' + info.direction + '.<br /><br />');
                });


            // AJAX with callback event
            $('#callback').
                bind('pageTransitionEnd', function(e, info){
                    if (info.direction == 'in' && $(this).data('loaded') != 'true')
                    {
                        $(this).
                            append($('<div>Loading &hellip;</div>').
                            load('ajax.html .info', function(){
                                $(this).parent().data('loaded', 'true');
                            }));
                    }
                });

            // Orientation callback event
            $('body').bind('turn', function(e, data){
                $('#orient').html('Orientation: ' + data.orientation);
            })
        });