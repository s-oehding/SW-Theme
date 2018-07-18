<?php

namespace Shopware\Themes\Onlineshops;

use Shopware\Components\Form as Form;

class Theme extends \Shopware\Components\Theme
{
    protected $extend = 'Responsive';

    protected $name = <<<'SHOPWARE_EOD'
Onlineshops
SHOPWARE_EOD;

    protected $description = <<<'SHOPWARE_EOD'
Theme für alle Onlineshops.
SHOPWARE_EOD;

    protected $author = <<<'SHOPWARE_EOD'
GRES SpanienFliesen GmbH
SHOPWARE_EOD;

    protected $license = <<<'SHOPWARE_EOD'
MIT
SHOPWARE_EOD;

    /**
     * @param Form\Container\TabContainer $container
     */
    public function createConfig(Form\Container\TabContainer $container)
    {
        $fieldset = $this->createFieldSet(
            'shop_page_variables',
            'Shopseiten Einstellungen'
        );

        // Create the textfield
        $textFieldLeftVariable = $this->createTextField(
            'left_variable',
            'Left Sidebar Variable',
            'gLeft'
        );

        $textFieldBottom = $this->createTextField(
            'bottom_01_variable',
            'Bottom 01 Variable',
            'gBottom'
        );
        
        $textFieldBottom2 = $this->createTextField(
            'bottom_02_variable',
            'Bottom 02 Variable',
            'gBottom2'
        );

        // Adding the fields to the fieldset
        $fieldset->addElement($textFieldLeftVariable);
        $fieldset->addElement($textFieldBottom);
        $fieldset->addElement($textFieldBottom2);
        
        $tab = $this->createTab(
            'shop_pages_tab',
            'Schopseiten'
        );
        
        $tab->addElement($fieldset);

        $container->addTab($tab);
    }

    protected $javascript = array(
        'src/js/vendors/headroom.js/dist/headroom.js',
        'src/js/vendors/headroom.js/dist/jQuery.headroom.js',
	    'src/js/jquery.topbar.js',
        'src/js/jquery.off-canvas-menu.js',
        'src/js/jquery.shopware-responsive.js'
        
	);
}