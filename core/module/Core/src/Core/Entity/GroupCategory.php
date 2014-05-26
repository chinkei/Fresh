<?php

namespace Core\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * GroupCategory
 *
 * @ORM\Table(name="group_category", indexes={@ORM\Index(name="category_name", columns={"category_name"})})
 * @ORM\Entity
 */
class GroupCategory
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var integer
     *
     * @ORM\Column(name="parent_id", type="integer", nullable=false)
     */
    private $parentId = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="category_name", type="string", length=32, nullable=false)
     */
    private $categoryName = '';

    /**
     * @var boolean
     *
     * @ORM\Column(name="sort_id", type="boolean", nullable=false)
     */
    private $sortId = '0';


}
