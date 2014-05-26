Fresh
=====

基于Zend Framework的sns系统项目,前期开发微博、群组....

依赖包需要Composer安装

Doctrine配置
在config/autoload/environments/develop目录下添加local.php
配置项参考
<pre>
<code>
/**
 * Local Configuration Override
 *
 * This configuration override file is for overriding environment-specific and
 * security-sensitive configuration information. Copy this file without the
 * .dist extension at the end and populate values as needed.
 *
 * @NOTE: This file is ignored from Git by default with the .gitignore included
 * in ZendSkeletonApplication. This is a good practice, as it prevents sensitive
 * credentials from accidentally being committed into version control.
 */

return array(
    // Whether or not to enable a configuration cache.
    // If enabled, the merged configuration will be cached and used in
    // subsequent requests.
    //'config_cache_enabled' => false,
    // The key used to create the configuration cache file name.
    //'config_cache_key' => 'module_config_cache',
    // The path in which to cache merged configuration.
    //'cache_dir' =>  './data/cache',
    // ...
    /*
    'db' => array(
        'username' => 'username',
        'password' => 'password',
    ),
    */
    // doctrine Db配置
	'doctrine' => array(
        'connection' => array(
            // Configuration for service `doctrine.connection.orm_default` service
            'orm_default' => array(
                'params' => array(
                    'host'     => 'localhost',
                    'port'     => '3306',
                    'user'     => 'username',
                    'password' => 'password',
                    'dbname'   => 'demo',
                )
            ),
        )
	)
);
</code>
</pre>

