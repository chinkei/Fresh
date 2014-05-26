<?php

namespace Core\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * GroupTopics
 *
 * @ORM\Table(name="group_topics", indexes={@ORM\Index(name="group_id", columns={"group_id"}), @ORM\Index(name="user_id", columns={"user_id"}), @ORM\Index(name="title", columns={"title"})})
 * @ORM\Entity
 */
class GroupTopics
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
     * @ORM\Column(name="group_id", type="integer", nullable=false)
     */
    private $groupId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="user_id", type="integer", nullable=false)
     */
    private $userId = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="title", type="string", length=64, nullable=false)
     */
    private $title = '';

    /**
     * @var string
     *
     * @ORM\Column(name="content", type="text", nullable=false)
     */
    private $content;

    /**
     * @var integer
     *
     * @ORM\Column(name="count_comment", type="integer", nullable=false)
     */
    private $countComment = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="count_view", type="integer", nullable=false)
     */
    private $countView = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="count_collect", type="integer", nullable=false)
     */
    private $countCollect = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="count_attach", type="integer", nullable=false)
     */
    private $countAttach = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="count_recommend", type="integer", nullable=false)
     */
    private $countRecommend = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="is_top", type="boolean", nullable=false)
     */
    private $isTop = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="is_audit", type="boolean", nullable=false)
     */
    private $isAudit = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="is_comment", type="boolean", nullable=false)
     */
    private $isComment = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="is_notice", type="boolean", nullable=false)
     */
    private $isNotice = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="is_digest", type="boolean", nullable=false)
     */
    private $isDigest = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="has_video", type="boolean", nullable=false)
     */
    private $hasVideo = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="has_photo", type="boolean", nullable=false)
     */
    private $hasPhoto = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="has_attach", type="boolean", nullable=false)
     */
    private $hasAttach = '0';

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
