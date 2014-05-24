<?php
namespace Core\Navigation;

use Zend\Navigation\Service\DefaultNavigationFactory;


/**
 * Class QuAdminNavigation
 * @package QuAdmin\Navigation
 */
class BackendNavigation extends DefaultNavigationFactory
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
        return 'backend_navigation';
    }
}
