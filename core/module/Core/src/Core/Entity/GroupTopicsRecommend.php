<?php

namespace Core\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * GroupTopicsRecommend
 *
 * @ORM\Table(name="group_topics_recommend", uniqueConstraints={@ORM\UniqueConstraint(name="id_user_topic", columns={"user_id", "topic_id"})}, indexes={@ORM\Index(name="user_id", columns={"user_id"}), @ORM\Index(name="topic_id", columns={"topic_id"})})
 * @ORM\Entity
 */
class GroupTopicsRecommend
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
     * @var string
     *
     * @ORM\Column(name="content", type="string", length=250, nullable=false)
     */
    private $content = '';

    /**
     * @var integer
     *
     * @ORM\Column(name="addtime", type="integer", nullable=false)
     */
    private $addtime = '0';


}
