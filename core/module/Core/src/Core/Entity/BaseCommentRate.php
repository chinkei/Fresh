<?php

namespace Core\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * BaseCommentRate
 *
 * @ORM\Table(name="base_comment_rate", indexes={@ORM\Index(name="user_id", columns={"user_id"}), @ORM\Index(name="comment_id", columns={"comment_type", "comment_id"})})
 * @ORM\Entity
 */
class BaseCommentRate
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
     * @ORM\Column(name="user_id", type="integer", nullable=false)
     */
    private $userId;

    /**
     * @var string
     *
     * @ORM\Column(name="comment_type", type="string", length=30, nullable=false)
     */
    private $commentType = '';

    /**
     * @var integer
     *
     * @ORM\Column(name="comment_id", type="integer", nullable=false)
     */
    private $commentId = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="rate", type="boolean", nullable=false)
     */
    private $rate = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="created_time", type="integer", nullable=true)
     */
    private $createdTime = '0';


}
