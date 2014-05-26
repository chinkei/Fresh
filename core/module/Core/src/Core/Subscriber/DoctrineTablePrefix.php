<?php
/**
 * Fresh Engine
 * 
 * DoctrineTablePrefix.php 2014-5-25 下午8:15:06
 * 
 * @link		http://github.com/chinkei/Fresh
 * @copyright	Copyright (c) Fresh
 * @license		New BSD License
 */

namespace Core\Subscriber;

use Doctrine\ORM\Event\LoadClassMetadataEventArgs;

/**
 * 表前缀类
 * 
 * @author chinkei
 */
class DoctrineTablePrefix implements \Doctrine\Common\EventSubscriber
{
	protected $_prefix = 'fh_';
	
	public function setPrefix($prefix)
	{
		$this->_prefix = (string)$prefix;
	}
	
	public function getSubscribedEvents()
	{
		return array('loadClassMetadata');
	}
	 
	public function loadClassMetadata(LoadClassMetadataEventArgs $args)
	{
		$classMetadata = $args->getClassMetadata();
	
		// 已经处理过前缀，不再进行处理
		if ( $classMetadata->isInheritanceTypeSingleTable() && !$classMetadata->isRootEntity() ) {
			return true;
		}
		
		if ( $this->_prefix ) {
			
			$tableName = $classMetadata->getTableName();
			$lenPrefix = strlen($this->_prefix);
			
			// if 数据库导入到Entity else Entity导入数据库
			if ( substr($tableName, 0, $lenPrefix) == $this->_prefix ) {
				
				$tableName = substr($tableName, $lenPrefix);
				$strHuman  = str_replace(' ', '', ucwords( str_replace('_', ' ', $tableName ) ) );
				
				$classMetadata->name = $classMetadata->rootEntityName = $classMetadata->namespace.'\\'.$strHuman;
				
			} else {
				$tableName = $this->_prefix . $tableName;
				
				foreach ($classMetadata->getAssociationMappings() as $fieldName => $mapping) {
					
					if ($mapping['type'] == \Doctrine\ORM\Mapping\ClassMetadataInfo::MANY_TO_MANY
						&& isset($classMetadata->associationMappings[$fieldName]['joinTable']['name'])) {
						
						$mappedTableName = $classMetadata->associationMappings[$fieldName]['joinTable']['name'];
						$classMetadata->associationMappings[$fieldName]['joinTable']['name'] = $this->_prefix . $mappedTableName;
					}
				}
			}
			
			// 设置新的table name
			$classMetadata->setPrimaryTable(array('name' => $tableName));
		}
	}
}