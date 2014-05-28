<?php

namespace User\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use User\Form\SigninForm;
use Zend\Authentication\AuthenticationService;

class UsersController extends AbstractActionController
{

    public function indexAction()
    {
        return new ViewModel();
    }

	public function loginAction()
	{
		$this->layout('user/layout/layout_admin_login');
		
		$form = new SigninForm();
		$request = $this->getRequest();
		
		if($request->isPost())
		{
			$form->setData($request->getPost());
			if($form->isValid())
			{
				$data = $request->getPost()->toArray();
		
				// Criando Storage para gravar sess茫o da authtentica莽茫o
				//$sessionStorage = new SessionStorage();
				$auth = new AuthenticationService();
				//$auth->setStorage($sessionStorage); // Definindo o SessionStorage para a auth
		
				$authAdapter = $this->getServiceLocator()->get('Zf2User\Auth\Adapter');
				$authAdapter->setUsername($data['username']);
				$authAdapter->setPassword($data['password']);
		
				$result = $auth->authenticate($authAdapter);
		
				if ($result->isValid()) {
					$user = $auth->getIdentity();
					$userArray = $user['user'];
					$storage = $auth->getStorage();
					$storage->write($userArray,null);
					$sessionManager = new SessionManager();
					if (isset($data['rememberme'])) {
						$time = 1209600; // 14 days 1209600/3600 = 336 hours => 336/24 = 14 days
						$sessionManager->rememberMe($time);
					} else {
						$time = 86400; // 1day
						$sessionManager->rememberMe($time);
					}
		
					$redirect = $this->UserAuthentication()->getIdentity()->getRole()->getRedirect();
					return $this->redirect()->toRoute($redirect);
				} else {
					$messageResult = $result->getMessages();
					$this->flashMessenger()->addMessage($messageResult[0]);
					return $this->redirect()->toRoute('user-auth');
				}
			}
		}
		if ($this->UserAuthentication()->getIdentity()) {
			$redirect = $this->UserAuthentication()->getIdentity()->getRole()->getRedirect();
			return $this->redirect()->toRoute($redirect);
		} else {
			return new ViewModel(array(
					'form' => $form,
					'flashMessages' => $this->flashMessenger()->getMessages()
			));
		}
		//return new ViewModel('admin_login');
	}
	
	public function logoutAction()
	{
		
	}
}

