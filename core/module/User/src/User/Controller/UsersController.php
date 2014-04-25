<?php

namespace User\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class UsersController extends AbstractActionController
{

    public function indexAction()
    {
        return new ViewModel();
    }

	public function loginAction()
	{
		$this->layout('user/layout/layout_admin_login');
		//return new ViewModel('admin_login');
	}
	
	public function logoutAction()
	{
		
	}
}

