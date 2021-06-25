<?php
/**
 * =============================================================================================
 *  $URL: svn+ssh://svn@rose/repos/wc_members_site/app/Controllers/BaseController.php $
 *  $Rev: 37 $
 *  $Date:: 2020-12-16 16:38:47 +0900#$
 *  $Author: kohenji $
 *  $Id: BaseController.php 37 2020-12-16 07:38:47Z kohenji $
 *  Copyright (c) 2020. SarahSystems lpc. All rights reserved.
 * =============================================================================================
 */

namespace App\Controllers;

/**
 * Class BaseController
 *
 * BaseController provides a convenient place for loading components
 * and performing functions that are needed by all your controllers.
 * Extend this class in any new controllers:
 *     class Home extends BaseController
 *
 * For security be sure to declare any new methods as protected or private.
 *
 * @package CodeIgniter
 */

use CodeIgniter\Controller;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use Config\Services;
use Exception;
use MySmarty;
use Psr\Log\LoggerInterface;
//use ReflectionClass;
use Smarty;
use SmartyException;

/**
 * ベースコントローラー
 * Class BaseController
 * @package App\Controllers
 * @property Smarty $smarty
 * @property Services session
 */
class BaseController extends Controller
{

	/**
	 * An array of helpers to be loaded automatically upon
	 * class instantiation. These helpers will be available
	 * to all other controllers that extend BaseController.
	 *
	 * @var array
	 */
	protected $helpers = [ 'mysql' , 'tools' ];
    public $smarty;
    protected $session;

    /**
     * Constructor.
     * @param RequestInterface $request
     * @param ResponseInterface $response
     * @param LoggerInterface $logger
     */
	public function initController( RequestInterface $request, ResponseInterface $response, LoggerInterface $logger){
		// Do Not Edit This Line
		parent::initController($request, $response, $logger);
		
		//--------------------------------------------------------------------
		// Preload any models, libraries, etc, here.
		//--------------------------------------------------------------------
		// E.g.:
		// $this->session = \Config\Services::session();
        $this->session = Services::session();
        $this->smarty = new MySmarty();
        
        //ステータス用smarty変数初期化
        $this->smarty->assign( 'exec_success' );
        $this->smarty->assign( 'exec_message' );
        $this->smarty->assign( 'errors' , [] );
        
    }

    public function view( $method ){
        try{
            list( $class , $file ) = explode( "::" , $method );
            if( substr( $file , 0 , -4 ) != '.tpl' ){
                $file .= '.tpl';
            }

            if( class_exists( $class ) ){
//                $dir = ( new ReflectionClass( $class ) )->getShortName();
                $dir = str_replace( "\\" , "/" , substr( $class , strlen( __NAMESPACE__ ) + 1 ) ); // 1 は 末尾の\\を表す
            }else{
                $dir = $class;
            }
            
            $this->smarty->assign( 'CI' , $this );
            return $this->smarty->fetch( $dir . DIRECTORY_SEPARATOR . $file );
        }catch( SmartyException $e ){
            die( 'Smarty error : ' . $e->getMessage() . ( CI_DEBUG ? " at " . $e->getFile() . " : " . $e->getLine() : '' ) );
        }catch( Exception $e ){
            die( 'System error : ' . $e->getMessage() . ( CI_DEBUG ? " at " . $e->getFile() . " : " . $e->getLine() : '' ) );
        }
    }

}
