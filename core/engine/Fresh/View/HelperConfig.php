<?php
namespace Fresh\View;

use Zend\ServiceManager\ConfigInterface,
	Zend\ServiceManager\ServiceManager;

class HelperConfig implements ConfigInterface
{
	
	/**
	 * @var array Pre-aliased view helpers
	 */
	protected $invokables = array(
		'assets' => 'Fresh\View\Helper\Assets',
	);
	
	/**
	 * Configure service manager
	 *
	 * @param ServiceManager $serviceManager
	 * @return void
	 */
	public function configureServiceManager(ServiceManager $serviceManager)
	{
		foreach ($this->invokables as $name => $service) {
			$serviceManager->setInvokableClass($name, $service);
		}
	}
}