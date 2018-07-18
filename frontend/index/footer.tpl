{extends file='parent:frontend/index/footer.tpl'}

{* Copyright in the footer *}
{block name='frontend_index_footer_copyright'}
    <div class="footer--bottom">
	    <ul class="footer-bottom-list">
	    	<li class="footer--copyright">
	            <p class="copyright--text">
	                {s name='FooterCopyright' namespace="frontend/index/footer"}{/s}
	            </p>
	        </li>

	        {* Vat info *}
	        {block name='frontend_index_footer_vatinfo'}
	            <li class="footer--vat-info">
	                <p class="vat-info--text">
	                    {if $sOutputNet}
	                        {s name='FooterInfoExcludeVat' namespace="frontend/index/footer"}{/s}
	                    {else}
	                        {s name='FooterInfoIncludeVat' namespace="frontend/index/footer"}{/s}
	                    {/if}
	                </p>
	            </li>
	        {/block}

	        <li class="footer--logo">
	            <div class="logo--wrapper">
	                {s name='FooterLogo' namespace="frontend/index/footer"}{/s}
	            </div>
	        </li>
	    </ul>

        {block name='frontend_index_footer_minimal'}
        {/block}

        {* Shopware footer *}
        {block name="frontend_index_shopware_footer"}

            {* Copyright *}
            {block name="frontend_index_shopware_footer_copyright"}
            {/block}

            {* Logo *}
            {block name="frontend_index_shopware_footer_logo"}
            {/block}
        {/block}
    </div>
{/block}