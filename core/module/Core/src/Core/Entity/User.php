<?php

namespace Core\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * User
 *
 * @ORM\Table(name="user", indexes={@ORM\Index(name="status", columns={"status"})})
 * @ORM\Entity
 */
class User
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
     * @ORM\Column(name="user_name", type="string", length=16, nullable=false)
     */
    private $userName;

    /**
     * @var string
     *
     * @ORM\Column(name="email", type="string", length=32, nullable=false)
     */
    private $email;

    /**
     * @var integer
     *
     * @ORM\Column(name="invite_from_user_id", type="integer", nullable=false)
     */
    private $inviteFromUserId = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="sex", type="boolean", nullable=false)
     */
    private $sex = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="phone", type="string", length=16, nullable=false)
     */
    private $phone = '';

    /**
     * @var integer
     *
     * @ORM\Column(name="role_id", type="integer", nullable=false)
     */
    private $roleId = '1';

    /**
     * @var integer
     *
     * @ORM\Column(name="area_id", type="integer", nullable=false)
     */
    private $areaId = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="path", type="string", length=32, nullable=false)
     */
    private $path = '';

    /**
     * @var string
     *
     * @ORM\Column(name="face", type="string", length=64, nullable=false)
     */
    private $face = '';

    /**
     * @var string
     *
     * @ORM\Column(name="signed", type="string", length=64, nullable=false)
     */
    private $signed = '';

    /**
     * @var string
     *
     * @ORM\Column(name="blog", type="string", length=32, nullable=false)
     */
    private $blog = '';

    /**
     * @var string
     *
     * @ORM\Column(name="about", type="string", length=255, nullable=false)
     */
    private $about = '';

    /**
     * @var string
     *
     * @ORM\Column(name="last_login_ip", type="string", length=16, nullable=false)
     */
    private $lastLoginIp = '';

    /**
     * @var string
     *
     * @ORM\Column(name="address", type="string", length=64, nullable=false)
     */
    private $address = '';

    /**
     * @var integer
     *
     * @ORM\Column(name="count_login", type="integer", nullable=false)
     */
    private $countLogin = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="count_score", type="integer", nullable=false)
     */
    private $countScore = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="count_follow", type="integer", nullable=false)
     */
    private $countFollow = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="count_followed", type="integer", nullable=false)
     */
    private $countFollowed = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="status", type="boolean", nullable=false)
     */
    private $status = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="is_admin", type="boolean", nullable=false)
     */
    private $isAdmin = '0';

    /**
     * @var boolean
     *
     * @ORM\Column(name="is_verify", type="boolean", nullable=false)
     */
    private $isVerify = '0';

    /**
     * @var string
     *
     * @ORM\Column(name="verify_code", type="string", length=11, nullable=false)
     */
    private $verifyCode = '';

    /**
     * @var string
     *
     * @ORM\Column(name="reset_pwd", type="string", length=32, nullable=false)
     */
    private $resetPwd = '';

    /**
     * @var string
     *
     * @ORM\Column(name="reset_code", type="string", length=32, nullable=false)
     */
    private $resetCode = '';

    /**
     * @var integer
     *
     * @ORM\Column(name="reset_valid_time", type="integer", nullable=false)
     */
    private $resetValidTime = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="reg_ip", type="bigint", nullable=false)
     */
    private $regIp = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="reg_time", type="integer", nullable=false)
     */
    private $regTime = '0';

    /**
     * @var integer
     *
     * @ORM\Column(name="last_login_time", type="integer", nullable=true)
     */
    private $lastLoginTime = '0';


}
