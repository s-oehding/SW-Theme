{extends file='parent:frontend/index/header.tpl'}

{* Meta-Tags *}
{block name='frontend_index_header_meta_tags'}
	<meta name="author" content="{s name='IndexMetaAuthor'}{/s}" />
	{* <meta name="copyright" content="{s name='IndexMetaCopyright'}{/s}" /> *}
	<meta name="robots" content="{block name='frontend_index_header_meta_robots'}{s name='IndexMetaRobots'}{/s}{/block}" />
	<meta name="revisit-after" content="{s name='IndexMetaRevisit'}{/s}" />
	<meta name="keywords" content="{block name='frontend_index_header_meta_keywords'}{if $sCategoryContent.metaKeywords}{$sCategoryContent.metaKeywords|escapeHtml}{else}{s name='IndexMetaKeywordsStandard'}{/s}{/if}{/block}" />
	<meta name="description" content="{block name='frontend_index_header_meta_description'}{s name='IndexMetaDescriptionStandard'}{/s}{/block}" />

    {* Meta opengraph tags *}
    {block name='frontend_index_header_meta_tags_opengraph'}
        <meta property="og:type" content="website" />
        <meta property="og:site_name" content="{{config name=sShopname}|escapeHtml}" />
        <meta property="og:title" content="{{config name=sShopname}|escapeHtml}" />
        <meta property="og:description" content="{s name='IndexMetaDescriptionStandard'}{/s}" />
        <meta property="og:image" content="{link file=$theme.desktopLogo fullPath}" />

        <meta name="twitter:card" content="website" />
        <meta name="twitter:site" content="{{config name=sShopname}|escapeHtml}" />
        <meta name="twitter:title" content="{{config name=sShopname}|escapeHtml}" />
        <meta name="twitter:description" content="{s name='IndexMetaDescriptionStandard'}{/s}" />
        <meta name="twitter:image" content="{link file=$theme.desktopLogo fullPath}" />
    {/block}

	{block name='frontend_index_header_meta_tags_schema_webpage'}
		<meta itemprop="copyrightHolder" content="GRES SpanienFliesen GmbH" />
		<meta itemprop="copyrightYear" content="{$smarty.now|date_format:"%Y"}" />
		<meta itemprop="isFamilyFriendly" content="{if {config name=metaIsFamilyFriendly}}True{else}False{/if}" />
		<meta itemprop="image" content="{link file=$theme.desktopLogo}" />
	{/block}

	{block name='frontend_index_header_meta_tags_mobile'}
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<meta name="mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-title" content="{if $theme.appleWebAppTitle != ""}{$theme.appleWebAppTitle|escapeHtml}{else}{{config name=sShopname}|escapeHtml}{/if}">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
	{/block}
{/block}

{* Canonical link *}
{block name='frontend_index_header_canonical'}{/block}

{* RSS and Atom feeds *}
{block name="frontend_index_header_feeds"}{/block}

{* Page title *}
<title itemprop="name">
	{block name='frontend_index_header_title'}
		{strip}
			{if $sBreadcrumb}{foreach from=$sBreadcrumb item=breadcrumb}{$breadcrumb.name}{/foreach}{/if}
		{/strip}
	{/block}
</title>
