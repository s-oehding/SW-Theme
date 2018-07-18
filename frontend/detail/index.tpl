{extends file='frontend/index/index.tpl'}

{* Custom header *}
{block name='frontend_index_header'}
    {include file="frontend/detail/header.tpl"}
{/block}

{* Modify the breadcrumb *}
{block name='frontend_index_breadcrumb_inner' prepend}
    {block name="frontend_detail_breadcrumb_overview"}
        {if !{config name=disableArticleNavigation}}
            {$breadCrumbBackLink = $sBreadcrumb[count($sBreadcrumb) - 1]['link']}
            <a class="breadcrumb--button breadcrumb--link" href="{if $breadCrumbBackLink}{$breadCrumbBackLink}{else}#{/if}" title="{s name="DetailNavIndex" namespace="frontend/detail/navigation"}{/s}">
                <i class="icon--arrow-left"></i>
                <span class="breadcrumb--title">{s name='DetailNavIndex' namespace="frontend/detail/navigation"}{/s}</span>
            </a>
        {/if}
    {/block}
{/block}

{block name="frontend_index_content_top" append}
    {* Product navigation - Previous and next arrow button *}
    {block name="frontend_detail_index_navigation"}
        {if !{config name=disableArticleNavigation}}
            <nav class="product--navigation">
                {include file="frontend/detail/navigation.tpl"}
            </nav>
        {/if}
    {/block}
{/block}

{* Main content *}
{block name='frontend_index_content'}
    <div class="content product--details" itemscope itemtype="http://schema.org/Product"{if !{config name=disableArticleNavigation}} data-product-navigation="{url module="widgets" controller="listing" action="productNavigation"}" data-category-id="{$sArticle.categoryID}" data-main-ordernumber="{$sArticle.mainVariantNumber}"{/if} data-ajax-wishlist="true" data-compare-ajax="true"{if $theme.ajaxVariantSwitch} data-ajax-variants-container="true"{/if}>

        {* The configurator selection is checked at this early point
           to use it in different included files in the detail template. *}
        {block name='frontend_detail_index_configurator_settings'}

            {* Variable for tracking active user variant selection *}
            {$activeConfiguratorSelection = true}

            {if $sArticle.sConfigurator && ($sArticle.sConfiguratorSettings.type == 1 || $sArticle.sConfiguratorSettings.type == 2)}
                {* If user has no selection in this group set it to false *}
                {foreach $sArticle.sConfigurator as $configuratorGroup}
                    {if !$configuratorGroup.selected_value}
                        {$activeConfiguratorSelection = false}
                    {/if}
                {/foreach}
            {/if}
        {/block}

        <div class="product--detail-upper block-group">
            {* Product image *}
            {block name='frontend_detail_index_image_container'}
                <div class="product--image-container image-slider{if $sArticle.image && {config name=sUSEZOOMPLUS}} product--image-zoom{/if}"
                    {if $sArticle.image}
                     data-image-slider="true"
                     data-image-gallery="true"
                     data-maxZoom="{$theme.lightboxZoomFactor}"
                     data-thumbnails=".image--thumbnails"
                    {/if}>
                    {include file="frontend/detail/image.tpl"}
                </div>
            {/block}

            <div class="product-info-wrapper">

                {* Product header *}
                {block name='frontend_detail_index_header'}
                    <header class="product--header">
                        {block name='frontend_detail_index_header_inner'}
                            <div class="product--info">
                                {block name='frontend_detail_index_product_info'}


                                    {* Product - Supplier information *}
                                    {block name='frontend_detail_supplier_info'}
{*                                             {if $sArticle.supplierImg}
                                            <div class="product--supplier">
                                                <a href="{url controller='listing' action='manufacturer' sSupplier=$sArticle.supplierID}"
                                                   title="{"{s name="DetailDescriptionLinkInformation" namespace="frontend/detail/description"}{/s}"|escape}"
                                                   class="product--supplier-link">
                                                    <img src="{$sArticle.supplierImg}" alt="{$sArticle.supplierName|escape}">
                                                </a>
                                            </div>
                                        {/if}  *}
                                    {/block}

                                    {* Product name *}
                                    {block name='frontend_detail_index_name'}
                                        <h1 class="product--title" itemprop="name">{if $sArticle.attr1}{$sArticle.attr1}{/if} {$sArticle.articleName} {if $sArticle.attr15}{$sArticle.attr15}{/if}</h1>
                                    {/block}

                                    {* Product short description *}
                                    {block name='frontend_detail_index_short_description'}
                                        <p class="product--short-description" itemprop="description">
                                            {if $sArticle.description} {$sArticle.description|strip_tags|truncate:240} {/if}
                                        </p>
                                    {/block}

                                    {* Product rating *}
                                    {block name="frontend_detail_comments_overview"}
                                        {if !{config name=VoteDisable}}
                                            <div class="product--rating-container">
                                                <a href="#product--publish-comment" class="product--rating-link" rel="nofollow" title="{"{s namespace="frontend/detail/actions" name='DetailLinkReview'}{/s}"|escape}">
                                                    {include file='frontend/_includes/rating.tpl' points=$sArticle.sVoteAverage.average type="aggregated" count=$sArticle.sVoteAverage.count}
                                                </a>
                                            </div>
                                        {/if}
                                    {/block}
                                {/block}
                            </div>
                        {/block}
                    </header>
                {/block}

                {* "Buy now" box container *}
                {block name='frontend_detail_index_buy_container'}
                    <div class="product--buybox block{if $sArticle.sConfigurator && $sArticle.sConfiguratorSettings.type==2} is--wide{/if}">

                        {block name="frontend_detail_rich_snippets_brand"}
                            <meta itemprop="brand" content="{$sArticle.supplierName|escape}"/>
                        {/block}

                        {block name="frontend_detail_rich_snippets_weight"}
                            {if $sArticle.weight}
                                <meta itemprop="weight" content="{$sArticle.weight} kg"/>
                            {/if}
                        {/block}

                        {block name="frontend_detail_rich_snippets_height"}
                            {if $sArticle.height}
                                <meta itemprop="height" content="{$sArticle.height} cm"/>
                            {/if}
                        {/block}

                        {block name="frontend_detail_rich_snippets_width"}
                            {if $sArticle.width}
                                <meta itemprop="width" content="{$sArticle.width} cm"/>
                            {/if}
                        {/block}

                        {block name="frontend_detail_rich_snippets_depth"}
                            {if $sArticle.length}
                                <meta itemprop="depth" content="{$sArticle.length} cm"/>
                            {/if}
                        {/block}

                        {block name="frontend_detail_rich_snippets_release_date"}
                            {if $sArticle.sReleasedate}
                                <meta itemprop="releaseDate" content="{$sArticle.sReleasedate}"/>
                            {/if}
                        {/block}

                        {block name='frontend_detail_buy_laststock'}
                            {if !$sArticle.isAvailable && ($sArticle.isSelectionSpecified || !$sArticle.sConfigurator)}
                                {include file="frontend/_includes/messages.tpl" type="error" content="{s name='DetailBuyInfoNotAvailable' namespace='frontend/detail/buy'}{/s}"}
                            {/if}
                        {/block}

                        {* Product email notification *}
                        {block name="frontend_detail_index_notification"}
                            {if $sArticle.notification && $sArticle.instock <= 0 && $ShowNotification}
                                {include file="frontend/plugins/notification/index.tpl"}
                            {/if}
                        {/block}

                        {* Product data *}
                        {block name='frontend_detail_index_buy_container_inner'}
                            <div itemprop="offers" itemscope itemtype="{if $sArticle.sBlockPrices}http://schema.org/AggregateOffer{else}http://schema.org/Offer{/if}" class="buybox--inner">

                                {block name='frontend_detail_index_data'}
                                    {if $sArticle.sBlockPrices}
                                        {$lowestPrice=false}
                                        {$highestPrice=false}
                                        {foreach $sArticle.sBlockPrices as $blockPrice}
                                            {if $lowestPrice === false || $blockPrice.price < $lowestPrice}
                                                {$lowestPrice=$blockPrice.price}
                                            {/if}
                                            {if $highestPrice === false || $blockPrice.price > $highestPrice}
                                                {$highestPrice=$blockPrice.price}
                                            {/if}
                                        {/foreach}

                                        <meta itemprop="lowPrice" content="{$lowestPrice}" />
                                        <meta itemprop="highPrice" content="{$highestPrice}" />
                                        <meta itemprop="offerCount" content="{$sArticle.sBlockPrices|count}" />
                                    {else}
                                        <meta itemprop="priceCurrency" content="{$Shop->getCurrency()->getCurrency()}"/>
                                    {/if}
                                    {include file="frontend/detail/data.tpl" sArticle=$sArticle sView=1}
                                {/block}

                                {block name='frontend_detail_index_after_data'}{/block}

                                {* Configurator drop down menu's *}
                                {block name="frontend_detail_index_configurator"}
                                    <div class="product--configurator">
                                        {if $sArticle.sConfigurator}
                                            {if $sArticle.sConfiguratorSettings.type == 1}
                                                {include file="frontend/detail/config_step.tpl"}
                                            {elseif $sArticle.sConfiguratorSettings.type == 2}
                                                {include file="frontend/detail/config_variant.tpl"}
                                            {else}
                                                {include file="frontend/detail/config_upprice.tpl"}
                                            {/if}
                                        {/if}
                                    </div>
                                {/block}

                                {* Include buy button and quantity box *}
                                {block name="frontend_detail_index_buybox"}
                                    {include file="frontend/detail/buy.tpl"}
                                {/block}

                                {* Product actions *}
                                {block name="frontend_detail_index_actions"}{* 
                                    <nav class="product--actions">
                                        {include file="frontend/detail/actions.tpl"}
                                    </nav> *}
                                {/block}
                            </div>
                        {/block}

                        {* Product - Base information *}
                        {block name='frontend_detail_index_buy_container_base_info'}
                            <ul class="product--base-info list--unstyled">

                                {* Product SKU *}
                                {block name='frontend_detail_data_ordernumber'}
                                    <li class="base-info--entry entry--sku">

                                        {* Product SKU - Label *}
                                        {block name='frontend_detail_data_ordernumber_label'}
                                            <strong class="entry--label">
                                                {s name="DetailDataId" namespace="frontend/detail/data"}{/s}
                                            </strong>
                                        {/block}

                                        {* Product SKU - Content *}
                                        {block name='frontend_detail_data_ordernumber_content'}
                                            <meta itemprop="productID" content="{$sArticle.articleDetailsID}"/>
                                            <span class="entry--content" itemprop="sku">
                                                {$sArticle.ordernumber}
                                            </span>
                                        {/block}
                                    </li>
                                {/block}

                                {* Product EAN *}
                                {block name='frontend_detail_data_ordernumber'}
                                    <li class="base-info--entry entry--ean">

                                        {* Product EAN - Label *}
                                        {block name='frontend_detail_data_ordernumber_label'}
                                            <strong class="entry--label">
                                                {s name="ean" namespace="frontend/detail/data"}{/s}
                                            </strong>
                                        {/block}

                                        {* Product EAN - Content *}
                                        {block name='frontend_detail_data_ordernumber_content'}
                                            <meta itemprop="productID" content="{$sArticle.articleDetailsID}"/>
                                            <span class="entry--content" itemprop="gtin13">
                                              {if $sArticle.ean}
                                                {$sArticle.ean}
                                              {else}
                                                <span class="entry--content" itemprop="gtin13">-</span>
                                              {/if}
                                            </span>
                                        {/block}
                                    </li>
                                {/block}

                                {* Product weight *}
                                {block name='frontend_detail_data_weight'}
                                    <li class="base-info--entry entry--weight">

                                        {* Product weight - Label *}
                                        {block name='frontend_detail_data_weight_label'}
                                            <strong class="entry--label">
                                                {s name="weight" namespace="frontend/detail/data"}Gewicht:{/s}
                                            </strong>
                                        {/block}

                                        {* Product weight - Content *}
                                        {block name='frontend_detail_data_ordernumber_content'}
                                            <span class="entry--content" itemprop="weight">
                                              {if $sArticle.weight}
                                                {$sArticle.weight|replace:".":","} kg
                                              {else}
                                                <span>-</span>
                                              {/if}
                                            </span>
                                        {/block}
                                    </li>
                                {/block}

                                {* Product length *}
                                {block name='frontend_detail_data_length'}
                                    <li class="base-info--entry entry--length">

                                        {* Product lenght - Label *}
                                        {block name='frontend_detail_data_length_label'}
                                            <strong class="entry--label">
                                                {s name="length" namespace="frontend/detail/data"}Länge:{/s}
                                            </strong>
                                        {/block}

                                        {* Product legth - Content *}
                                        {block name='frontend_detail_data_ordernumber_content'}
                                            <span class="entry--content" itemprop="length">
                                              {if $sArticle.length}
                                                {$sArticle.length|replace:".":","} cm
                                              {else}
                                                <span>-</span>
                                              {/if}
                                            </span>
                                        {/block}
                                    </li>
                                {/block}

                                {* Product width *}
                                {block name='frontend_detail_data_width'}
                                    <li class="base-info--entry entry--width">

                                        {* Product width - Label *}
                                        {block name='frontend_detail_data_width_label'}
                                            <strong class="entry--label">
                                                {s name="width" namespace="frontend/detail/data"}Breite:{/s}
                                            </strong>
                                        {/block}

                                        {* Product width - Content *}
                                        {block name='frontend_detail_data_ordernumber_content'}
                                            <span class="entry--content" itemprop="width">
                                              {if $sArticle.width}
                                                {$sArticle.width|replace:".":","} cm
                                              {else}
                                                <span>-</span>
                                              {/if}
                                            </span>
                                        {/block}
                                    </li>
                                {/block}

                                {* Product height *}
                                {block name='frontend_detail_data_height'}
                                    <li class="base-info--entry entry--height">

                                        {* Product height - Label *}
                                        {block name='frontend_detail_data_height_label'}
                                            <strong class="entry--label">
                                                {s name="height" namespace="frontend/detail/data"}Höhe:{/s}
                                            </strong>
                                        {/block}

                                        {* Product height - Content *}
                                        {block name='frontend_detail_data_ordernumber_content'}
                                            <span class="entry--content" itemprop="height">
                                              {if $sArticle.height}
                                                {$sArticle.height|replace:".":","} cm
                                              {else}
                                                <span>-</span>
                                              {/if}
                                            </span>
                                        {/block}
                                    </li>
                                {/block}

                                {* Product content *}
                                {block name='frontend_detail_data_content'}
                                    <li class="base-info--entry entry--content">

                                        {* Product content - Label *}
                                        {block name='frontend_detail_data_weight_label'}
                                            <strong class="entry--label">
                                                {s name="content" namespace="frontend/detail/data"}{/s}
                                            </strong>
                                        {/block}

                                        {* Product weihgt - Content *}
                                        {block name='frontend_detail_data_ordernumber_content'}
                                            <span class="entry--content" itemprop="content">
                                              {if $sArticle.purchaseunit}
                                                {$sArticle.purchaseunit} {$sArticle.sUnit.description}
                                              {else}
                                                <span>-</span>
                                              {/if}
                                            </span>
                                        {/block}
                                    </li>
                                {/block}
                            </ul>
                        {/block}
                    </div>
                {/block}
            </div>
        </div>

        {* Product bundle hook point *}
        {block name="frontend_detail_index_bundle"}{/block}

        {block name="frontend_detail_index_detail"}

            {* Tab navigation *}
            {block name="frontend_detail_index_tabs"}
                {include file="frontend/detail/tabs.tpl"}
            {/block}
        {/block}

        {* Crossselling tab panel *}
        {block name="frontend_detail_index_tabs_cross_selling"}

            {$showAlsoViewed = {config name=similarViewedShow}}
            {$showAlsoBought = {config name=alsoBoughtShow}}

            <div class="tab-menu--cross-selling"{if $sArticle.relatedProductStreams} data-scrollable="true"{/if}>

                {* Tab navigation *}
                {block name="frontend_detail_index_tabs_navigation"}
                    <div class="tab--navigation">


                        {block name="frontend_detail_index_tabs_navigation_inner"}
                            {block name="frontend_detail_index_related_similiar_tabs"}


                                {* Customer also viewed *}
                                {block name="frontend_detail_index_tabs_entry_also_viewed"}
                                    {if $showAlsoViewed}
                                        <a href="#content--customer-viewed" title="{s name="DetailRecommendationAlsoViewedLabel"}{/s}" class="tab--link">{s name="DetailRecommendationAlsoViewedLabel"}{/s}</a>
                                    {/if}
                                {/block}

                                {* Customer also bought *}
                                {block name="frontend_detail_index_tabs_entry_also_bought"}
                                    {if $showAlsoBought}
                                        <a href="#content--also-bought" title="{s name="DetailRecommendationAlsoBoughtLabel"}{/s}" class="tab--link">{s name="DetailRecommendationAlsoBoughtLabel"}{/s}</a>
                                    {/if}
                                {/block}

                                {* Tab navigation - Accessory products *}
                                {block name="frontend_detail_tabs_entry_related"}
                                    {if $sArticle.sRelatedArticles && !$sArticle.crossbundlelook}
                                        <a href="#content--related-products" title="{s namespace="frontend/detail/tabs" name='DetailTabsAccessories'}{/s}" class="tab--link">
                                            {s namespace="frontend/detail/tabs" name='DetailTabsAccessories'}{/s}
                                            <span class="product--rating-count-wrapper">
                                                <span class="product--rating-count">{$sArticle.sRelatedArticles|@count}</span>
                                            </span>
                                        </a>
                                    {/if}
                                {/block}

                                {* Similar products *}
                                {block name="frontend_detail_index_recommendation_tabs_entry_similar_products"}
                                    {if count($sArticle.sSimilarArticles) > 0}
                                        <a href="#content--similar-products" title="{s name="DetailRecommendationSimilarLabel"}{/s}" class="tab--link">{s name="DetailRecommendationSimilarLabel"}{/s}</a>
                                    {/if}
                                {/block}
                            

                                {* Color Tab*}
                                {block name="frontend_detail_index_tabs_entry_also_viewed"}
                                    {if $sArticle.attr16}
                                        <a href="#content--colors" title="{s name="DetailRecommendationColors"}{/s}" class="tab--link">{s name="DetailRecommendationColors"}{/s}</a>
                                    {/if}
                                {/block}

                                {* Rating tab *}
                                {block name="frontend_detail_tabs_rating"}
                                    {if !{config name=VoteDisable}}
                                        <a href="#content--rating" class="tab--link" title="{s name='DetailTabsRating'}{/s}" data-tabName="rating">
                                            {s namespace='frontend/index/detail' name='DetailTabsRating'}Bewertungen{/s}
                                            {block name="frontend_detail_tabs_navigation_rating_count"}
                                                <span class="product--rating-count">{$sArticle.sVoteAverage.count}</span>
                                            {/block}
                                        </a>
                                    {/if}
                                {/block}

                                {* Related product streams *}
                                {block name="frontend_detail_index_tabs_entry_related_product_streams"}
                                    {foreach $sArticle.relatedProductStreams as $key => $relatedProductStream}
                                        <a href="#content--related-product-streams-{$key}" title="{$relatedProductStream.name}" class="tab--link">{$relatedProductStream.name}</a>
                                    {/foreach}
                                {/block}
                            {/block}
                        {/block}
                    </div>
                {/block}

                {* Tab content container *}
                {block name="frontend_detail_index_outer_tabs"}
                    <div class="tab--container-list">
                        {block name="frontend_detail_index_inner_tabs"}
                            {block name='frontend_detail_index_before_tabs'}{/block}

                            {* "Customers similar viewed" slider *}
                            {if $showAlsoViewed}
                                {block name="frontend_detail_index_tabs_also_viewed"}
                                    <div class="tab--container">
                                        {block name="frontend_detail_index_tabs_also_viewed_inner"}
                                            <div class="tab--header">
                                                <a href="#" class="tab--title" title="{s name='DetailRecommendationAlsoViewedLabel'}{/s}">{s name='DetailRecommendationAlsoViewedLabel'}{/s}</a>
                                            </div>
                                            <div class="tab--content content--also-viewed">{action module=widgets controller=recommendation action=viewed articleId=$sArticle.articleID}</div>
                                        {/block}
                                    </div>
                                {/block}
                            {/if}

                            {* "Customers bought also" slider *}
                            {if $showAlsoBought}
                                {block name="frontend_detail_index_tabs_also_bought"}
                                    <div class="tab--container">
                                        {block name="frontend_detail_index_tabs_also_bought_inner"}
                                            <div class="tab--header">
                                                <a href="#" class="tab--title" title="{s name='DetailRecommendationAlsoBoughtLabel'}{/s}">{s name='DetailRecommendationAlsoBoughtLabel'}{/s}</a>
                                            </div>
                                            <div class="tab--content content--also-bought">{action module=widgets controller=recommendation action=bought articleId=$sArticle.articleID}</div>
                                        {/block}
                                    </div>
                                {/block}
                            {/if}

                            {* Accessory articles *}
                            {block name="frontend_detail_index_tabs_related"}
                                {if $sArticle.sRelatedArticles && !$sArticle.crossbundlelook}
                                    <div class="tab--container">
                                        {block name="frontend_detail_index_tabs_related_inner"}
                                            <div class="tab--header">
                                                <a href="#" class="tab--title" title="{s namespace="frontend/detail/tabs" name='DetailTabsAccessories'}{/s}">
                                                    {s namespace="frontend/detail/tabs" name='DetailTabsAccessories'}{/s}
                                                    <span class="product--rating-count-wrapper">
                                                        <span class="product--rating-count">{$sArticle.sRelatedArticles|@count}</span>
                                                    </span>
                                                </a>
                                            </div>
                                            <div class="tab--content content--related">{include file="frontend/detail/tabs/related.tpl"}</div>
                                        {/block}
                                    </div>
                                {/if}
                            {/block}

                            {* Similar products slider *}
                            {if $sArticle.sSimilarArticles}
                                {block name="frontend_detail_index_tabs_similar"}
                                    <div class="tab--container">
                                        {block name="frontend_detail_index_tabs_similar_inner"}
                                            <div class="tab--header">
                                                <a href="#" class="tab--title" title="{s name="DetailRecommendationSimilarLabel"}{/s}">{s name="DetailRecommendationSimilarLabel"}{/s}</a>
                                            </div>
                                            <div class="tab--content content--similar">{include file='frontend/detail/tabs/similar.tpl'}</div>
                                        {/block}
                                    </div>
                                {/block}
                            {/if}

                            {* "Color list*}
                            {if $sArticle.attr16}
                                {block name="frontend_detail_index_tabs_colors"}
                                    <div class="tab--container">
                                        {block name="frontend_detail_index_tabs_colors_inner"}
                                            <div class="tab--header">
                                                <a href="#" class="tab--title" title="{s name='DetailRecommendationColorsLabel'}{/s}">{s name='DetailRecommendationColorsLabel'}{/s}</a>
                                            </div>
                                            <div class="tab--content content--colors">{$sArticle.attr16}</div>
                                        {/block}
                                    </div>
                                {/block}
                            {/if}

                            {* Rating container *}
                            {block name="frontend_detail_tabs_content_rating"}
                                {if !{config name=VoteDisable}}
                                    <div class="tab--container">
                                        {block name="frontend_detail_tabs_content_rating_inner"}

                                            {* Rating title *}
                                            {block name="frontend_detail_tabs_rating_title"}
                                                <div class="tab--header">
                                                    {block name="frontend_detail_tabs_rating_title_inner"}
                                                        <a href="#" class="tab--title" title="{s name='DetailTabsRating'}{/s}">{s name='DetailTabsRating'}{/s}
                                                        {block name="frontend_detail_tabs_rating_title_count"}
                                                            <span class="product--rating-count">{$sArticle.sVoteAverage.count}</span>
                                                        {/block}
                                                        </a>
                                                    {/block}
                                                </div>
                                            {/block}

                                            {* Rating content *}
                                            {block name="frontend_detail_tabs_rating_content"}
                                                <div class="tab--content content-rating">
                                                    {block name="frontend_detail_tabs_rating_content_inner"}
                                                        {include file="frontend/detail/tabs/comment.tpl"}
                                                    {/block}
                                                </div>
                                            {/block}

                                        {/block}
                                    </div>
                                {/if}
                            {/block}

                            {* Related product streams *}
                            {foreach $sArticle.relatedProductStreams as $key => $relatedProductStream}
                                {block name="frontend_detail_index_tabs_related_product_streams"}
                                    <div class="tab--container" data-tab-id="productStreamSliderId-{$relatedProductStream.id}">
                                        {block name="frontend_detail_index_tabs_related_product_streams_inner"}
                                            <div class="tab--header">
                                                <a href="#" class="tab--title" title="{$relatedProductStream.name}">{$relatedProductStream.name}</a>
                                            </div>
                                            <div class="tab--content content--related-product-streams-{$key}">
                                                {include file='frontend/detail/tabs/product_streams.tpl'}
                                            </div>
                                        {/block}
                                    </div>
                                {/block}
                            {/foreach}

                            {block name='frontend_detail_index_after_tabs'}{/block}
                        {/block}
                    </div>
                {/block}
            </div>
        {/block}
    </div>
{/block}