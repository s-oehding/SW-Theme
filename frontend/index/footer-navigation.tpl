{* {extends file='parent:frontend/index/footer-navigation.tpl'} *}
{* {namespace name="frontend/index/menu_footer"} *}

{* Service hotline *}
{block name="frontend_index_footer_column_service_hotline"}
<div class="footer--column-wrapper col-3">
    <div class="footer--column column--hotline is--first block">
		{block name="frontend_index_footer_column_service_hotline_headline"}
            <div class="column--headline">{s name="sFooterServiceHotlineHead"}{/s}</div>
		{/block}

		{block name="frontend_index_footer_column_service_hotline_content"}
			<div class="column--content">
				<p class="column--desc">{s name="sFooterServiceHotline"}{/s}</p>
			</div>
		{/block}
	</div>
	<div class="footer--column column--hotline is--first block">
		<div class="column--headline">{s name="sFooterShopNavi2"}{/s}</div>
		<nav class="column--navigation column--content">
			<ul class="navigation--list" role="menu">
				{foreach $sMenu.{$theme.bottom_02_variable} as $item}
					<li class="navigation--entry" role="menuitem">
		                <a class="navigation--link" href="{if $item.link}{$item.link}{else}{url controller='custom' sCustom=$item.id title=$item.description}{/if}" title="{$item.description|escape}"{if $item.target} target="{$item.target}"{/if}>
		                    {$item.description}
						</a>

		                {* Sub categories *}
		                {if $item.childrenCount > 0}
		                    <ul class="navigation--list is--level1" role="menu">
		                        {foreach $item.subPages as $subItem}
		                            <li class="navigation--entry" role="menuitem">
		                                <a class="navigation--link" href="{if $subItem.link}{$subItem.link}{else}{url controller='custom' sCustom=$subItem.id title=$subItem.description}{/if}" title="{$subItem.description|escape}"{if $subItem.target} target="{$subItem.target}"{/if}>
		                                    {$subItem.description}
		                                </a>
		                            </li>
		                        {/foreach}
		                    </ul>
		                {/if}
					</li>
				{/foreach}
			</ul>
		</nav>
    </div>
</div>
{/block}

{block name="frontend_index_footer_column_information_menu"}
	{block name="frontend_index_footer_column_information_menu_headline"}{/block}
	{block name="frontend_index_footer_column_information_menu_content"}
		{block name="frontend_index_footer_column_information_menu_before"}{/block}
		{block name="frontend_index_footer_column_information_menu_entry"}{/block}
		{block name="frontend_index_footer_column_information_menu_after"}{/block}
	{/block}
{/block}

{block name="frontend_index_footer_column_service_menu"}
<div class="footer--column-wrapper col-3">
	<div class="footer--column column--menu block">
		{block name="frontend_index_footer_column_service_menu_headline"}
			<div class="column--headline">{s name="sFooterShopNavi1"}{/s}</div>
		{/block}

		{block name="frontend_index_footer_column_service_menu_content"}
			<nav class="column--navigation column--content">
				<ul class="navigation--list" role="menu">
					{block name="frontend_index_footer_column_service_menu_before"}{/block}
					{foreach $sMenu.{$theme.bottom_01_variable} as $item}

                        {block name="frontend_index_footer_column_service_menu_entry"}
                            <li class="navigation--entry" role="menuitem">
                                <a class="navigation--link" href="{if $item.link}{$item.link}{else}{url controller='custom' sCustom=$item.id title=$item.description}{/if}" title="{$item.description|escape}"{if $item.target} target="{$item.target}"{/if}>
                                    {$item.description}
                                </a>

                                {* Sub categories *}
                                {if $item.childrenCount > 0}
                                    <ul class="navigation--list is--level1" role="menu">
                                        {foreach $item.subPages as $subItem}
                                            <li class="navigation--entry" role="menuitem">
                                                <a class="navigation--link" href="{if $subItem.link}{$subItem.link}{else}{url controller='custom' sCustom=$subItem.id title=$subItem.description}{/if}" title="{$subItem.description|escape}"{if $subItem.target} target="{$subItem.target}"{/if}>
                                                    {$subItem.description}
                                                </a>
                                            </li>
                                        {/foreach}
                                    </ul>
                                {/if}
                            </li>
                        {/block}
                    {/foreach}

					{block name="frontend_index_footer_column_service_menu_after"}{/block}
				</ul>
			</nav>
		{/block}
	</div>
</div>
{/block}


{block name="frontend_index_footer_column_newsletter"}
	<div class="footer--column-wrapper col-4">
		<div class="footer--column column--newsletter is--last block">
			{block name="frontend_index_footer_column_newsletter_headline"}
				<div class="column--headline">{s name="sFooterNewsletterHead"}{/s}</div>
			{/block}

			{block name="frontend_index_footer_column_newsletter_content"}
				<div class="column--content">
					<p class="column--desc">
						{s name="sFooterNewsletter"}{/s}
					</p>

					{block name="frontend_index_footer_column_newsletter_form"}
						<form class="newsletter--form" action="{url controller='newsletter'}" method="post">
							<input type="hidden" value="1" name="subscribeToNewsletter" />

							{block name="frontend_index_footer_column_newsletter_form_field"}
								<input type="email" name="newsletter" class="newsletter--field" placeholder="{s name="IndexFooterNewsletterValue"}{/s}" />
							{/block}

							{block name="frontend_index_footer_column_newsletter_form_submit"}
								<button type="submit" class="newsletter--button btn">
									<span class="button--text">{s name='IndexFooterNewsletterSubmit'}Anmelden{/s}</span>
								</button>
							{/block}
						</form>
					{/block}
				</div>
			{/block}
		</div>
		{if $socialFooter}
			<div class="footer--column  is--last block icon-wrapper">
				<div class="column--headline">{s namespace="frontend/index/footer-navigation" name="sFooterSocialHead"}{/s}</div>
				<div class="column--content js--collapse-target">
					<hr>
					<ul class="navigation--list block-group" role="menubar">
						{if $fbUrl}
						    <li class="navigation--entry" role="menuitem">
						        <a href="{$fbUrl}" target="_blank" title="" class="btn">
						            <i class="fa fa-facebook" aria-hidden="true"></i>
						        </a>
						    </li>
					    {/if}
						{if $twUrl}
						    <li class="navigation--entry" role="menuitem">
						        <a href="{$twUrl}" target="_blank" title="" class="btn">
						            <i class="fa fa-twitter" aria-hidden="true"></i>
						        </a>
						    </li>
					    {/if}
						{if $gpUrl}
						    <li class="navigation--entry" role="menuitem">
						        <a href="{$gpUrl}" target="_blank" title="" class="btn">
						            <i class="fa fa-google-plus" aria-hidden="true"></i>
						        </a>
						    </li>
					    {/if}
						{if $ytUrl}
						    <li class="navigation--entry" role="menuitem">
						        <a href="{$ytUrl}" target="_blank" title="" class="btn">
						            <i class="fa fa-youtube" aria-hidden="true"></i>
						        </a>
						    </li>
					    {/if}
					</ul>
				</div>
			</div>
		{/if}
		<div class="footer--column payment is--last block">
			<div class="column--headline">{s name="sFooterPaymentHead"}Zahlarten{/s}</div>
			<div class="column--content js--collapse-target">
				<hr>
				<ul class="navigation--list block-group" role="menubar">
					{s namespace="frontend/index/menu_footer" name="sFooterPaymentContent"}{/s}
				</ul>
			</div>
		</div>
		<div class="footer--column delivery is--last block">
			<div class="column--headline">{s name="sFooterDeliveryHead"}Versandpartner{/s}</div>
			<div class="column--content js--collapse-target">
				<hr>
				<ul class="navigation--list block-group" role="menubar">
					{s namespace="frontend/index/menu_footer" name="sFooterDeliveryContent"}
						<li class="navigation--entry" role="menuitem">
					    	<i class="gres-dhl"></i>
					    </li>
					{/s}
				</ul>
			</div>
		</div>
	</div>
{/block}
