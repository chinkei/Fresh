<?php
namespace Fresh\Strategy;

use Zend\EventManager\EventManagerInterface;
use Zend\EventManager\ListenerAggregateInterface;

/**
 * 控制器策略类
 * 
 * @author chinkei.chen
 */
class ControllerStrategy implements ListenerAggregateInterface
{

    /**
     * @var \Zend\Stdlib\CallbackHandler[]
     */
    protected $listeners = array();

    /**
     * @param \Zend\EventManager\EventManagerInterface $events
     */
    public function attach(EventManagerInterface $event)
    {
    	$eventManager = $event->getSharedManager();
    	
    	$eventManager->attach('Zend\Mvc\Controller\AbstractActionController', 'dispatch', function($evt) {
    		// 获取Config Service
    		$serviceManager = $evt->getApplication()->getServiceManager();
    		$config = $serviceManager->get('config');
    		$freshConfig = $config['FreshConfig'];
    		
    		// 获取模块命名空间
    		$controller = $evt->getTarget();
    		$controllerClass = get_class($controller);
            $namespace = substr($controllerClass, 0, strpos($controllerClass, '\\'));
            
            // 设置Layout
            if ( isset($freshConfig['Layout'][$namespace]) ) {
            	$controller->layout($freshConfig['Layout'][$namespace]);
            }
            
            // 设置BasePath
            if ( isset($freshConfig['BasePath'][$namespace]) ) {
            	$evt->getRequest()->setBaseUrl($freshConfig['BasePath'][$namespace]);
            }
    	}, -80);
    }

    /**
     * @param \Zend\EventManager\EventManagerInterface $events
     */
    public function detach(EventManagerInterface $events)
    {
        foreach ( $this->listeners as $index => $listener ) {
            if ( $events->detach($listener) ) {
                unset($this->listeners[$index]);
            }
        }
    }
}
