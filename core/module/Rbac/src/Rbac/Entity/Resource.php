<?php
namespace Rbac\Entity;

use Doctrine\ORM\Mapping as ORM;
use Zend\Stdlib\Hydrator;

/**
* Privilege
*
* @ORM\Table(name="acl_privilege")
* @ORM\Entity
* @ORM\HasLifecycleCallbacks
* @ORM\Entity(repositoryClass="Zf2Acl\Entity\PrivilegeRepository")
*/
class Privilege
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
* @ORM\Column(name="name", type="string", length=255, nullable=false)
*/
    private $name;

    /**
* @var \DateTime
*
* @ORM\Column(name="created", type="datetime", nullable=false)
*/
    private $created;

    /**
* @var \DateTime
*
* @ORM\Column(name="updated", type="datetime", nullable=false)
*/
    private $updated;

    /**
* @var \Zf2Acl\Entity\Resource
*
* @ORM\ManyToOne(targetEntity="Zf2Acl\Entity\Resource")
* @ORM\JoinColumns({
* @ORM\JoinColumn(name="resource_id", referencedColumnName="id", onDelete="CASCADE", nullable=false)
* })
*/
    private $resource;

    /**
* @var \Zf2Acl\Entity\Role
*
* @ORM\ManyToOne(targetEntity="Zf2Acl\Entity\Role")
* @ORM\JoinColumns({
* @ORM\JoinColumn(name="role_id", referencedColumnName="id", onDelete="CASCADE", nullable=false)
* })
*/
    private $role;

    /**
* Constructor
*/
    public function __construct($options = array())
    {
        $hydrator = new Hydrator\ClassMethods();
        $hydrator->hydrate($options, $this);

        $this->created = new \DateTime("now");
        $this->updated = new \DateTime("now");
    }

    /**
* Get id
*
* @return integer
*/
    public function getId()
    {
        return $this->id;
    }

    /**
* Set name
*
* @param string $name
* @return Privilege
*/
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
* Get name
*
* @return string
*/
    public function getName()
    {
        return $this->name;
    }

    /**
* Set created
*
* @param \DateTime $created
* @return Privilege
*/
    public function setCreated()
    {
        $this->created = new \DateTime("now");

        return $this;
    }

    /**
* Get created
*
* @return \DateTime
*/
    public function getCreated()
    {
        return $this->created;
    }

    /**
* Set updated
*
* @ORM\PrePersist
* @param \DateTime $updated
* @return Privilege
*/
    public function setUpdated()
    {
        $this->updated = new \DateTime("now");

        return $this;
    }

    /**
* Get updated
*
* @return \DateTime
*/
    public function getUpdated()
    {
        return $this->updated;
    }

    /**
* Set resource
*
* @param \Zf2Acl\Entity\Resource $resource
* @return Privilege
*/
    public function setResource(\Zf2Acl\Entity\Resource $resource = null)
    {
        $this->resource = $resource;

        return $this;
    }

    /**
* Get resource
*
* @return \Zf2Acl\Entity\Resource
*/
    public function getResource()
    {
        return $this->resource;
    }

    /**
* Set role
*
* @param \Zf2Acl\Entity\Role $role
* @return Privilege
*/
    public function setRole(\Zf2Acl\Entity\Role $role = null)
    {
        $this->role = $role;

        return $this;
    }

    /**
* Get role
*
* @return \Zf2Acl\Entity\Role
*/
    public function getRole()
    {
        return $this->role;
    }

    /*
* toArray
*/
    public function toArray()
    {
        $hydrator = new Hydrator\ClassMethods();
        $array = $hydrator->extract($this);
        $array['role'] = $this->getRole()->getId();
        $array['resource'] = $this->getResource()->getId();

        return $array;
    }
}