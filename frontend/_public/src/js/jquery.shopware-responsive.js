(function($, window) {
    window.StateManager

        // OffCanvas menu
        .addPlugin('*[data-offcanvas="true"]', 'swOffcanvasMenu', ['xs', 's', 'm', 'l'])
        .addPlugin('*[data-subcategory-nav="true"]', 'swSubCategoryNav', ['xs', 's', 'm', 'l'])
})(jQuery, window);