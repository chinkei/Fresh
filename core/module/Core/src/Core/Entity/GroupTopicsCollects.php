<?php

namespace Core\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * GroupTopicsCollects
 *
 * @ORM\Table(name="group_topics_collects", uniqueConstraints={@ORM\UniqueConstraint(name="id_user_topic", columns={"user_id", "topic_id"})}, indexes={@ORM\Index(name="user_id", columns={"user_id"}), @ORM\Index(name="topic_id", columns={"topic_id"})})
 * @ORM\Entity
 */
class GroupTopicsCollects
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
    private $userId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="topic_id", type="integer", nullable=false)
     */
    private $topicId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="create_time", type="integer", nullable=false)
     */
    private $createTime = '0';


}
