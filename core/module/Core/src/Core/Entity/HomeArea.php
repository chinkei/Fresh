<?php

namespace Core\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * HomeArea
 *
 * @ORM\Table(name="home_area", indexes={@ORM\Index(name="parent_id", columns={"parent_id"}), @ORM\Index(name="level", columns={"level"}), @ORM\Index(name="name", columns={"name"})})
 * @ORM\Entity
 */
class HomeArea
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
     * @ORM\Column(name="name", type="string", length=50, nullable=false)
     */
    private $name = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="name_path", type="string", length=256, nullable=false)
     */
    private $namePath = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="path", type="string", length=256, nullable=false)
     */
    private $path = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="level", type="boolean", nullable=false)
     */
    private $level = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="status", type="boolean", nullable=false)
     */
    private $status = '1';


}
