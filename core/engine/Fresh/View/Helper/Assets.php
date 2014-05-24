<?php
namespace Fresh\View\Helper;

use Zend\View\Helper\AbstractHelper;
use Zend\View\Exception;


/**
 * View helper for css,js assets
 * 
 * @author chinkei.chen
 */
class Assets extends AbstractHelper
{
	/**
	 * 
	 * @var string
	 */
	private $_toString = '';
	
	
	private $baseUrl = '';
	
	public function __construct()
	{
		$this->baseUrl = 'http://www.a.com';
	}
	
    /**
    * Invoke helper as functor
    *
    * Proxies to {@link render()}.
    * 
    * @param  ElementInterface $element 
    * @return string
    */
    public function __invoke($type = '', $files = array())
    {
    	if ( !$files ) {
    		throw new Exception\InvalidArgumentException(sprintf(
    			'Assets file was not empty.'
    		));
    	}
    	
    	$type = strtolower($type);
    	switch ( $type ) {
    		case 'js':
    		case 'css':
    		case 'image':
    			$this->_toString = $this->{$type}($files);
    		break;
    		
    		default:
    			throw new Exception\InvalidArgumentException(sprintf(
    				'Assets type must be js, css, image.'
    			));
    		break;
    	}
    	return $this;
    }
    
    /**
     * 
     * 
     * @param  string|array $files
     * @param  boolean $compress
     * @throws Exception\InvalidArgumentException
     * @return string
     */
    public function css($files = array(), $compress = false)
    {
    	$headLink = $this->view->headLink();
    	if ( is_array($files) ) {
    		foreach ( $files as $file ) {
    			$headLink->appendStylesheet($file);
    		}
    	} elseif (is_string($files)){
    		$headLink->appendStylesheet($file);
    	} else {
    		throw new Exception\InvalidArgumentException(sprintf(
    			'Assets helper require Css file array or string input'
    		));
    	}
    	
    	return $headLink->toString();
    }
    
    /**
     * 
     * @param string|array $files
     * @param boolean $compress
     * @throws Exception\InvalidArgumentException
     */
    public function js($files = array(), $compress = false)
    {
    	$headScript = $this->view->headScript();
    	if ( is_array($files) ) {
            foreach ( $files as $file ) {
                $headScript->appendFile($file,  'text/javascript');
            }
        } elseif (is_string($files)){
            $headScript->appendFile($files,  'text/javascript');
        } else {
            throw new Exception\InvalidArgumentException(sprintf(
                'Assets helper require js file array or string input'
            ));
        }
        
        return $headScript->toString();
    }
    
    /**
     * 
     * @return string
     */
    public function __toString()
    {
    	return $this->_toString;
    }
}
