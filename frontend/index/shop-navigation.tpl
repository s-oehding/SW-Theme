<nav class="shop--navigation block-group">
    <ul class="navigation--list block-group" role="menubar">

        {* Menu (Off canvas left) trigger *}
        {block name='frontend_index_offcanvas_left_trigger'}
            <li class="navigation--entry entry--menu-left" role="menuitem">
                <a class="entry--link entry--trigger btn is--icon-left" href="#offcanvas--left" data-offcanvas="true" data-offCanvasSelector=".sidebar-main">
                    {* <i class="icon--menu"></i> {s namespace='frontend/index/menu_left' name="IndexLinkMenu"}{/s} *}
                    <i class="gres-menue"></i>
                </a>
            </li>
        {/block}

        {* Cart entry *}
        {block name='frontend_index_checkout_actions'}
            {* Include of the cart *}
            {block name='frontend_index_checkout_actions_include'}
                {action module=widgets controller=checkout action=info}
            {/block}
        {/block}
    </ul>
</nav>
