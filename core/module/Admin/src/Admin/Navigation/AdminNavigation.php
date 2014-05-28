<?php
namespace Admin\Navigation;

use Zend\Navigation\Service\DefaultNavigationFactory;


class AdminNavigation extends DefaultNavigationFactory
{
    /**
     * @var
     */
    protected $pages;
    
    /**
     * @return string
     */
    protected function getName()
    {
        return 'admin_navigation';
    }
}
