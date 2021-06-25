<?php
/**
 * =============================================================================================
 *  $URL: svn+ssh://svn@rose/repos/wc_members_site/app/ThirdParty/MySmarty.php $
 *  $Rev: 26 $
 *  $Date:: 2020-04-09 14:49:45 +0900#$
 *  $Author: kohenji $
 *  $Id: MySmarty.php 26 2020-04-09 05:49:45Z kohenji $
 *  Copyright (c) 2020. SarahSystems lpc. All rights reserved.
 * =============================================================================================
 */

/**
 * Class MySmarty
 */
class MySmarty extends Smarty{
    public function __construct(){
        parent::__construct();
        $this->setTemplateDir( APPPATH . 'Views' )
             ->setCompileDir( WRITEPATH . 'smarty' . DIRECTORY_SEPARATOR . 'templates_c' )
             ->setCacheDir( WRITEPATH . 'smarty' . DIRECTORY_SEPARATOR .  'cache' )
             ->setConfigDir( WRITEPATH . 'smarty' . DIRECTORY_SEPARATOR .  'configs' );
    }
}