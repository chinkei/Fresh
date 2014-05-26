<?php

namespace Core\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Group
 *
 * @ORM\Table(name="group", indexes={@ORM\Index(name="user_id", columns={"user_id"}), @ORM\Index(name="group_name", columns={"group_name"})})
 * @ORM\Entity
 */
class Group
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
     * @ORM\Column(name="cate_id", type="integer", nullable=false)
     */
    private $cateId = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="group_name", type="string", length=32, nullable=false)
     */
    private $groupName = '';

    /**
     * @var string
     *
     * @ORM\Column(name="group_desc", type="text", nullable=false)
     */
    private $groupDesc;

    /**
     * @var string
     *
     * @ORM\Column(name="group_icon", type="string", length=255, nullable=true)
     */
    private $groupIcon = '';

    /**
     * @var integer
     *
     * @ORM\Column(name="count_topic_today", type="integer", nullable=false)
     */
    private $countTopicToday = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="count_topic", type="integer", nullable=false)
     */
    private $countTopic = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="count_user", type="integer", nullable=false)
     */
    private $countUser = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="role_name_user", type="string", length=32, nullable=false)
     */
    private $roleNameUser = '成员';

    /**
     * @var boolean
     *
     * @ORM\Column(name="is_recommend", type="boolean", nullable=false)
     */
    private $isRecommend = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="is_open", type="boolean", nullable=false)
     */
    private $isOpen = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="is_audit", type="boolean", nullable=false)
     */
    private $isAudit = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="is_post", type="boolean", nullable=false)
     */
    private $isPost = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="create_time", type="integer", nullable=true)
     */
    private $createTime = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="update_time", type="integer", nullable=false)
     */
    private $updateTime = '0';


}
