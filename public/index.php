<?php
define('REQUEST_MICROTIME', microtime(true));

// 定义代码环境常量
define('ENVIRONMENT', isset($_SERVER['FRESH_ENV']) ? $_SERVER['FRESH_ENV'] : 'develop');

/**
 * This makes our life easier when dealing with paths. Everything is relative
 * to the application root now.
 */
chdir(dirname(__DIR__));

$environment = 'develop';
switch ( ENVIRONMENT ) {
	case 'test':
	case 'production':
		$environment = ENVIRONMENT;
		error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED & ~E_STRICT);
		//ini_set('display_errors', 0);
	break;
	
	default:
		$environment = 'develop';
		error_reporting(E_ALL);
		ini_set('display_errors', 1);
	break;
}

// Setup autoloading
require './core/engine/Bootstrap.php';

// Run the application!
Zend\Mvc\Application::init(require "./config/{$environment}.application.config.php")->run();