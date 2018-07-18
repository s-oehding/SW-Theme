// $.overridePlugin('swOffcanvasMenu', {
//     onClickElement: function(event) {
//         var me = this,
//             tbheight = $('.header-main').outerHeight(),
//             wheight = $(window).height();


//         if (!$.contains(me.$offCanvas[0], (event.target || event.currentTarget))) {
//             event.preventDefault();
//         }

//         me.$offCanvas.css("top", tbheight + 'px');
//         me.$offCanvas.css("height", wheight - tbheight + 'px');
//         me.openMenu();

//         $.publish('plugin/swOffcanvasMenu/onClickElement', [me, event]);
//     }


// });

// $(window).resize(function() {
//     tbHeight = $('.header-main').outerHeight();
//     wHeight = $(window).height();
//     $offCanvas.css("top", tbHeight + 'px');
//     $offCanvas.css("height", wHeight - tbHeight + 'px');
// });

$.overridePlugin('swOffcanvasMenu', {
    onBeforeOpenMenu: function(event, plugin) {
        var me = this;

        if (plugin !== me) {
            me.closeMenu();
            return
        }

        tbHeight = $('.header-main').outerHeight();
        wHeight = $(window).height();

        me.$offCanvas.css("top", tbHeight + 'px');
        me.$offCanvas.css("height", wHeight - tbHeight + 'px');
        me.openMenu();
    }
});
