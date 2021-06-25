<?php

namespace App\Controllers;

use App\Models\OkurijoData;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;
use Psr\Log\LoggerInterface;

/**
 * Class Home
 * @package App\Controllers
 * @property OkurijoData $okurijoData
 */
class Home extends BaseController{
    
    protected $okurijoData;

    public function initController( RequestInterface $request , ResponseInterface $response , LoggerInterface $logger ){
        parent::initController( $request , $response , $logger );
    
        $this->okurijoData = new OkurijoData();
    
    }
    
    public function index(){
        $this->smarty->assign( 'data' , $this->okurijoData->orderBy( 'id' , 'desc' )->findAll() );
        return $this->view( __METHOD__ );
        
	}
	
	public function print( $id ){
        $this->smarty->assign( 'data' , $this->okurijoData->find( $id ) );
        return $this->view( __METHOD__ );
    }
    
    public function delete( $id ){
        try{
            $this->okurijoData->delete( $id );
        }catch( Exception $e ){
            die( $e->getMessage() );
        }
        
    }
    
    public function edit( int $id = 0 , $seq = null ){
        try{
            switch( $seq ){
                case 'save':
                    $data = $_POST['send'];
                    if( $id !== 0 ){
                        $data['id'] = $id;
                    }
                    $this->okurijoData->save( $data );
                    break;
                default:
                    if( $id !== 0 ){
                        $data = $this->okurijoData->find( $id );
                        if( !$data ){
                            throw new Exception( 'data not found' );
                        }
                    }else{
                        $data = [
                            'last_name' => '',
                            'first_name' => '',
                            'zipcode' => '',
                            'prefectures' => '',
                            'add01' => '',
                            'add02' => '',
                            'company' => '',
                            'department' => '',
                            'katagaki' => '',
                            'tel' => '',
                            'fax' => '',
                            'print' => '',
                        ];
                    }
                    $seq = 'save';
                    break;
            }
            $this->smarty->assign( 'id' , $id );
            $this->smarty->assign( 'seq' , $seq );
            $this->smarty->assign( 'data' , $data );
            $this->smarty->assign( 'message' , 'success' );
        }catch( Exception $e ){
            $this->smarty->assign( 'message' , $e->getMessage() );
            die( $e->getMessage() );
        }
        
        return $this->view( __METHOD__ );
        
    }
	
}
