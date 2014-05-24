<?php
// Check php version
if( version_compare(phpversion(), '5.3.3', '<') ) {
	printf('PHP 5.3.3 is required, you have %s', phpversion());
	exit();
}

// Root Path
defined('FRESH_ROOT_PATH') || define('FRESH_ROOT_PATH', dirname(dirname(__DIR__)));
// Directory Separator
defined('DS') || define('DS', DIRECTORY_SEPARATOR);

// Composer autoloading
if ( file_exists(FRESH_ROOT_PATH.DS.'vendor/autoload.php') ) {
	require FRESH_ROOT_PATH.DS.'vendor/autoload.php';
}

if (!class_exists('Zend\Loader\AutoloaderFactory')) {
	throw new RuntimeException('Unable to load ZF2. Run `php composer.phar install` or define a ZF2_PATH environment variable.');
}

Zend\Loader\AutoloaderFactory::factory(array(
	'Zend\Loader\StandardAutoloader' => array(
		'namespaces' => array(
			'Fresh'  => FRESH_ROOT_PATH.DS.'core/engine/Fresh',
    	),
    	'autoregister_zf' => true,
	)
));

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
        
        return true;
    }
    \Zend\Debug\Debug::dump($data);
}

// DEBUG
//debug(Zend\Loader\AutoloaderFactory::getRegisteredAutoloaders());