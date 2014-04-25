<?php

namespace ProfilerToolbar;

return array(
	'service_manager' => array(
		'factories' => array(
			'ProfilerToolbar\ProfilerCollector' => function ($serviceManager) {
				/* @var \Zend\ServiceManager\ServiceManager $serviceManager */
				/* @var Options $options */
				$options = $serviceManager->get('ProfilerToolbar\Options');
			
				return new Collector\XhprofCollector($options);
			},
			'ProfilerToolbar\Options' => function ($serviceManager) {
				/* @var \Zend\ServiceManager\ServiceManager $serviceManager */
				$config = $serviceManager->get('Configuration');
				$config = isset($config['profiler-toolbar']) ? $config['profiler-toolbar'] : null;
			
				return new Options($config);
			},
		)
	),
	'view_manager' => array(
		'template_path_stack' => array(__DIR__ . '/../view'),
	)
	
);