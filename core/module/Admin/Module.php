<?php
namespace Admin;

class Module
{
    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
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
    
    /**
     * @return array
     */
    public function getServiceConfig()
    {
    	return array(
    		'factories' => array(
    			'AdminNavigation' => 'Admin\Navigation\AdminNavigation',
    		),
    	);
    }
    
    /**
     * @return array
     */
    public function getViewHelperConfig()
    {
    	return array(
    		'factories' => array(
    			'admin_navigation' => function($sm) {
    				return new \Admin\View\Helper\AdminNavigation($sm->getServiceLocator());
    			},
    		),
    	);
    }
}