<?php
return array(
	'controllers' => array(
		'invokables' => array(
			'admin_dashboard' => 'Admin\Controller\DashboardController'
		)
	),
	'view_manager' => array(
		'template_path_stack' => array(
			__DIR__ . '/../view',
		)
	)
);