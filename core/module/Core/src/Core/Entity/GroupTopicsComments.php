<?php

namespace Core\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * GroupTopicsComments
 *
 * @ORM\Table(name="group_topics_comments", indexes={@ORM\Index(name="topic_id", columns={"topic_id"}), @ORM\Index(name="user_id", columns={"user_id"}), @ORM\Index(name="parent_id", columns={"parent_id", "topic_id"})})
 * @ORM\Entity
 */
class GroupTopicsComments
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
     * @var integer
     *
     * @ORM\Column(name="topic_id", type="integer", nullable=false)
     */
    private $topicId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="user_id", type="integer", nullable=false)
     */
    private $userId = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="content", type="text", nullable=false)
     */
    private $content;

    /**
     * @var integer
     *
     * @ORM\Column(name="create_time", type="integer", nullable=true)
     */
    private $createTime = '0';


}
