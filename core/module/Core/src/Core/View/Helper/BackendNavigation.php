<?php
namespace Core\View\Helper;

use Zend\Navigation\Page\AbstractPage;
use Zend\View\Helper\Navigation\Menu;

class BackendNavigation extends  Menu
{

    /**
     * CSS class to use for the ul element
     *
     * @var string
     */
    protected $ulClass = 'navigation';

    // Public methods:

    public function __construct()
    {
    	$this->addClassToListItem = true;
    	$this->liActiveClass = 'active open';
    }
    
    /**
     * Returns an HTML string containing an 'a' element for the given page if
     * the page's href is not empty, and a 'span' element if it is empty
     *
     * Overrides {@link AbstractHelper::htmlify()}.
     *
     * @param  AbstractPage $page   page to generate HTML for
     * @param bool $escapeLabel     Whether or not to escape the label
     * @return string               HTML string for the given page
     */
    public function htmlify(AbstractPage $page, $escapeLabel = true)
    {
        // get label and title for translating
        $label = $page->getLabel();
        $title = $page->getTitle();

        // translate label and title?
        if (null !== ($translator = $this->getTranslator())) {
            $textDomain = $this->getTranslatorTextDomain();
            if (is_string($label) && !empty($label)) {
                $label = $translator->translate($label, $textDomain);
            }
            if (is_string($title) && !empty($title)) {
                $title = $translator->translate($title, $textDomain);
            }
        }

        // get attribs for element
        $attribs = array(
            'id'   => $page->getId(),
            'title'  => $title,
        );

        // does page have a href?
        $href = $page->getHref();
        if ($href) {

            $element = 'a';
            $attribs['href'] = $href;
            $attribs['target'] = $page->getTarget();
        } else {
            $element = 'span';
        }

        $html = '<' . $element . $this->htmlAttribs($attribs) . '>';
        if($page->icon){
            $html .= '<i class="icon '.$page->icon.'"></i>';
        }
        if ($escapeLabel === true) {
            $escaper = $this->view->plugin('escapeHtml');
            $html .= '<span>'.$escaper($label).'</span>';
        } else {
            $html .= $label;
        }
        $html .= '</' . $element . '>';

        return $html;
    }
/*
    public function title(){
        return $this->getTitle();
    }
*/

}