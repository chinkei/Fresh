<?php

namespace Core\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * GroupSetting
 *
 * @ORM\Table(name="group_setting", uniqueConstraints={@ORM\UniqueConstraint(name="key", columns={"key"})})
 * @ORM\Entity
 */
class GroupSetting
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
     * @var string
     *
     * @ORM\Column(name="key", type="string", length=32, nullable=false)
     */
    private $key = '';

    /**
     * @var string
     *
     * @ORM\Column(name="data", type="string", length=255, nullable=false)
     */
    private $data = '';


}
