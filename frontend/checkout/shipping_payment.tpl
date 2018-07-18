{extends file="frontend/index/index.tpl"}

{* Hide shop navigation *}
{block name='frontend_index_shop_navigation'}
    {if !$theme.checkoutHeader}
        {$smarty.block.parent}
    {/if}
{/block}

{* Back to the shop button *}
{block name='frontend_index_back_to_shop'}
    {if $theme.checkoutHeader && $sTarget != "account"}
        <div class="back-button-container">
            <a href="{url controller='index'}"
               class="btn is--small btn--back-top-shop is--icon-left"
               title="{"{s name='FinishButtonBackToShop' namespace='frontend/checkout/finish'}{/s}"|escape}">
                <i class="icon--arrow-left"></i>
                {s name="FinishButtonBackToShop" namespace="frontend/checkout/finish"}{/s}
            </a>
        </div>
    {/if}
{/block}

{* Hide sidebar left *}
{block name='frontend_index_content_left'}
    {if !$theme.checkoutHeader}
        {$smarty.block.parent}
    {/if}
{/block}

{* Hide breadcrumb *}
{block name='frontend_index_breadcrumb'}{/block}

{* Step box *}
{block name='frontend_index_navigation_categories_top'}
    {if !$theme.checkoutHeader}
        {$smarty.block.parent}
    {/if}
    {include file="frontend/register/steps.tpl" sStepActive="paymentShipping"}
{/block}


{* Main content *}
{block name="frontend_index_content"}
    <div class="content content--confirm product--table" data-ajax-shipping-payment="true">
        {include file="frontend/checkout/shipping_payment_core.tpl"}
    </div>
{/block}