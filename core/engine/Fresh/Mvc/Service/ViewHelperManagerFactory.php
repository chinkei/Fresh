<?php
namespace Fresh\Mvc\Service;

use Zend\Mvc\Service\ViewHelperManagerFactory as ZendViewHelperManagerFactory;

class ViewHelperManagerFactory extends ZendViewHelperManagerFactory
{
	public function __construct()
	{
		$this->defaultHelperMapClasses[] = 'Fresh\View\HelperConfig';
	}
}