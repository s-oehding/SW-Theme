// $(document).on("scroll", function() {

//     if ($(document).scrollTop() > 100) {
//         $(".header--navigation").addClass("scrolled");
//     } else {
//         $(".header--navigation").removeClass("scrolled");
//     }
// });

$(document).ready(function() {
    $(".header-main").headroom({
        "offset": 300,
        "tolerance": 10,
        "classes": {
            "initial": "animated",
            "pinned": "slideDown",
            "unpinned": "slideUp"
        }
    });

    $('.trigger-search').click(function(e) {

        e.preventDefault();
        e.stopPropagation();

        $('html').toggleClass('is--active-search');
        $('.trigger-search').toggleClass('active');
        $('.header--search').toggleClass('active');
        $('.header--search').slideToggle('slow');
        $('.main-search--field').focus(function() {
            $(this).val('');
        });
    });

    $( document.body ).click(function(e, searchActive) {
        var me = this,
            target = $(e.target);

        if (!target.is('.main-search--field') && !target.is('.header--search') && !target.is('.main-search--results')) {
            if ($('html').hasClass('is--active-search')) {
                $('html').removeClass('is--active-search');
                $('.trigger-search').toggleClass('active');
                $('.header--search').toggleClass('active');
                $('.header--search').slideToggle('slow');
            }
        }
        return;
    });
});