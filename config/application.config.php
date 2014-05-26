<?php

$config = include __DIR__.'/develop.application.config.php';

/**
 * 解决未经过public/index.php其他入口，程序报错问题
 */
\Zend\Loader\AutoloaderFactory::factory(array(
	'Zend\Loader\StandardAutoloader' => array(
		'namespaces' => array(
			'Fresh'  => __DIR__.'/../core/engine/Fresh',
    	),
    	'autoregister_zf' => true,
	)
));

return $config;