<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2013 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

/**
 * This autoloading setup is really more complicated than it needs to be for most
 * applications. The added complexity is simply to reduce the time it takes for
 * new developers to be productive with a fresh skeleton. It allows autoloading
 * to be correctly configured, regardless of the installation method and keeps
 * the use of composer completely optional. This setup should work fine for
 * most users, however, feel free to configure autoloading however you'd like.
 */
error_reporting(E_ALL | E_STRICT);

// Check php version
if( version_compare(phpversion(), '5.3.3', '<') ) {
	printf('PHP 5.3.3 is required, you have %s', phpversion());
	exit();
}

defined('FRESH_ROOT_PATH')   || define('FRESH_ROOT_PATH', __DIR__);
defined('FRESH_PUBLIC_PATH') || define('FRESH_PUBLIC_PATH', __DIR__ . '/public');
defined('FRESH_LIB_PATH')    || define('FRESH_LIB_PATH', __DIR__ . '/vendor');
defined('FRESH_MODULE_PATH') || define('FRESH_MODULE_PATH', __DIR__ . '/module');
defined('FRESH_CONFIG_PATH') || define('FRESH_CONFIG_PATH', __DIR__ . '/config');

//For ZendDeveloperTools
define('REQUEST_MICROTIME', microtime(true));


require FRESH_LIB_PATH . '/Zend/Loader/AutoloaderFactory.php';
Zend\Loader\AutoloaderFactory::factory(array(
	'Zend\Loader\StandardAutoloader' => array(
		'autoregister_zf' => true,
	)
));

if (!class_exists('Zend\Loader\AutoloaderFactory')) {
	throw new RuntimeException('Unable to load ZF2. Run `php composer.phar install` or define a ZF2_PATH environment variable.');
}

/** Public functions */
function p($data, $usePre = false)
{
	if($usePre || false === method_exists('\Zend\Debug\Debug','dump')){
		echo '<pre>' . print_r($data, true) . '</pre>';
		return;
	}
	\Zend\Debug\Debug::dump($data);
}
// DEBUG
p(Zend\Loader\AutoloaderFactory::getRegisteredAutoloaders());