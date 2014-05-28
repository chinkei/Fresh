<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2013 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

return array(
    'controllers' => array(
        'invokables' => array(
            'Admin\Controller\Dashboard' => 'Admin\Controller\DashboardController',
        	'Admin\Controller\Setting'   => 'Admin\Controller\SettingController'
        ),
    ),
	/**
     * Fresh bakend router
     */
    'router' => array(
        'routes' => array(
            'admin_route' => array(
                'type' => 'Literal',
                'options' => array(
                    'route' => '/admin',
                    'defaults' => array(
                        'controller'    => 'Admin\Controller\Dashboard',
                        'action'        => 'index',
                    ),
                ),
                'may_terminate' => true,
                'child_routes' => array(
                    '_base' => array(
                        'type'    => 'Literal',
                        'options' => array(
                            'route' => '/',
                            'defaults' => array(
                                'controller' => 'Admin\Controller\Setting',
                                'action'     => 'index',
                            ),
                        ),
                    ),
                    'setting_route' => array(
                        'type'    => 'segment',
                        'options' => array(
                            'route' => '/setting[/:action][/:id][/:id_parent]',
                            'constraints' => array(
                                'action'    => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'id'        => '[0-9]+',
                                'id_parent' => '[0-9]+',
                            ),
                            'defaults' => array(
                                'controller'    => 'Admin\Controller\Setting',
                                'action'        => 'index',
                            ),
                        ),
                    ),
                ),
            ),
        ),
    ),
    'view_manager' => array(
        'template_path_stack' => array(
            __DIR__ . '/../view',
        ),
    ),
    /**
     * Backend Navigation
     */
    'navigation' => array(
        'admin_navigation' => array(
            'Admin' => array(
                'icon'  => 'icon-cog',
                'label' => 'Global System',
                'route' => 'admin_route/setting_route',
                'order' => 2,
                'class' => 'submenu',
                'pages' => array(
                    'users_route'  => array(
                        'order' =>1,
                        'icon'  => '&#xe1e1;',
                        'label' => 'Users',
                        'route' => 'admin_route/setting_route',
                    ),
                    'languages' => array(
                        'order' =>2,
                        'icon'  => '&#xe07e;',
                        'label' => 'Languages',
                        'route' => 'admin_route/setting_route',
                    ),
                    'parameters' => array(
                        'order' =>3,
                        'icon'  => '&#xe141;',
                        'label' => 'Parameters',
                        'route' => 'admin_route/setting_route',
                    ),
                    'translator' => array(
                        'order' =>3,
                        'icon'  => '&#xe12c;',
                        'label' => 'Translator',
                        'route' => 'admin_route/setting_route',
                    ),
                    /*'utilities' => array(
                          'icon'  => '&#xe13c;',
                          'label' => 'Utilities',
                          'route' => 'system_route/qu_ico_moon_route',
                          'order' =>100,
                          'pages' => array(*/

                    /*),
                ),*/
                    'cgmconfigadmin' => array(
                        'order' =>10,
                        'icon'   =>'&#xe13c;',
                        'label' => 'ConfigAdmin',
                        'route' => 'admin_route/setting_route',

                    ),
                ),
            ),
            'dashboard' => array(
                'icon'  => 'icon-home',
                'label' => 'Dashboard',
                'route' => 'admin_route',
                'order' => 1,
             ),
             'user_profiles' => array(
             	'icon'  => 'icon-user',
             	'label' => 'User & Permissions',
             	'route' => 'admin_route',
             	'order' => 3,
             ),
             'content' => array(
                'icon'  => 'icon-file',
                'label' => 'Content Management',
                'route' => 'admin_route',
                'order' => 4,
             ),
             'replay' => array(
             	'icon'  => 'icon-pencil',
             	'label' => 'Reply Management',
             	'route' => 'admin_route',
             	'order' => 5,
             ),
             'app' => array(
             	'icon'  => 'icon-briefcase',
             	'label' => 'App Management',
             	'route' => 'admin_route',
             	'order' => 6,
             ),
        ),
    ),
    
    /**
     * Fresh Strategy Config
     */
    'FreshConfig' => array(
        // NAMESPACE Layout Module
        'Layout' => array(
        	'Admin' => 'admin/layout/layout',
        ),

        // NAMESPACE Base Path Module
        'BasePath' => array(
        ),

        // NAMESPACE Redirect login
        'RedirectLogin' => array(
           'Admin' => true,
        ),
    ),
);
