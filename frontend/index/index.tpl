{extends file='parent:frontend/index/index.tpl'}

{* Shop header *}
{block name='frontend_index_navigation'}
    <header class="header-main">
        {block name='frontend_index_header_navigation'}
            <div class="container header--navigation">

                {* Logo container *}
                {block name='frontend_index_logo_container'}
                    {include file="frontend/index/logo-container.tpl"}
                {/block}

                {* Shop navigation *}
                {block name='frontend_index_shop_navigation'}
                    {include file="frontend/index/shop-navigation.tpl"}
                {/block}

                {* Maincategories navigation top *}
                {block name='frontend_index_navigation_categories_top'}
                    <nav class="navigation-main">
                        <div class="container" data-menu-scroller="true" data-listSelector=".navigation--list.container" data-viewPortSelector=".navigation--list-wrapper">
                            {include file='frontend/index/main-navigation.tpl'}
                        </div>
                    </nav>
                {/block}

                {* Back Button *}
                {block name='frontend_index_back_to_shop'}
                {/block}
            </div>
            <div class="container header--search" data-search="true" style="display:none;">
                {* Include of the search form *}
                {block name='frontend_index_search_include'}
                    {include file="frontend/index/search.tpl"}
                {/block}
            </div>
        {/block}
        {block name='frontend_index_container_ajax_cart'}
            <div class="container--ajax-cart" data-collapse-cart="true"{if $theme.offcanvasCart} data-displayMode="offcanvas"{/if}></div>
        {/block}
        <div class="container header--advanced-menu">
            {block name="frontend_plugins_advanced_menu_outer"}
                {include file="frontend/advanced_menu/index.tpl"}
            {/block}
        </div>
    </header>
{/block}

{block name='frontend_index_left_last_articles'}
{/block}

{* Footer *}
{block name="frontend_index_footer" prepend}
    <footer class="footer-trust">
        <div class="container">
            <ul class="trust-footer--list">
                <li class="trust-footer--entry col-30">{s namespace="frontend/index/menu_footer" name="trustFooter01"}{/s}</li>
                <li class="trust-footer--entry col-30">{s namespace="frontend/index/menu_footer" name="trustFooter02"}{/s}</li>
                <li class="trust-footer--entry col-40">{s namespace="frontend/index/menu_footer" name="trustFooter03"}{/s}</li>
            </ul>
        </div>
    </footer>
{/block}