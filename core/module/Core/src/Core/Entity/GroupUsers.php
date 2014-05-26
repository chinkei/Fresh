<?php

namespace Core\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * GroupUsers
 *
 * @ORM\Table(name="group_users", uniqueConstraints={@ORM\UniqueConstraint(name="id_user_topic", columns={"user_id", "group_id"})}, indexes={@ORM\Index(name="user_id", columns={"user_id"}), @ORM\Index(name="group_id", columns={"group_id"})})
 * @ORM\Entity
 */
class GroupUsers
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
     * @ORM\Column(name="group_id", type="integer", nullable=false)
     */
    private $groupId = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="is_admin", type="integer", nullable=false)
     */
    private $isAdmin = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="create_time", type="integer", nullable=false)
     */
    private $createTime = '0';


}
