<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="${package}.modules.${moduleName}.dao<#if subModuleName??>.${subModuleName}</#if>.${ClassName}Dao">

    <resultMap type="${package}.modules.${moduleName}.entity<#if subModuleName??>.${subModuleName}</#if>.${ClassName}Entity" id="${className}Map">
        <#list columnList as column>
        <result property="${column.attrName}" column="${column.columnName}"/>
        </#list>
    </resultMap>

</mapper>