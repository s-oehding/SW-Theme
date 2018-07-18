{namespace name="frontend/detail/description"}

{* Offcanvas buttons *}
{block name='frontend_detail_description_buttons_offcanvas'}
    <div class="buttons--off-canvas">
        {block name='frontend_detail_description_buttons_offcanvas_inner'}
            <a href="#" title="{"{s name="OffcanvasCloseMenu" namespace="frontend/detail/description"}{/s}"|escape}" class="close--off-canvas">
                <i class="icon--arrow-left"></i>
                {s name="OffcanvasCloseMenu" namespace="frontend/detail/description"}{/s}
            </a>
        {/block}
    </div>
{/block}

{block name="frontend_detail_description"}
<div class="content--description">

	{* Headline *}
	{block name='frontend_detail_description_title'}
		<h2 class="content--title">
			{s name="DetailDescriptionHeader"}{/s} {if $sArticle.attr1}{$sArticle.attr1}{/if} {$sArticle.articleName} {if $sArticle.attr15}{$sArticle.attr15}{/if}
		</h2>
	{/block}

	{* Product description *}
	{block name='frontend_detail_description_text'}
        <div class="product--description" itemprop="description">
            {$sArticle.description_long}
        </div>
	{/block}

	{block name="frontend_detail_warnings"}
		<div class="content--warnings">

			{* Gefahrsymbole *}
			{block name='frontend_detail_safety'}
				<div class="warning-symbol-wrapper">
					{if $sArticle.attr4}
						<h3>Gefahr</h3>
					{/if}
					<ul class="warning-symbols">
						{if $sArticle.attr5}<li class="warning-symbol"><img src="/media/image/19/de/f1/GHS02-entzuendbar.png" alt="entzündlich"></li>{/if}
						{if $sArticle.attr6}<li class="warning-symbol"><img src="/media/image/11/95/64/GHS03-brandfoerdernd.png" alt="brandfördernd"></li>{/if}
						{if $sArticle.attr7}<li class="warning-symbol"><img src="/media/image/94/d4/b9/GHS05-aetzend.png" alt="Ätzend"></li>{/if}
						{if $sArticle.attr8}<li class="warning-symbol"><img src="/media/image/6c/4f/67/GHS06-giftig.png" alt="Giftig"></li>{/if}
						{if $sArticle.attr9}<li class="warning-symbol"><img src="/media/image/38/78/68/GHS07-reizend.png" alt="Reizend"></li>{/if}
						{if $sArticle.attr10}<li class="warning-symbol"><img src="/media/image/25/98/df/GHS08-gesundheitsschaedlich.png" alt="Gesundheitsschädlich"></li>{/if}
						{if $sArticle.attr11}<li class="warning-symbol"><img src="/media/image/33/0e/0c/GHS09-umweltschaedlich.png" alt="Umweltschädlich"></li>{/if}
					</ul>
				</div>
				<div class="product--description warnings">
					{if $sArticle.attr4}
						{$sArticle.attr4}
					{/if}
				</div>
			{/block}

			{* Hinweise *}
			{if $sArticle.attr2}
				<div class="alert is--error is--rounded">
					<div class="alert--icon">
						<!-- Alert message icon -->
						<i class="icon--element icon--warning"></i>
					</div>
					<div class="alert--content" style="text-align: center;">
							{$sArticle.attr2}
					</div>
				</div>
			{/if}

		</div>
	{/block}

	{* Properties *}
	{block name='frontend_detail_description_properties'}
{* 		{if $sArticle.sProperties}
			<div class="product--properties panel has--border">
			    <table class="product--properties-table">
					{foreach $sArticle.sProperties as $sProperty}
						<tr class="product--properties-row">
							{block name='frontend_detail_description_properties_label'}
								<td class="product--properties-label is--bold">{$sProperty.name|escape}:</td>
							{/block}
							{block name='frontend_detail_description_properties_content'}
								<td class="product--properties-value">{$sProperty.value|escape}</td>
							{/block}
						</tr>
					{/foreach}
			    </table>
			</div>
		{/if} *}
	{/block}

	{* Product - Further links *}
	{block name='frontend_detail_description_links'}

		{* Further links title *}
		{block name='frontend_detail_description_links_title'}
{* 			<h2 class="content--title">
				{s name="ArticleTipMoreInformation"}{/s} {if $sArticle.attr1}{$sArticle.attr1}{/if} {$sArticle.articleName} {if $sArticle.attr15}{$sArticle.attr15}{/if}
			</h2> *}
		{/block}

		{* Links list *}
		{block name='frontend_detail_description_links_list'}
{* 			<ul class="content--list list--unstyled">
				{block name='frontend_detail_actions_contact'}
					<li class="list--entry">
						<a href="{$sInquiry}" rel="nofollow" class="content--link link--contact" title="{"{s name='DetailLinkContact' namespace="frontend/detail/actions"}{/s}"|escape}">
							<i class="icon--arrow-right"></i> {s name="DetailLinkContact" namespace="frontend/detail/actions"}{/s}
						</a>
					</li>
				{/block}

				{foreach $sArticle.sLinks as $information}
					{if $information.supplierSearch}

						{block name='frontend_detail_description_links_supplier'}
							<li class="list--entry">
								<a href="{url controller='listing' action='manufacturer' sSupplier=$sArticle.supplierID}"
								   target="{$information.target}"
								   class="content--link link--supplier"
								   title="{"{s name="DetailDescriptionLinkInformation"}{/s}"|escape}">

                                    <i class="icon--arrow-right"></i> {s name="DetailDescriptionLinkInformation"}{/s}
								</a>
							</li>
						{/block}
					{else}

						{block name='frontend_detail_description_links_link'}
							<li class="list--entry">
								<a href="{$information.link}"
								   target="{if $information.target}{$information.target}{else}_blank{/if}"
								   class="content--link link--further-links"
								   title="{$information.description}">
                                    <i class="icon--arrow-right"></i> {$information.description}
								</a>
							</li>
						{/block}
					{/if}
				{/foreach}
			</ul> *}
		{/block}
	{/block}

	{* Downloads *}
	{block name='frontend_detail_description_downloads'}
		{if $sArticle.sDownloads}

			{* Downloads title *}
			{block name='frontend_detail_description_downloads_title'}
				<div class="content--title">
					{s name="DetailDescriptionHeaderDownloads"}{/s}
				</div>
			{/block}

			{* Downloads list *}
			{block name='frontend_detail_description_downloads_content'}
				<ul class="content--list list--unstyled">
					{foreach $sArticle.sDownloads as $download}
						{block name='frontend_detail_description_downloads_content_link'}
							<li class="list--entry">
								<a href="{$download.filename}" target="_blank" class="content--link link--download" title="{"{s name="DetailDescriptionLinkDownload"}{/s}"|escape} {$download.description|escape}">
									<div class="download--badge"><i class="gres-download"></i></div> <p>{s name="DetailDescriptionLinkDownload"}{/s} {$download.description}</p>
								</a>
							</li>
						{/block}
					{/foreach}
				</ul>
			{/block}
		{/if}
	{/block}

	{* Comment - Item open text fields attr3 *}
	{block name='frontend_detail_description_our_comment'}
		{if $sArticle.attr3}

			{* Comment title  *}
			{block name='frontend_detail_description_our_comment_title'}
				<div class="content--title">
					{s name='DetailDescriptionComment'}{/s} "{$sArticle.articleName}"
				</div>
			{/block}

			{block name='frontend_detail_description_our_comment_title_content'}
				<blockquote class="content--quote">{$sArticle.attr3}</blockquote>
			{/block}
		{/if}
	{/block}
</div>
{/block}
