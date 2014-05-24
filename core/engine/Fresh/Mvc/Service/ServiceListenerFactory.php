<?php
namespace Fresh\Mvc\Service;

use Zend\Mvc\Service\ServiceListenerFactory as ZendServiceListenerFactory;

/**
 * 
 * @author chinkei
 */
class ServiceListenerFactory extends ZendServiceListenerFactory
{
    public function __construct()
    {
    	// Add factories map
    	$this->defaultServiceConfig['factories'] = array_merge($this->defaultServiceConfig['factories'], array(
    		'ViewHelperManager' => 'Fresh\Mvc\Service\ViewHelperManagerFactory',
    		'Navigation' => 'Zend\Navigation\Service\DefaultNavigationFactory',
    	));
    	
    	// Add invokables map
    	$this->defaultServiceConfig['invokables'] = array_merge($this->defaultServiceConfig['invokables'], array(
    		'FreshControllerStrategy' => 'Fresh\Strategy\ControllerStrategy',
    	));
    }
}
