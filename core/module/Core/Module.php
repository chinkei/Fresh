<?php
namespace Core;

use Zend\EventManager\EventInterface;

class Module
{
    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
    }
    
    /**
     * @param \Zend\EventManager\EventInterface $e
     *
     * @return array|void
     */
    public function onBootstrap(EventInterface $e)
    {
    	$application    = $e->getApplication();
    	$serviceManager = $application->getServiceManager();
    	$eventManager   = $application->getEventManager();
    
    	$eventManager->attach($serviceManager->get('FreshControllerStrategy'));
    }

    public function getAutoloaderConfig()
    {
        return array(
            'Zend\Loader\StandardAutoloader' => array(
                'namespaces' => array(
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__,
                ),
            ),
        );
    }
}