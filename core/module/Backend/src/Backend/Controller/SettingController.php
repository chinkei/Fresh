<?php

namespace Backend\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class SettingController extends AbstractActionController
{

    public function indexAction()
    {
        return new ViewModel();
    }


}

