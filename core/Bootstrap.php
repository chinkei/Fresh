<?php
error_reporting(E_ALL);

// Check php version
if( version_compare(phpversion(), '5.3.3', '<') ) {
	printf('PHP 5.3.3 is required, you have %s', phpversion());
	exit();
}

// For ZendDeveloperTools
defined('REQUEST_MICROTIME') || define('REQUEST_MICROTIME', microtime(true));
// Root Path
defined('FRESH_ROOT_PATH') || define('FRESH_ROOT_PATH', dirname(__DIR__));
// Directory Separator
defined('DS') || define('DS', DIRECTORY_SEPARATOR);

// 目录配置.
$paths['config']  = 'config';
$paths['data']    = 'data';
$paths['vendor']  = 'vendor';
$paths['webroot'] = 'webrot';

foreach ($paths as $name => $path) {
    if ( ! isset($GLOBALS['fresh_paths'][$name])) {
        $GLOBALS['fresh_paths'][$name] = FRESH_ROOT_PATH.DS.$path.DS;
    }
}

/**
 * 获取一个全局路径项
 *
 * @param  string  $path
 * @return string
 */
function path($path)
{
    return $GLOBALS['fresh_paths'][$path];
}

/**
 * 设置一个全局路径项.
 *
 * @param  string  $path
 * @param  string  $value
 * @return void
 */
function set_path($path, $value)
{
    $GLOBALS['fresh_paths'][$path] = $value;
}

/**
 * 输出调试参数信息
 * 
 * @param  array  $data
 * @param  bool   $usePre
 * @return void
 */
function debug($data, $usePre = false)
{
    if($usePre || false === method_exists('\Zend\Debug\Debug','dump')){
        echo '<pre>' . print_r($data, true) . '</pre>';
        return;
    }
    \Zend\Debug\Debug::dump($data);
}

// 加载Autoloader Factory
require path('vendor') . '/Zend/Loader/AutoloaderFactory.php';

if (!class_exists('Zend\Loader\AutoloaderFactory')) {
	throw new RuntimeException('Unable to load ZF2. Run `php composer.phar install` or define a ZF2_PATH environment variable.');
}

Zend\Loader\AutoloaderFactory::factory(array(
	'Zend\Loader\StandardAutoloader' => array(
		'autoregister_zf' => true,
	)
));

// DEBUG
//debug(Zend\Loader\AutoloaderFactory::getRegisteredAutoloaders());